# +CM #
MATLAB git submodule package with common colormaps used by Max at NML.

## Code ##
This should be a relatively small submodule, with a few functions and one main class.  
Generally, the idea is to generate some colormap of interest with whatever number of discrete points are desired. That should be done using [`cm.map` or `cm.umap`](#functions). To handle interpolation between values in the desired colormap, you can instantiate a [`cm.cmap`](#classes) object, using the colormap you've created in its constructor.

### Functions ###
* [`map`](map.m) - Returns custom colormap data.
* [`umap`](umap.m) - Returns custom colormap data based on a single fixed color.  

### Classes ###
* [`cmap`](cmap.m) - This just handles interpolating between discrete colormap indexed values.  

## Example 1 ##  
First, I can get a list of what default colormaps are available:  
```(matlab)
cm.map('help');
```
Now, I pick a value from the list and generate a colormap. Any color data map returned by `cm.map` will be size `[256, 3]`. However, maybe I want to interpolate between only a few discrete values, along that custom map (for example lets say I have 8 discrete classes). To do that, I'll get the color data map first, and then use a `cm.cmap` object to handle interpolation:  
```(matlab)
cmapdata = cm.map('rosette');
cmobj = cm.cmap([1, 8], cmapdata);
```  
That's it! Now, to get a color value for some intermediate index (let's use 5 in this example), I can simply do:  
```(matlab)
color = cmobj(5); % [r, g, b] as uint8
```  
Note that this strategy will work for non-integer values on the domain [1, 8] as well.  

## Example 2 ##
To generate and visualize a quick-and-dirty colormap using a single color value that is scaled from dark to light, try the following:  
```(matlab)
my_custom_map = cm.umap("#FF0000");
fig = figure; 
ax = axes(fig);
C = reshape(my_custom_map, 1, 256, 3);
imagesc(ax, [1 256], [0 1], C);
```  
You can swap in different colors in the first line, as desired.  

## Troubleshooting ##
### All graphics are only white or black? ###
If you're setting a color property but only get objects that are white/black or discrete "R" / "G" / "B" values, it's likely the case that the graphics object expects a value between 0 and 1 for color values. In that case, referring to the end of the [first example](#example-1) section, you would modify like:  
```(matlab)
dcolor = double(color) ./ 255.0;
```
Now, the `dcolor` variable should scale on the correct range and fix the issue.  

function cmapdata = umap(color, n, alpha)
%UMAP Returns custom colormap data based on a single fixed color.
%
% Syntax:
%   cmapdata = cm.umap(color);
%   cmapdata = cm.umap(color, n, alpha);
%
% Example 1:  
%   cmapdata = cm.umap("#FF0000");
%   C = reshape(cmapdata, 1, 256, 3);
%   figure; imagesc([1 256], [0 1], C);
%
% Example 2:
%   cmapdata = cm.umap([0.8 0.1 0.1], 16);
%   C = reshape(cmapdata, 1, 16, 3);
%   figure; imagesc([1 16], [0 1], C);
%
% Inputs:
%   color - [R,G,B] value, or hex color string (e.g. "#FF0000")
%   n     - (Optional: default is 256) Number of colormap elements to return
%   alpha - (Optional: default is 0.125) Value between 0.05 and 0.95
%                   indicating where the interpolation from white-to-color 
%                   vs. color-to-black occurs.
%
% Output:
%   cmapdata - [256, 3] uint8 array to use for colormap, which scales from
%              black (cmapdata(1,:) is always [0, 0, 0]) to white
%              (cmapdata(256, :)) is always [255, 255, 255]), with the
%              mid-range values interpolating from black to the
%              user-specified input `color` and back from `color` to white.
%
% See also: Contents, cm.map, cm.cmap

arguments
    color
    n (1,1) double = 256
    alpha (1,1) double {mustBeInRange(alpha, 0.05, 0.95)} = 0.125;
end

cfixed = double(validatecolor(color)) .* 255.0;
ifixed = max(round(alpha * n),2);

cmapdata = nan(n, 3);
for ii = 1:3
    cmapdata(1:ifixed,   ii) = interp1([1,   ifixed], [0,   cfixed(ii)],   1:ifixed, "linear");
    cmapdata((ifixed+1):n, ii) = interp1([ifixed+1, n], [cfixed(ii), 255], (ifixed+1):n, "linear");
end
cmapdata = uint8(round(cmapdata));

end
function [cg,ct] = cdata_grid(grid_rows, grid_cols, options)
%CDATA_GRID Returns grid_cols x 3 x grid_rows colormaps for `grid_rows` unique base colors.
%
% Syntax:
%   [cg,ct] = cm.cdata_grid(grid_rows, grid_cols, 'Name', value, ...);
%
% Outputs:
%   cg - nMonochrome x 3 x nBase color cdata grid array of double ([0,1]
%           range) RGB color values.
%   ct - nMonochrome x 3 x nBase color cdata grid array of double ([0,1]
%           range) RGB text colors associated with the color grid. 

arguments
    grid_rows (1,1) double {mustBePositive, mustBeInteger} % Number of grid rows: determines # unique base colors in grid
    grid_cols (1,1) double {mustBePositive, mustBeInteger} % Number of grid columns: determines monochrome shading number of colors for each base
    options.Colormap {mustBeTextScalar} = 'rosette';
    options.Alpha (1,1) double {mustBeInRange(options.Alpha, 0.05, 0.95)} = 0.125;
    options.DropFirstN (1,1) double {mustBeInteger} = 2;
    options.DropLastN (1,1) double {mustBeInteger} = 2;
    options.GrayThreshold (1,1) double {mustBeInRange(options.GrayThreshold,0,1)} = 0.65;
end

tmp = cm.map(options.Colormap, 'DataType', 'double', 'N', grid_rows);

nGrid = options.DropFirstN + options.DropLastN + grid_cols;
vec = (options.DropFirstN+1):(nGrid-options.DropLastN);

cg = zeros(grid_cols, 3, grid_rows);
ct = zeros(size(cg));
for ii = 1:grid_rows
    tmp2 = double(cm.umap(tmp(ii,:),nGrid,options.Alpha))./255.0;
    cg(:,:,ii) = tmp2(vec,:);
    ct(:,:,ii) = ones(1,3).*double(rgb2gray(tmp2(vec,:)) < options.GrayThreshold);
end

end
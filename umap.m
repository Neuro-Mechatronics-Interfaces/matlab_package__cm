function cmapdata = umap(color)
%UMAP Returns custom colormap data based on a single fixed color.
%
% Syntax:
%   cmapdata = cm.umap(color);
%
% Example:  
%   cmapdata = cm.umap("#FF0000");
%   C = reshape(cmapdata, 1, 256, 3);
%   figure; imagesc([1 256], [0 1], C);
%
% Inputs:
%   color - [R,G,B] value, or hex color string (e.g. "#FF0000")
%
% Output:
%   cmapdata - [256, 3] uint8 array to use for colormap, which scales from
%              black (cmapdata(1,:) is always [0, 0, 0]) to white
%              (cmapdata(256, :)) is always [255, 255, 255]), with the
%              mid-range values interpolating from black to the
%              user-specified input `color` and back from `color` to white.
%
% See also: Contents, cm.map, cm.cmap

cfixed = double(validatecolor(color)) .* 255.0;

cmapdata = nan(256, 3);
for ii = 1:3
    cmapdata(1:200,   ii) = interp1([1,   200], [0,   cfixed(ii)],   1:200, "linear");
    cmapdata(201:256, ii) = interp1([201, 256], [cfixed(ii), 255], 201:256, "linear");
end
cmapdata = uint8(round(cmapdata));

end
function cmap = blue2red(n)
%BLUE2RED  Blue-to-red colormap with distinguishable colors
%
%   cmap = cm.blue2red(n)
%
%   Inputs:
%       n - (optional) number of colors, default = 256
%
%   Output:
%       cmap - n×3 colormap array [R G B]
%
%   Example (get colors for desired number of categories):
%       n = 12; % Number of desired colors
%       test_cm = cm.blue2red(n);
%       fig = figure('Color','w'); 
%       ax = axes(fig,'NextPlot','add', ...
%           'XLim',[0.5 1.5],'YLim',[0.5, n + 0.5], ...
%           'XColor','none','YColor','k', ...
%           'YDir', 'normal', 'YTick', [1 n]); 
%       imagesc(ax,reshape(test_cm,[],1,3));
%       title(ax,sprintf("colormap: blue2red(%d)",n)); 

arguments
    n (1,1) double {mustBePositive, mustBeInteger} = 256;
end

% Define endpoints: strong blue to strong red
c1 = [0.1 0.2 0.9]; % dark blue (not too dark)
c2 = [0.9 0.1 0.1]; % dark red (not too dark)

% Interpolate linearly in RGB
cmap = [linspace(c1(1), c2(1), n)', ...
    linspace(c1(2), c2(2), n)', ...
    linspace(c1(3), c2(3), n)'];
end

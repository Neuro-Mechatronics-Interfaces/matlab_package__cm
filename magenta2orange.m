function cmap = magenta2orange(n)
%MAGENTA2ORANGE  Magenta-to-orange colormap with distinguishable colors
%
%   cmap = cm.magenta2orange(n)
%
%   Inputs:
%       n - (optional) number of colors, default = 256
%
%   Output:
%       cmap - n×3 colormap array [R G B]
%
%   Example (get colors for desired number of categories):
%       n = 12; % Number of desired colors
%       test_cm = cm.magenta2orange(n);
%       fig = figure('Color','w'); 
%       ax = axes(fig,'NextPlot','add', ...
%           'XLim',[0.5 1.5],'YLim',[0.5, n + 0.5], ...
%           'XColor','none','YColor','k', ...
%           'YDir', 'normal', 'YTick', [1 n]); 
%       imagesc(ax,reshape(test_cm,[],1,3));
%       title(ax,sprintf("colormap: magenta2orange(%d)",n)); 
%
%   See also: blue2red

arguments
    n (1,1) double {mustBePositive, mustBeInteger} = 256;
end

% Define endpoints: strong magenta to strong orange
c1 = [0.85 0.1 0.85]; % magenta (not too light)
c2 = [1.0 0.5 0.1];   % orange (saturated but not washed out)

% Interpolate linearly in RGB
cmap = [linspace(c1(1), c2(1), n)', ...
        linspace(c1(2), c2(2), n)', ...
        linspace(c1(3), c2(3), n)'];
end

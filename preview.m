function fig = preview(cg, ct, options)
%PREVIEW  Preview cdata grid (e.g. as returned by cm.cdata_grid).
%
% Syntax:
%   fig = cm.preview(cg);
%   fig = cm.preview(cg,ct);
%   fig = cm.preview(cg,[],'Name', value, ...);
%
% Inputs:
%   cg - As returned by `cm.cdata_grid`, nMonochrome x 3 x nBaseColors
%           cdata grid, with double values in range [0, 1].
%   ct - (Optional) Array of matched text colors for grid (second output
%           returned by `cm.cdata_grid`).
%  
% Options:
%   'GrayThreshold' - Value in range [0,1] (Default = 0.65) for determining
%                       if text is white ( < GrayThreshold) or black.
%
% Output:
%   fig - Figure handle with subplot panels showing what the palette looks
%           like.
%
% See also: Contents

arguments
    cg
    ct
    options.GrayThreshold (1,1) double {mustBeInRange(options.GrayThreshold,0,1)} = 0.65;
end

[nMono,~,nBase] = size(cg);
if (nargin < 2) || isempty(ct)
    ct = zeros(size(cg));
    for ii = 1:nMono
        ct(:,:,ii) = ones(nBase,3).*double(rgb2gray(cg(:,:,ii)) < options.GrayThreshold);
    end
end

fig = figure('Color', 'w', 'Name', 'CData-Grid Preview', ...
    'Position',[300, 500, 150+(140*nBase) 250]);
L = tiledlayout(fig,1,nBase,'TileSpacing','compact','Padding','tight');
for ii = 1:nBase
    ax = nexttile(L);
    set(ax,'NextPlot','add','YDir','reverse','XColor','none','YColor','none', ...
        'XLim',[0, 1], 'YLim', [0.5, nMono+0.5]);
    imagesc(ax,[0 1],[1,nMono],reshape(cg(:,:,ii),nMono,1,3));

    for ik = 1:nMono
        c_txt = ct(ik,:,ii);
        text(ax, 0.5, ik, sprintf("cg(%d,:,1)", ik), ...
            'Color', c_txt, 'FontName', 'Consolas', ...
            'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle');
    end
    title(ax, sprintf('cg(:,:,%d)', ii), ...
        'FontName', 'Consolas', 'Color', 'k');
end


end
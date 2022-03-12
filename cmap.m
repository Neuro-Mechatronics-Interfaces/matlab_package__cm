classdef cmap < handle
    %CMAP  Handle class for RBG color map interpolation
    
    properties (Access=protected)
        CLim = [-1 1]  % Color map data limits. Set this to whatever axes colormap limits are. 
        cmapdata       % Color map rgb array. This determines actual RGB colors that are interpolated between.
    end
    
    properties (GetAccess=public, SetAccess=protected)
        red
        green
        blue
    end
    
    methods
        function obj = cmap(CLim, cmapdata)
            %CMAP  Construct an instance of this class
            %
            % Syntax:
            %   obj = cmap(CLim); % Use default 'bluered' cmap
            %   obj = cmap(CLim, cmapdata);
            %
            % Inputs:
            %   CLim - Colorbar limits for interpolated values.
            %   cmapdata - The actual colormap to be interpolated between.
            %
            % Output:
            %   obj - The `cmap` handle object. This is used to produce
            %           [r,g,b] values based on the colormap of one axes,
            %           to color a second thing that isn't necessarily on
            %           the same color scale on a different axes (e.g. to
            %           superimpose patch electrodes on 3D plot).
            %
            % See also: Contents, cmap
            if nargin < 2
                cmapdata = cm.map('bluered'); 
            end
            
            obj.CLim = CLim;
            obj.update_map(cmapdata);
        end
        
        function out = subsref(obj, S)
            %SUBSREF  Overload subsref so that `obj(x)` returns [r,g,b].
            
            if strcmp(S(1).type,'()')
                if numel(S.subs) > 1
                    out = builtin('subsref', obj, S);
                else
                    x = S.subs{1};
                    out = [uint8(round(obj.red(x))), uint8(round(obj.green(x))), uint8(round(obj.blue(x)))];
                end
            else
                out = builtin('subsref', obj, S);
            end
        end
        
        function update_map(obj, cmapdata)
            %UPDATE_MAP  Updates the actual colormap values
            %
            % Syntax:
            %   obj.update_map(cmapdata);
            %
            % Inputs:
            %   cmapdata - [nColors x 3] mapping for [r, g, b] values.
            %               -> Row 1 is the "low" end of scale for mapping.
            %               -> Row `nColors` is the "high" end.
            %
            % This updates the .red, .green, and .blue properties, which
            % are `fitobj` objects that perform a 'smoothingspline'
            % regression to fit the rgb values.
            N = size(cmapdata, 1);
            obj.cmapdata = double(cmapdata);
            obj.red = fit(linspace(obj.CLim(1), obj.CLim(2), N)', obj.cmapdata(:, 1), 'smoothingspline');
            obj.green = fit(linspace(obj.CLim(1), obj.CLim(2), N)', obj.cmapdata(:, 2), 'smoothingspline');
            obj.blue = fit(linspace(obj.CLim(1), obj.CLim(2), N)', obj.cmapdata(:, 3), 'smoothingspline');
            
        end
        
        function update_limits(obj, CLim)
            %UPDATE_LIMITS  Updates limits for setting colormap
            %
            % Syntax:
            %   obj.update_limits(CLim);
            %
            % Example:
            %   obj.update_limits([0, 100]); % Updates colormap limits
            N = size(obj.cmapdata, 1);
            obj.CLim = CLim;
            obj.red = fit(linspace(obj.CLim(1), obj.CLim(2), N)', obj.cmapdata(:, 1), 'smoothingspline');
            obj.green = fit(linspace(obj.CLim(1), obj.CLim(2), N)', obj.cmapdata(:, 2), 'smoothingspline');
            obj.blue = fit(linspace(obj.CLim(1), obj.CLim(2), N)', obj.cmapdata(:, 3), 'smoothingspline');
            
        end
    end
end


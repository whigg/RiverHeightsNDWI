function this = InsertTextState(viewer)

% Copyright 1996-2013 The MathWorks, Inc.

this = MapViewer.InsertTextState;
this.MapViewer = viewer;
viewer.setCursor({'Pointer','ibeam'});
set(viewer.Figure,'WindowButtonDownFcn',@doTextInsert);

    function doTextInsert(hSrc,event) %#ok<INUSD>        
        if viewer.isOverMapAxes()
            pt = get(viewer.getAxes(),'CurrentPoint');
            
            % Make axes visible before adding text object.
            % Ensure tick marks are not visible.
            % This is a workaround for a graphics issue on Linux and Mac.
            ax = viewer.AnnotationAxes;
            state = get(ax);
            set(ax, ...
                'Visible','on', ...
                'Color', 'none', ...
                'XTick', [], ...
                'YTick', [])
            map.graphics.internal.mapgraphics.Text(...
                'Position',[pt(1),pt(3),0],...
                'String',' ',...
                'Editing','on',...
                'Parent', ax);
            set(ax, ...
                'Visible', state.Visible, ...
                'Color', state.Color, ...
                'XTick', state.XTick, ...
                'YTick', state.YTick)
        end
    end
end

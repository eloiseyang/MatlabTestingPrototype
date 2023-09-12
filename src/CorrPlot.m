classdef CorrPlot < handle
    % Correlation Plot Controller
    % This class communicates app events to the model, and model events to
    % the app. Its constructor attaches relevant interfaces for apps and
    % external dependencies.

    properties
        app
        mdl
    end

    methods
        function obj = CorrPlot(intfs)
            arguments
                intfs.app
                intfs.ChannelAccess ChannelAccess = DefaultChannelAccess
            end
            % EY: I don't love this initialization method.
            if isfield(intfs, 'app')
                obj.app = intfs.app;
            else
                obj.app = CorrPlot_App(obj);
            end
            obj.mdl = CorrPlot_mdl('ChannelAccess', intfs.ChannelAccess);
        end

        function onUICtrlPVSet(obj, name, value)
            arguments
                obj
            end
            arguments (Repeating)
                name string
                value
            end
            settings = obj.nNameValue2Struct(name, value);
            obj.mdl.setCtrlPV(settings);
            initialValue = obj.mdl.getCtrlPVInitValue();
            obj.app.FieldCtrlPVInitialValue.Value = string(initialValue);
        end
    end

    methods (Static)
        function s = nNameValue2Struct(names, values)
            arguments
                names (1,:) string
                values (1,:)
            end
            for i = 1:(numel(names))
                s.(names{i}) = values{i};
            end
        end
    end
end
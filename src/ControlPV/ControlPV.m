classdef ControlPV < handle
    properties
        name string = ''
        value double
    end

    methods
        function obj = ControlPV(settings)
            arguments
                settings.?ControlPV
            end
            obj.set(settings);
        end

        function set(obj, settings, settingsNV)
            arguments
                obj
                settings struct = struct()
                settingsNV.?ControlPV
            end
            setNames = fieldnames(settings);
            for i = 1:numel(setNames)
                obj.(setNames{i}) = settings.(setNames{i});
            end
            setNames = fieldnames(settingsNV);
            for i = 1:numel(setNames)
                obj.(setNames{i}) = settingsNV.(setNames{i});
            end
        end
    end
end


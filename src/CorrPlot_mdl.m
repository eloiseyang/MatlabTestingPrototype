classdef CorrPlot_mdl
    properties(Access=private)
        ca
    end
    properties
        ctrlPV (1,1) ControlPV
    end
    methods
        function obj = CorrPlot_mdl(intfs)
            arguments
                intfs.channelAccess = DefaultChannelAccess
            end
            obj.ca = intfs.channelAccess;
        end
        function setCtrlPV(obj, settings)
            arguments
                obj
                settings
            end
            obj.ctrlPV.set(settings);
        end
        function initVal = getCtrlPVInitValue(obj)
            initVal = obj.ca.get(obj.ctrlPV.name);
        end
    end
end
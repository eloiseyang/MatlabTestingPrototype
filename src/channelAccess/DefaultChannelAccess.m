classdef DefaultChannelAccess < ChannelAccess
    methods (Static)
        function value = get(pv)
            value = lcaget(pv);
        end
    end
end
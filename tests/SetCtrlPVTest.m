classdef SetCtrlPVTest < matlab.mock.TestCase & matlab.uitest.TestCase
    % Correlation Plot Set Control PV Test
    % This class contains the following tests for the correlation plot
    % control pv field:
    %   Retrieve Initial Value
    %     This test sets the control pv name field and triggers a
    %     callback that populates the inital value display with a call to
    %     LabCA get. The test verifies the populated value is correct.

    properties
        correlationPlot
        app
    end

    methods (TestMethodSetup)
        function startApp(tc)
            import matlab.mock.actions.AssignOutputs
            % Mock channel access get function to prevent remote calls
            [MockCA,behavior] = tc.createMock(?ChannelAccess);
            when(behavior.get("TEST:ADDRESS"), AssignOutputs(1));
            tc.correlationPlot = CorrPlot("ChannelAccess", MockCA);
            tc.app = tc.correlationPlot.app;
        end
    end

    methods (TestMethodTeardown)
        function closeApp(tc)
            % passing tc.app doesn't close the app. why?
            delete(tc.correlationPlot.app);
        end
    end

    methods (Test)
        function retrieveInitialValueTest(tc)
            tc.type(tc.app.FieldCtrlPVName, "TEST:ADDRESS")
            % callback onUICtrlPVSet
            tc.verifyEqual(tc.app.FieldCtrlPVInitialValue.Value, '1')
        end
    end

end
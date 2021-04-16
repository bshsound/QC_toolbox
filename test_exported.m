classdef test_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                      matlab.ui.Figure
        Image                         matlab.ui.control.Image
        DutyCyclePanel                matlab.ui.container.Panel
        DutyCycleSwitchLabel          matlab.ui.control.Label
        DutyCycleSwitch               matlab.ui.control.Switch
        FileDurationEditField_2Label  matlab.ui.control.Label
        FileDurationEditField_2       matlab.ui.control.NumericEditField
        IntervalEditFieldLabel        matlab.ui.control.Label
        IntervalEditField             matlab.ui.control.NumericEditField
        SettingsPanel                 matlab.ui.container.Panel
        PathEditFieldLabel            matlab.ui.control.Label
        PathEditField                 matlab.ui.control.EditField
        SelectpathButton              matlab.ui.control.Button
        DeploymentDatePickerLabel     matlab.ui.control.Label
        DeploymentDatePicker          matlab.ui.control.DatePicker
        RecoveryDatePickerLabel       matlab.ui.control.Label
        RecoveryDatePicker            matlab.ui.control.DatePicker
        StationnameDropDownLabel      matlab.ui.control.Label
        StationnameDropDown           matlab.ui.control.DropDown
        FileDurationEditFieldLabel    matlab.ui.control.Label
        FileDurationEditField         matlab.ui.control.NumericEditField
        GetfromfirstfileButton        matlab.ui.control.Button
        SelectpathButton_2            matlab.ui.control.Button
        QClogpathEditFieldLabel       matlab.ui.control.Label
        QClogpathEditField            matlab.ui.control.EditField
        HourSpinnerLabel              matlab.ui.control.Label
        HourSpinner                   matlab.ui.control.Spinner
        HourSpinner_2Label            matlab.ui.control.Label
        HourSpinner_2                 matlab.ui.control.Spinner
        RUNButton                     matlab.ui.control.Button
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: SelectpathButton
        function SelectpathButtonPushed(app, event)
            path = uigetdir('X:\Meereskunde\Unterwasserschall-Archiv\');
            if path(end) ~= '\'
                path = append(path,'\');
            end
            assignin('base',"path",path)
            hObject.path = path;
        end

        % Value changed function: DeploymentDatePicker
        function DeploymentDatePickerValueChanged(app, event)
            DateDeployment = app.DeploymentDatePicker.Value; 
            assignin('base',"DateDeployment",DateDeployment)
        end

        % Value changed function: StationnameDropDown
        function StationnameDropDownValueChanged(app, event)
            station = app.StationnameDropDown.Value;
            assignin('base',"station",station)
        end

        % Button pushed function: SelectpathButton_2
        function SelectpathButton_2Pushed(app, event)
           qc_path = uigetdir('X:\Meereskunde\Unterwasserschall\AMSO23\');
           assignin('base',"qc_path",qc_path)
        end

        % Value changed function: PathEditField
        function PathEditFieldValueChanged(app, event)
                path = app.PathEditField.Value;
                assignin('base',"path",path)
        end

        % Value changed function: QClogpathEditField
        function QClogpathEditFieldValueChanged(app, event)
            qc_path = app.QClogpathEditField.Value;
            assignin('base',"qc_path",qc_path)
        end

        % Value changed function: RecoveryDatePicker
        function RecoveryDatePickerValueChanged(app, event)
            DateRecovery = app.RecoveryDatePicker.Value;
            assignin('base',"DateDeployment",DateDeployment)
        end

        % Value changed function: FileDurationEditField
        function FileDurationEditFieldValueChanged(app, event)
            filedur = app.FileDurationEditField.Value;
            assignin('base',"filedur",filedur)
        end

        % Button pushed function: GetfromfirstfileButton
        function GetfromfirstfileButtonPushed(app, event)
            flist = dir([hObject.path '*.wav']);
            filedur = audioinfo([hObject.path flist(1).name]).Duration;
            assignin('base',"filedur",filedur)
            app.FileDurationEditField.Value = filedur;
%             filedur = app.FileDurationEditField.Value;
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Color = [0.9686 0.4392 0.9686];
            app.UIFigure.Position = [100 100 447 490];
            app.UIFigure.Name = 'UI Figure';
            app.UIFigure.Resize = 'off';

            % Create Image
            app.Image = uiimage(app.UIFigure);
            app.Image.Position = [230 118 100 119];
            app.Image.ImageSource = 'index.png';

            % Create DutyCyclePanel
            app.DutyCyclePanel = uipanel(app.UIFigure);
            app.DutyCyclePanel.Title = 'Duty Cycle';
            app.DutyCyclePanel.BackgroundColor = [0.9686 0.4392 0.9686];
            app.DutyCyclePanel.Position = [15 118 211 119];

            % Create DutyCycleSwitchLabel
            app.DutyCycleSwitchLabel = uilabel(app.DutyCyclePanel);
            app.DutyCycleSwitchLabel.HorizontalAlignment = 'center';
            app.DutyCycleSwitchLabel.Position = [12 65 64 22];
            app.DutyCycleSwitchLabel.Text = 'Duty Cycle';

            % Create DutyCycleSwitch
            app.DutyCycleSwitch = uiswitch(app.DutyCyclePanel, 'slider');
            app.DutyCycleSwitch.Items = {'Yes', 'No'};
            app.DutyCycleSwitch.Position = [104 66 45 20];
            app.DutyCycleSwitch.Value = 'Yes';

            % Create FileDurationEditField_2Label
            app.FileDurationEditField_2Label = uilabel(app.DutyCyclePanel);
            app.FileDurationEditField_2Label.HorizontalAlignment = 'right';
            app.FileDurationEditField_2Label.Position = [11 37 74 22];
            app.FileDurationEditField_2Label.Text = 'File Duration';

            % Create FileDurationEditField_2
            app.FileDurationEditField_2 = uieditfield(app.DutyCyclePanel, 'numeric');
            app.FileDurationEditField_2.Position = [100 37 100 22];

            % Create IntervalEditFieldLabel
            app.IntervalEditFieldLabel = uilabel(app.DutyCyclePanel);
            app.IntervalEditFieldLabel.HorizontalAlignment = 'right';
            app.IntervalEditFieldLabel.Position = [40 7 45 22];
            app.IntervalEditFieldLabel.Text = 'Interval';

            % Create IntervalEditField
            app.IntervalEditField = uieditfield(app.DutyCyclePanel, 'numeric');
            app.IntervalEditField.Position = [100 7 100 22];

            % Create SettingsPanel
            app.SettingsPanel = uipanel(app.UIFigure);
            app.SettingsPanel.Title = 'Settings';
            app.SettingsPanel.BackgroundColor = [0.9686 0.4392 0.9686];
            app.SettingsPanel.Position = [14 249 411 234];

            % Create PathEditFieldLabel
            app.PathEditFieldLabel = uilabel(app.SettingsPanel);
            app.PathEditFieldLabel.HorizontalAlignment = 'right';
            app.PathEditFieldLabel.Position = [12 180 30 22];
            app.PathEditFieldLabel.Text = 'Path';

            % Create PathEditField
            app.PathEditField = uieditfield(app.SettingsPanel, 'text');
            app.PathEditField.ValueChangedFcn = createCallbackFcn(app, @PathEditFieldValueChanged, true);
            app.PathEditField.Position = [89 180 100 22];
            app.PathEditField.Value = 'X:\Meereskunde\Unterwasserschall-Archiv\Import02\TEST\';

            % Create SelectpathButton
            app.SelectpathButton = uibutton(app.SettingsPanel, 'push');
            app.SelectpathButton.ButtonPushedFcn = createCallbackFcn(app, @SelectpathButtonPushed, true);
            app.SelectpathButton.Position = [199 180 100 22];
            app.SelectpathButton.Text = 'Select path';

            % Create DeploymentDatePickerLabel
            app.DeploymentDatePickerLabel = uilabel(app.SettingsPanel);
            app.DeploymentDatePickerLabel.HorizontalAlignment = 'right';
            app.DeploymentDatePickerLabel.Position = [4 117 70 22];
            app.DeploymentDatePickerLabel.Text = 'Deployment';

            % Create DeploymentDatePicker
            app.DeploymentDatePicker = uidatepicker(app.SettingsPanel);
            app.DeploymentDatePicker.Limits = [datetime([2013 1 12]) datetime([2099 12 31])];
            app.DeploymentDatePicker.ValueChangedFcn = createCallbackFcn(app, @DeploymentDatePickerValueChanged, true);
            app.DeploymentDatePicker.Position = [89 117 150 22];

            % Create RecoveryDatePickerLabel
            app.RecoveryDatePickerLabel = uilabel(app.SettingsPanel);
            app.RecoveryDatePickerLabel.HorizontalAlignment = 'right';
            app.RecoveryDatePickerLabel.Position = [18 86 56 22];
            app.RecoveryDatePickerLabel.Text = 'Recovery';

            % Create RecoveryDatePicker
            app.RecoveryDatePicker = uidatepicker(app.SettingsPanel);
            app.RecoveryDatePicker.ValueChangedFcn = createCallbackFcn(app, @RecoveryDatePickerValueChanged, true);
            app.RecoveryDatePicker.Position = [89 86 150 22];

            % Create StationnameDropDownLabel
            app.StationnameDropDownLabel = uilabel(app.SettingsPanel);
            app.StationnameDropDownLabel.HorizontalAlignment = 'right';
            app.StationnameDropDownLabel.Position = [1 56 76 22];
            app.StationnameDropDownLabel.Text = 'Station name';

            % Create StationnameDropDown
            app.StationnameDropDown = uidropdown(app.SettingsPanel);
            app.StationnameDropDown.Items = {'FN1', 'FN3', 'ES1', ''};
            app.StationnameDropDown.ValueChangedFcn = createCallbackFcn(app, @StationnameDropDownValueChanged, true);
            app.StationnameDropDown.Position = [92 56 104 22];
            app.StationnameDropDown.Value = 'FN1';

            % Create FileDurationEditFieldLabel
            app.FileDurationEditFieldLabel = uilabel(app.SettingsPanel);
            app.FileDurationEditFieldLabel.HorizontalAlignment = 'right';
            app.FileDurationEditFieldLabel.Position = [4 19 74 22];
            app.FileDurationEditFieldLabel.Text = 'File Duration';

            % Create FileDurationEditField
            app.FileDurationEditField = uieditfield(app.SettingsPanel, 'numeric');
            app.FileDurationEditField.Limits = [0 Inf];
            app.FileDurationEditField.ValueChangedFcn = createCallbackFcn(app, @FileDurationEditFieldValueChanged, true);
            app.FileDurationEditField.Tooltip = {'Duration of each recording in seconds'};
            app.FileDurationEditField.Position = [93 19 104 22];
            app.FileDurationEditField.Value = 3600;

            % Create GetfromfirstfileButton
            app.GetfromfirstfileButton = uibutton(app.SettingsPanel, 'push');
            app.GetfromfirstfileButton.ButtonPushedFcn = createCallbackFcn(app, @GetfromfirstfileButtonPushed, true);
            app.GetfromfirstfileButton.Position = [206 19 104 22];
            app.GetfromfirstfileButton.Text = 'Get from first file';

            % Create SelectpathButton_2
            app.SelectpathButton_2 = uibutton(app.SettingsPanel, 'push');
            app.SelectpathButton_2.ButtonPushedFcn = createCallbackFcn(app, @SelectpathButton_2Pushed, true);
            app.SelectpathButton_2.Position = [199 146 100 22];
            app.SelectpathButton_2.Text = 'Select path';

            % Create QClogpathEditFieldLabel
            app.QClogpathEditFieldLabel = uilabel(app.SettingsPanel);
            app.QClogpathEditFieldLabel.HorizontalAlignment = 'right';
            app.QClogpathEditFieldLabel.Position = [1 146 67 22];
            app.QClogpathEditFieldLabel.Text = 'QClog-path';

            % Create QClogpathEditField
            app.QClogpathEditField = uieditfield(app.SettingsPanel, 'text');
            app.QClogpathEditField.ValueChangedFcn = createCallbackFcn(app, @QClogpathEditFieldValueChanged, true);
            app.QClogpathEditField.Position = [89 146 100 22];
            app.QClogpathEditField.Value = 'X:\Meereskunde\Unterwasserschall\AMSO23\NORDSEE\ES1\QC\Test\';

            % Create HourSpinnerLabel
            app.HourSpinnerLabel = uilabel(app.SettingsPanel);
            app.HourSpinnerLabel.HorizontalAlignment = 'right';
            app.HourSpinnerLabel.Position = [264 117 32 22];
            app.HourSpinnerLabel.Text = 'Hour';

            % Create HourSpinner
            app.HourSpinner = uispinner(app.SettingsPanel);
            app.HourSpinner.Limits = [0 24];
            app.HourSpinner.Position = [311 117 100 22];

            % Create HourSpinner_2Label
            app.HourSpinner_2Label = uilabel(app.SettingsPanel);
            app.HourSpinner_2Label.HorizontalAlignment = 'right';
            app.HourSpinner_2Label.Position = [265 86 32 22];
            app.HourSpinner_2Label.Text = 'Hour';

            % Create HourSpinner_2
            app.HourSpinner_2 = uispinner(app.SettingsPanel);
            app.HourSpinner_2.Limits = [0 24];
            app.HourSpinner_2.Position = [312 86 100 22];

            % Create RUNButton
            app.RUNButton = uibutton(app.UIFigure, 'push');
            app.RUNButton.FontSize = 66;
            app.RUNButton.FontWeight = 'bold';
            app.RUNButton.Position = [47 20 179 89];
            app.RUNButton.Text = 'RUN';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = test_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end
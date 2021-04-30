classdef test_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                      matlab.ui.Figure
        Image                         matlab.ui.control.Image
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
        DutyCyclePanel                matlab.ui.container.Panel
        DutyCycleSwitchLabel          matlab.ui.control.Label
        DutyCycleSwitch               matlab.ui.control.Switch
        FileDurationEditField_2Label  matlab.ui.control.Label
        FileDurationEditField_2       matlab.ui.control.NumericEditField
        IntervalEditFieldLabel        matlab.ui.control.Label
        IntervalEditField             matlab.ui.control.NumericEditField
        RUNButton                     matlab.ui.control.Button
    end

    
    properties (Access = private)
        path = 'X:\Meereskunde\Unterwasserschall-Archiv\Import02\TEST\'% Path to raw .wav files
        qc_path = 'X:\Meereskunde\Unterwasserschall\AMSO23\NORDSEE\ES1\QC\Logs\' % path, where qc-log as pdf should be stored
        DateDeployment = datetime(2013,12,1);
        DateDeploymentHour = 0;
        DateRecovery = datetime(now,'ConvertFrom','datenum');
        DateRecoveryHour = 0;
        station = 'ES1';
        filedur = 0;
        DC = 'No';
        interval = 0;
        duration
        meanv
        sr
        stdrms
        ts
        ftime
        QC
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: SelectpathButton
        function SelectpathButtonPushed(app, event)
            filepath = uigetdir('X:\Meereskunde\Unterwasserschall-Archiv\');
            if filepath(end) ~= '\'
                filepath = append(filepath,'\');
            end
%             assignin('base',"path",path)
            app.path = filepath;
        end

        % Value changed function: DeploymentDatePicker
        function DeploymentDatePickerValueChanged(app, event)
            DateDeployment = app.DeploymentDatePicker.Value; 
%             assignin('base',"DateDeployment",DateDeployment)
            app.DateDeployment = DateDeployment;
        end

        % Value changed function: StationnameDropDown
        function StationnameDropDownValueChanged(app, event)
            station = app.StationnameDropDown.Value;
%             assignin('base',"station",station)
            app.station = station;
        end

        % Button pushed function: SelectpathButton_2
        function SelectpathButton_2Pushed(app, event)
           qc_path = uigetdir('X:\Meereskunde\Unterwasserschall\AMSO23\');
%            assignin('base',"qc_path",qc_path)
            app.qc_path = qc_path;
        end

        % Value changed function: PathEditField
        function PathEditFieldValueChanged(app, event)
                path = app.PathEditField.Value;
%                 assignin('base',"path",path);
                app.path = path;
        end

        % Value changed function: QClogpathEditField
        function QClogpathEditFieldValueChanged(app, event)
            qc_path = app.QClogpathEditField.Value;
%             assignin('base',"qc_path",qc_path)
            app.qc_path = qc_path;
        end

        % Value changed function: RecoveryDatePicker
        function RecoveryDatePickerValueChanged(app, event)
            DateRecovery = app.RecoveryDatePicker.Value;
%             assignin('base',"DateDeployment",DateDeployment)
            app.DateRecovery = DateRecovery;
        end

        % Value changed function: FileDurationEditField
        function FileDurationEditFieldValueChanged(app, event)
            filedur = app.FileDurationEditField.Value;
%             assignin('base',"filedur",filedur)
            app.filedur = filedur;
        end

        % Button pushed function: GetfromfirstfileButton
        function GetfromfirstfileButtonPushed(app, event)
            flist = dir([app.path '*.wav']);
            filedur = audioinfo([app.path flist(1).name]).Duration;
%             assignin('base',"filedur",filedur)
            app.FileDurationEditField.Value = filedur;
%             filedur = app.FileDurationEditField.Value;
        end

        % Value changed function: HourSpinner
        function HourSpinnerValueChanged(app, event)
            value = app.HourSpinner.Value;
            app.DateDeploymentHour = value;
        end

        % Value changed function: HourSpinner_2
        function HourSpinner_2ValueChanged(app, event)
            value = app.HourSpinner_2.Value;
            app.DateRecoveryHour = value;
        end

        % Button pushed function: RUNButton
        function RUNButtonPushed(app, event)
            DateD = datetime(app.DateDeployment)+hours(app.DateDeploymentHour);
            DateR = datetime(app.DateRecovery)+hours(app.DateRecoveryHour);
            disp('Now performing Quality Control ...')
            [app.QC,app.duration,app.meanv,app.sr,app.stdrms,app.ts,app.ftime] = QualityChecks(app.path,DateD,DateR,app.filedur,app.interval);
            disp('Writing results to output pdf ... ')
            qc2pdf(app.QC,app.duration,app.meanv,app.sr,app.stdrms,app.ts,app.ftime,app.path,app.qc_path,app.station,app.DateDeployment)
        end

        % Callback function
        function ProcessButtonPushed(app, event)
            
        end

        % Value changed function: DutyCycleSwitch
        function DutyCycleSwitchValueChanged(app, event)
            value = app.DutyCycleSwitch.Value;
            app.DC = value;
            if ( strcmpi(value,'Yes') )
                  app.FileDurationEditField_2.Enable = 'On';
                  app.FileDurationEditField_2.Editable = 'On';
                  app.IntervalEditField.Enable = 'On';
                  app.IntervalEditField.Editable = 'On';
            else
                  app.FileDurationEditField_2.Enable = 'Off';
                  app.FileDurationEditField_2.Editable = 'Off';
                  app.IntervalEditField.Enable = 'Off';
                  app.IntervalEditField.Editable = 'Off';
            end
        end

        % Value changed function: FileDurationEditField_2
        function FileDurationEditField_2ValueChanged(app, event)
            value = app.FileDurationEditField_2.Value;
            app.filedur = value;
        end

        % Value changed function: IntervalEditField
        function IntervalEditFieldValueChanged(app, event)
            value = app.IntervalEditField.Value;
            app.interval = value;
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Color = [0.0745 0.6235 1];
            app.UIFigure.Position = [600 400 320 463];
            app.UIFigure.Name = 'UI Figure';
            app.UIFigure.Resize = 'off';

            % Create Image
            app.Image = uiimage(app.UIFigure);
            app.Image.Position = [196 69 108 163];
            app.Image.ImageSource = 'index.png';

            % Create SettingsPanel
            app.SettingsPanel = uipanel(app.UIFigure);
            app.SettingsPanel.Title = 'Settings';
            app.SettingsPanel.BackgroundColor = [0 0.4471 0.7412];
            app.SettingsPanel.Position = [14 222 295 234];

            % Create PathEditFieldLabel
            app.PathEditFieldLabel = uilabel(app.SettingsPanel);
            app.PathEditFieldLabel.HorizontalAlignment = 'right';
            app.PathEditFieldLabel.Position = [12 180 30 22];
            app.PathEditFieldLabel.Text = 'Path';

            % Create PathEditField
            app.PathEditField = uieditfield(app.SettingsPanel, 'text');
            app.PathEditField.ValueChangedFcn = createCallbackFcn(app, @PathEditFieldValueChanged, true);
            app.PathEditField.Tooltip = {'Enter path to raw .wav files'};
            app.PathEditField.Position = [89 180 100 22];
            app.PathEditField.Value = 'X:\Meereskunde\Unterwasserschall-Archiv\Import02\TEST\';

            % Create SelectpathButton
            app.SelectpathButton = uibutton(app.SettingsPanel, 'push');
            app.SelectpathButton.ButtonPushedFcn = createCallbackFcn(app, @SelectpathButtonPushed, true);
            app.SelectpathButton.Tooltip = {'select path to raw .wav files'};
            app.SelectpathButton.Position = [199 180 75 22];
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
            app.DeploymentDatePicker.Tooltip = {'select date, when hydrophone was deployed'};
            app.DeploymentDatePicker.Position = [89 117 100 22];

            % Create RecoveryDatePickerLabel
            app.RecoveryDatePickerLabel = uilabel(app.SettingsPanel);
            app.RecoveryDatePickerLabel.HorizontalAlignment = 'right';
            app.RecoveryDatePickerLabel.Position = [18 86 56 22];
            app.RecoveryDatePickerLabel.Text = 'Recovery';

            % Create RecoveryDatePicker
            app.RecoveryDatePicker = uidatepicker(app.SettingsPanel);
            app.RecoveryDatePicker.ValueChangedFcn = createCallbackFcn(app, @RecoveryDatePickerValueChanged, true);
            app.RecoveryDatePicker.Tooltip = {'select date, when hydrophone was recovered'};
            app.RecoveryDatePicker.Position = [89 86 100 22];

            % Create StationnameDropDownLabel
            app.StationnameDropDownLabel = uilabel(app.SettingsPanel);
            app.StationnameDropDownLabel.HorizontalAlignment = 'right';
            app.StationnameDropDownLabel.Position = [1 56 76 22];
            app.StationnameDropDownLabel.Text = 'Station name';

            % Create StationnameDropDown
            app.StationnameDropDown = uidropdown(app.SettingsPanel);
            app.StationnameDropDown.Items = {'ES1', 'FN1', 'FN3', ''};
            app.StationnameDropDown.ValueChangedFcn = createCallbackFcn(app, @StationnameDropDownValueChanged, true);
            app.StationnameDropDown.Tooltip = {'select hyfrophone station'};
            app.StationnameDropDown.Position = [92 56 70 22];
            app.StationnameDropDown.Value = 'ES1';

            % Create FileDurationEditFieldLabel
            app.FileDurationEditFieldLabel = uilabel(app.SettingsPanel);
            app.FileDurationEditFieldLabel.HorizontalAlignment = 'right';
            app.FileDurationEditFieldLabel.Position = [4 27 74 22];
            app.FileDurationEditFieldLabel.Text = 'File Duration';

            % Create FileDurationEditField
            app.FileDurationEditField = uieditfield(app.SettingsPanel, 'numeric');
            app.FileDurationEditField.Limits = [0 Inf];
            app.FileDurationEditField.ValueDisplayFormat = '%.2f';
            app.FileDurationEditField.ValueChangedFcn = createCallbackFcn(app, @FileDurationEditFieldValueChanged, true);
            app.FileDurationEditField.Tooltip = {'enter duration of each recording in seconds'};
            app.FileDurationEditField.Position = [93 27 83 22];

            % Create GetfromfirstfileButton
            app.GetfromfirstfileButton = uibutton(app.SettingsPanel, 'push');
            app.GetfromfirstfileButton.ButtonPushedFcn = createCallbackFcn(app, @GetfromfirstfileButtonPushed, true);
            app.GetfromfirstfileButton.Tooltip = {'get duration from first file in Path - is done automatically if File Duration is set to 0'};
            app.GetfromfirstfileButton.Position = [182 27 104 22];
            app.GetfromfirstfileButton.Text = 'Get from first file';

            % Create SelectpathButton_2
            app.SelectpathButton_2 = uibutton(app.SettingsPanel, 'push');
            app.SelectpathButton_2.ButtonPushedFcn = createCallbackFcn(app, @SelectpathButton_2Pushed, true);
            app.SelectpathButton_2.Tooltip = {'select path, where qc-log  .pdf shall be stored'};
            app.SelectpathButton_2.Position = [199 146 75 22];
            app.SelectpathButton_2.Text = 'Select path';

            % Create QClogpathEditFieldLabel
            app.QClogpathEditFieldLabel = uilabel(app.SettingsPanel);
            app.QClogpathEditFieldLabel.HorizontalAlignment = 'right';
            app.QClogpathEditFieldLabel.Position = [1 146 67 22];
            app.QClogpathEditFieldLabel.Text = 'QClog-path';

            % Create QClogpathEditField
            app.QClogpathEditField = uieditfield(app.SettingsPanel, 'text');
            app.QClogpathEditField.ValueChangedFcn = createCallbackFcn(app, @QClogpathEditFieldValueChanged, true);
            app.QClogpathEditField.Tooltip = {'enter path, where qc-log  .pdf shall be stored'};
            app.QClogpathEditField.Position = [89 146 100 22];
            app.QClogpathEditField.Value = 'X:\Meereskunde\Unterwasserschall\AMSO23\NORDSEE\ES1\QC\Test\';

            % Create HourSpinnerLabel
            app.HourSpinnerLabel = uilabel(app.SettingsPanel);
            app.HourSpinnerLabel.HorizontalAlignment = 'right';
            app.HourSpinnerLabel.Position = [188 117 32 22];
            app.HourSpinnerLabel.Text = 'Hour';

            % Create HourSpinner
            app.HourSpinner = uispinner(app.SettingsPanel);
            app.HourSpinner.Limits = [0 24];
            app.HourSpinner.ValueChangedFcn = createCallbackFcn(app, @HourSpinnerValueChanged, true);
            app.HourSpinner.Tooltip = {'select hour of the day (0-24), when hydrophone was deployed'};
            app.HourSpinner.Position = [234 117 46 22];

            % Create HourSpinner_2Label
            app.HourSpinner_2Label = uilabel(app.SettingsPanel);
            app.HourSpinner_2Label.HorizontalAlignment = 'right';
            app.HourSpinner_2Label.Position = [188 86 32 22];
            app.HourSpinner_2Label.Text = 'Hour';

            % Create HourSpinner_2
            app.HourSpinner_2 = uispinner(app.SettingsPanel);
            app.HourSpinner_2.Limits = [0 24];
            app.HourSpinner_2.ValueChangedFcn = createCallbackFcn(app, @HourSpinner_2ValueChanged, true);
            app.HourSpinner_2.Tooltip = {'select hour of the day (0-24), when hydrophone was recovered'};
            app.HourSpinner_2.Position = [235 86 45 22];

            % Create DutyCyclePanel
            app.DutyCyclePanel = uipanel(app.UIFigure);
            app.DutyCyclePanel.Title = 'Duty Cycle';
            app.DutyCyclePanel.BackgroundColor = [0 0.4471 0.7412];
            app.DutyCyclePanel.Position = [15 91 175 119];

            % Create DutyCycleSwitchLabel
            app.DutyCycleSwitchLabel = uilabel(app.DutyCyclePanel);
            app.DutyCycleSwitchLabel.HorizontalAlignment = 'center';
            app.DutyCycleSwitchLabel.Position = [3 65 64 22];
            app.DutyCycleSwitchLabel.Text = 'Duty Cycle';

            % Create DutyCycleSwitch
            app.DutyCycleSwitch = uiswitch(app.DutyCyclePanel, 'slider');
            app.DutyCycleSwitch.Items = {'Yes', 'No'};
            app.DutyCycleSwitch.ValueChangedFcn = createCallbackFcn(app, @DutyCycleSwitchValueChanged, true);
            app.DutyCycleSwitch.Position = [95 66 45 20];
            app.DutyCycleSwitch.Value = 'No';

            % Create FileDurationEditField_2Label
            app.FileDurationEditField_2Label = uilabel(app.DutyCyclePanel);
            app.FileDurationEditField_2Label.HorizontalAlignment = 'right';
            app.FileDurationEditField_2Label.Position = [11 37 74 22];
            app.FileDurationEditField_2Label.Text = 'File Duration';

            % Create FileDurationEditField_2
            app.FileDurationEditField_2 = uieditfield(app.DutyCyclePanel, 'numeric');
            app.FileDurationEditField_2.ValueChangedFcn = createCallbackFcn(app, @FileDurationEditField_2ValueChanged, true);
            app.FileDurationEditField_2.Editable = 'off';
            app.FileDurationEditField_2.Enable = 'off';
            app.FileDurationEditField_2.Tooltip = {'enter duration of each recording in seconds'};
            app.FileDurationEditField_2.Position = [100 37 61 22];

            % Create IntervalEditFieldLabel
            app.IntervalEditFieldLabel = uilabel(app.DutyCyclePanel);
            app.IntervalEditFieldLabel.HorizontalAlignment = 'right';
            app.IntervalEditFieldLabel.Position = [40 7 45 22];
            app.IntervalEditFieldLabel.Text = 'Interval';

            % Create IntervalEditField
            app.IntervalEditField = uieditfield(app.DutyCyclePanel, 'numeric');
            app.IntervalEditField.ValueChangedFcn = createCallbackFcn(app, @IntervalEditFieldValueChanged, true);
            app.IntervalEditField.Editable = 'off';
            app.IntervalEditField.Enable = 'off';
            app.IntervalEditField.Tooltip = {'enter measurement interval in minutes'};
            app.IntervalEditField.Position = [100 7 61 22];

            % Create RUNButton
            app.RUNButton = uibutton(app.UIFigure, 'push');
            app.RUNButton.ButtonPushedFcn = createCallbackFcn(app, @RUNButtonPushed, true);
            app.RUNButton.BackgroundColor = [0 0.4471 0.7412];
            app.RUNButton.FontSize = 50;
            app.RUNButton.FontWeight = 'bold';
            app.RUNButton.Tooltip = {'run quality control and save results to pdf'};
            app.RUNButton.Position = [18 12 291 69];
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
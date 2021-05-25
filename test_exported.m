classdef test_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                      matlab.ui.Figure
        TabGroup                      matlab.ui.container.TabGroup
        QCTab                         matlab.ui.container.Tab
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
        Image                         matlab.ui.control.Image
        RUNButton                     matlab.ui.control.Button
        Copy2ArchiveTab               matlab.ui.container.Tab
        SettingsPanel_2               matlab.ui.container.Panel
        SeaDropDownLabel              matlab.ui.control.Label
        SeaDropDown                   matlab.ui.control.DropDown
        StationDropDownLabel          matlab.ui.control.Label
        StationDropDown               matlab.ui.control.DropDown
        ChannelDropDownLabel          matlab.ui.control.Label
        ChannelDropDown               matlab.ui.control.DropDown
        SetsourcedirectoryButton      matlab.ui.control.Button
        SettargetdirectoryButton      matlab.ui.control.Button
        Lamp                          matlab.ui.control.Lamp
        Lamp2                         matlab.ui.control.Lamp
        Lamp_4                        matlab.ui.control.Lamp
        Lamp_5                        matlab.ui.control.Lamp
        Lamp_3                        matlab.ui.control.Lamp
        COPYButton                    matlab.ui.control.Button
        ControlPanel                  matlab.ui.container.Panel
        FiledateoffirstfileiscorrectCheckBox  matlab.ui.control.CheckBox
        Lamp_2                        matlab.ui.control.Lamp
        Image2                        matlab.ui.control.Image
        GetdatetimePanel              matlab.ui.container.Panel
        FiledateEditFieldLabel        matlab.ui.control.Label
        FiledateEditField             matlab.ui.control.EditField
        TEXT                          matlab.ui.control.Label
        CalibrationTab                matlab.ui.container.Tab
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
        sea = 'NORDSEE' % Description
        channel = 'H1' % Description
        sourcedir % Description
        targetdir % Description
        yy
        mm
        dd% Description
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
            if qc_path(end) ~= '\'
                qc_path = append(qc_path,'\');
            end
            app.qc_path = qc_path;
        end

        % Value changed function: PathEditField
        function PathEditFieldValueChanged(app, event)
                filepath = app.PathEditField.Value;
%                 assignin('base',"path",path);
                if filepath(end) ~= '\'
                    filepath = append(filepath,'\');
                end
                app.path = path;
        end

        % Value changed function: QClogpathEditField
        function QClogpathEditFieldValueChanged(app, event)
            qc_path = app.QClogpathEditField.Value;
%             assignin('base',"qc_path",qc_path)
            if qc_path(end) ~= '\'
                qc_path = append(qc_path,'\');
            end
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
            qc2pdf(app.QC,app.duration,app.meanv,app.sr,app.stdrms,app.ts,app.ftime,app.path,app.qc_path,app.station,DateD,DateR,app.filedur)
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

        % Value changed function: SeaDropDown
        function SeaDropDownValueChanged(app, event)
            value = app.SeaDropDown.Value;
            if strcmp(value,'Select Sea') == 0
            app.sea = value
            app.Lamp_3.Color = 'g';
            end
        end

        % Value changed function: StationDropDown
        function StationDropDownValueChanged(app, event)
            value = app.StationDropDown.Value;
            if strcmp(value,'Select Station') == 0
            app.station = value;
            app.Lamp_4.Color = 'g';
            end
        end

        % Value changed function: ChannelDropDown
        function ChannelDropDownValueChanged(app, event)
            value = app.ChannelDropDown.Value;
            if strcmp(value,'Select Channel') == 0
            app.channel = value;
            app.Lamp_5.Color = 'g';
            end
        end

        % Button pushed function: SetsourcedirectoryButton
        function SetsourcedirectoryButtonPushed(app, event)
            app.sourcedir = uigetdir('X:\Meereskunde\Unterwasserschall-Archiv\Import02\');
            app.Lamp.Color = 'g';

        end

        % Button pushed function: SettargetdirectoryButton
        function SettargetdirectoryButtonPushed(app, event)
            app.targetdir = uigetdir('X:\Meereskunde\Unterwasserschall-Archiv\Data10\');
            app.Lamp2.Color = 'g';
            %% enable 
            app.FiledateEditField.Enable = 'On';
            app.FiledateEditField.Editable = 'On';
        end

        % Value changed function: FiledateEditField
        function FiledateEditFieldValueChanged(app, event)
            value = app.FiledateEditField.Value;
            app.yy = strfind(value,'yy');
            app.mm = strfind(value,'mm');
            app.dd = strfind(value,'dd');
            flist = dir([app.path '*.wav']);
            yy = flist(1).name(app.yy:app.yy+1);
            mm = flist(1).name(app.mm:app.mm+1);
            dd = flist(1).name(app.dd:app.dd+1);
            textLabel = [{'The data of the first file in the source directory is:'},...
                        {[dd,'.',mm,'.20',yy]}];
            app.TEXT.Text = textLabel;

        end

        % Button pushed function: COPYButton
        function COPYButtonPushed(app, event)
            f = warndlg('Are you really sure you want to start copying ??? This might impair your network performance!','WARNING !!!');
            C2A(app.sea,app.station,app.channel,app.sourcedir,app.targetdir,app.yy,app.mm,app.dd)
        end

        % Value changed function: 
        % FiledateoffirstfileiscorrectCheckBox
        function FiledateoffirstfileiscorrectCheckBoxValueChanged(app, event)
            value = app.FiledateoffirstfileiscorrectCheckBox.Value;
            if value
                app.Lamp_2.Color = 'g';
                app.COPYButton.Enable = 'On';
            else
                app.Lamp_2.Color = 'r';
                app.COPYButton.Enable = 'Off';
            end
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Color = [0.0745 0.6235 1];
            app.UIFigure.Position = [600 400 324 490];
            app.UIFigure.Name = 'UI Figure';
            app.UIFigure.Resize = 'off';

            % Create TabGroup
            app.TabGroup = uitabgroup(app.UIFigure);
            app.TabGroup.Position = [1 1 324 490];

            % Create QCTab
            app.QCTab = uitab(app.TabGroup);
            app.QCTab.Title = 'QC';
            app.QCTab.BackgroundColor = [0 0.2314 0.4118];

            % Create SettingsPanel
            app.SettingsPanel = uipanel(app.QCTab);
            app.SettingsPanel.ForegroundColor = [1 1 1];
            app.SettingsPanel.Title = 'Settings';
            app.SettingsPanel.BackgroundColor = [0 0.3294 0.6];
            app.SettingsPanel.Position = [16 236 295 217];

            % Create PathEditFieldLabel
            app.PathEditFieldLabel = uilabel(app.SettingsPanel);
            app.PathEditFieldLabel.HorizontalAlignment = 'right';
            app.PathEditFieldLabel.FontColor = [1 1 1];
            app.PathEditFieldLabel.Position = [12 163 30 22];
            app.PathEditFieldLabel.Text = 'Path';

            % Create PathEditField
            app.PathEditField = uieditfield(app.SettingsPanel, 'text');
            app.PathEditField.ValueChangedFcn = createCallbackFcn(app, @PathEditFieldValueChanged, true);
            app.PathEditField.FontColor = [0.149 0.149 0.149];
            app.PathEditField.Tooltip = {'Enter path to raw .wav files'};
            app.PathEditField.Position = [89 163 100 22];
            app.PathEditField.Value = 'X:\Meereskunde\Unterwasserschall-Archiv\Import02\TEST\';

            % Create SelectpathButton
            app.SelectpathButton = uibutton(app.SettingsPanel, 'push');
            app.SelectpathButton.ButtonPushedFcn = createCallbackFcn(app, @SelectpathButtonPushed, true);
            app.SelectpathButton.Tooltip = {'select path to raw .wav files'};
            app.SelectpathButton.Position = [199 163 75 22];
            app.SelectpathButton.Text = 'Select path';

            % Create DeploymentDatePickerLabel
            app.DeploymentDatePickerLabel = uilabel(app.SettingsPanel);
            app.DeploymentDatePickerLabel.HorizontalAlignment = 'right';
            app.DeploymentDatePickerLabel.FontColor = [1 1 1];
            app.DeploymentDatePickerLabel.Position = [4 100 70 22];
            app.DeploymentDatePickerLabel.Text = 'Deployment';

            % Create DeploymentDatePicker
            app.DeploymentDatePicker = uidatepicker(app.SettingsPanel);
            app.DeploymentDatePicker.Limits = [datetime([2013 1 12]) datetime([2099 12 31])];
            app.DeploymentDatePicker.ValueChangedFcn = createCallbackFcn(app, @DeploymentDatePickerValueChanged, true);
            app.DeploymentDatePicker.Tooltip = {'select date, when hydrophone was deployed'};
            app.DeploymentDatePicker.Position = [89 100 100 22];

            % Create RecoveryDatePickerLabel
            app.RecoveryDatePickerLabel = uilabel(app.SettingsPanel);
            app.RecoveryDatePickerLabel.HorizontalAlignment = 'right';
            app.RecoveryDatePickerLabel.FontColor = [1 1 1];
            app.RecoveryDatePickerLabel.Position = [18 69 56 22];
            app.RecoveryDatePickerLabel.Text = 'Recovery';

            % Create RecoveryDatePicker
            app.RecoveryDatePicker = uidatepicker(app.SettingsPanel);
            app.RecoveryDatePicker.ValueChangedFcn = createCallbackFcn(app, @RecoveryDatePickerValueChanged, true);
            app.RecoveryDatePicker.FontColor = [0.149 0.149 0.149];
            app.RecoveryDatePicker.Tooltip = {'select date, when hydrophone was recovered'};
            app.RecoveryDatePicker.Position = [89 69 100 22];

            % Create StationnameDropDownLabel
            app.StationnameDropDownLabel = uilabel(app.SettingsPanel);
            app.StationnameDropDownLabel.HorizontalAlignment = 'right';
            app.StationnameDropDownLabel.FontColor = [1 1 1];
            app.StationnameDropDownLabel.Position = [1 39 76 22];
            app.StationnameDropDownLabel.Text = 'Station name';

            % Create StationnameDropDown
            app.StationnameDropDown = uidropdown(app.SettingsPanel);
            app.StationnameDropDown.Items = {'ES1', 'FN1', 'FN3', ''};
            app.StationnameDropDown.ValueChangedFcn = createCallbackFcn(app, @StationnameDropDownValueChanged, true);
            app.StationnameDropDown.Tooltip = {'select hyfrophone station'};
            app.StationnameDropDown.Position = [92 39 70 22];
            app.StationnameDropDown.Value = 'ES1';

            % Create FileDurationEditFieldLabel
            app.FileDurationEditFieldLabel = uilabel(app.SettingsPanel);
            app.FileDurationEditFieldLabel.HorizontalAlignment = 'right';
            app.FileDurationEditFieldLabel.FontColor = [1 1 1];
            app.FileDurationEditFieldLabel.Position = [4 10 74 22];
            app.FileDurationEditFieldLabel.Text = 'File Duration';

            % Create FileDurationEditField
            app.FileDurationEditField = uieditfield(app.SettingsPanel, 'numeric');
            app.FileDurationEditField.Limits = [0 Inf];
            app.FileDurationEditField.ValueDisplayFormat = '%.2f';
            app.FileDurationEditField.ValueChangedFcn = createCallbackFcn(app, @FileDurationEditFieldValueChanged, true);
            app.FileDurationEditField.Tooltip = {'enter duration of each recording in seconds'};
            app.FileDurationEditField.Position = [93 10 83 22];

            % Create GetfromfirstfileButton
            app.GetfromfirstfileButton = uibutton(app.SettingsPanel, 'push');
            app.GetfromfirstfileButton.ButtonPushedFcn = createCallbackFcn(app, @GetfromfirstfileButtonPushed, true);
            app.GetfromfirstfileButton.Tooltip = {'get duration from first file in Path - is done automatically if File Duration is set to 0'};
            app.GetfromfirstfileButton.Position = [182 10 104 22];
            app.GetfromfirstfileButton.Text = 'Get from first file';

            % Create SelectpathButton_2
            app.SelectpathButton_2 = uibutton(app.SettingsPanel, 'push');
            app.SelectpathButton_2.ButtonPushedFcn = createCallbackFcn(app, @SelectpathButton_2Pushed, true);
            app.SelectpathButton_2.Tooltip = {'select path, where qc-log  .pdf shall be stored'};
            app.SelectpathButton_2.Position = [199 129 75 22];
            app.SelectpathButton_2.Text = 'Select path';

            % Create QClogpathEditFieldLabel
            app.QClogpathEditFieldLabel = uilabel(app.SettingsPanel);
            app.QClogpathEditFieldLabel.HorizontalAlignment = 'right';
            app.QClogpathEditFieldLabel.FontColor = [1 1 1];
            app.QClogpathEditFieldLabel.Position = [1 129 67 22];
            app.QClogpathEditFieldLabel.Text = 'QClog-path';

            % Create QClogpathEditField
            app.QClogpathEditField = uieditfield(app.SettingsPanel, 'text');
            app.QClogpathEditField.ValueChangedFcn = createCallbackFcn(app, @QClogpathEditFieldValueChanged, true);
            app.QClogpathEditField.FontColor = [0.149 0.149 0.149];
            app.QClogpathEditField.Tooltip = {'enter path, where qc-log  .pdf shall be stored'};
            app.QClogpathEditField.Position = [89 129 100 22];
            app.QClogpathEditField.Value = 'X:\Meereskunde\Unterwasserschall\AMSO23\NORDSEE\ES1\QC\Test\';

            % Create HourSpinnerLabel
            app.HourSpinnerLabel = uilabel(app.SettingsPanel);
            app.HourSpinnerLabel.HorizontalAlignment = 'right';
            app.HourSpinnerLabel.FontColor = [1 1 1];
            app.HourSpinnerLabel.Position = [188 100 32 22];
            app.HourSpinnerLabel.Text = 'Hour';

            % Create HourSpinner
            app.HourSpinner = uispinner(app.SettingsPanel);
            app.HourSpinner.Limits = [0 24];
            app.HourSpinner.ValueChangedFcn = createCallbackFcn(app, @HourSpinnerValueChanged, true);
            app.HourSpinner.Tooltip = {'select hour of the day (0-24), when hydrophone was deployed'};
            app.HourSpinner.Position = [234 100 46 22];

            % Create HourSpinner_2Label
            app.HourSpinner_2Label = uilabel(app.SettingsPanel);
            app.HourSpinner_2Label.HorizontalAlignment = 'right';
            app.HourSpinner_2Label.FontColor = [1 1 1];
            app.HourSpinner_2Label.Position = [188 69 32 22];
            app.HourSpinner_2Label.Text = 'Hour';

            % Create HourSpinner_2
            app.HourSpinner_2 = uispinner(app.SettingsPanel);
            app.HourSpinner_2.Limits = [0 24];
            app.HourSpinner_2.ValueChangedFcn = createCallbackFcn(app, @HourSpinner_2ValueChanged, true);
            app.HourSpinner_2.Tooltip = {'select hour of the day (0-24), when hydrophone was recovered'};
            app.HourSpinner_2.Position = [235 69 45 22];

            % Create DutyCyclePanel
            app.DutyCyclePanel = uipanel(app.QCTab);
            app.DutyCyclePanel.ForegroundColor = [1 1 1];
            app.DutyCyclePanel.Title = 'Duty Cycle';
            app.DutyCyclePanel.BackgroundColor = [0 0.3294 0.6];
            app.DutyCyclePanel.Position = [17 106 175 119];

            % Create DutyCycleSwitchLabel
            app.DutyCycleSwitchLabel = uilabel(app.DutyCyclePanel);
            app.DutyCycleSwitchLabel.HorizontalAlignment = 'center';
            app.DutyCycleSwitchLabel.FontColor = [1 1 1];
            app.DutyCycleSwitchLabel.Position = [3 65 64 22];
            app.DutyCycleSwitchLabel.Text = 'Duty Cycle';

            % Create DutyCycleSwitch
            app.DutyCycleSwitch = uiswitch(app.DutyCyclePanel, 'slider');
            app.DutyCycleSwitch.Items = {'Yes', 'No'};
            app.DutyCycleSwitch.ValueChangedFcn = createCallbackFcn(app, @DutyCycleSwitchValueChanged, true);
            app.DutyCycleSwitch.FontColor = [1 1 1];
            app.DutyCycleSwitch.Position = [95 66 45 20];
            app.DutyCycleSwitch.Value = 'No';

            % Create FileDurationEditField_2Label
            app.FileDurationEditField_2Label = uilabel(app.DutyCyclePanel);
            app.FileDurationEditField_2Label.HorizontalAlignment = 'right';
            app.FileDurationEditField_2Label.FontColor = [1 1 1];
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
            app.IntervalEditFieldLabel.FontColor = [1 1 1];
            app.IntervalEditFieldLabel.Position = [40 7 45 22];
            app.IntervalEditFieldLabel.Text = 'Interval';

            % Create IntervalEditField
            app.IntervalEditField = uieditfield(app.DutyCyclePanel, 'numeric');
            app.IntervalEditField.ValueChangedFcn = createCallbackFcn(app, @IntervalEditFieldValueChanged, true);
            app.IntervalEditField.Editable = 'off';
            app.IntervalEditField.Enable = 'off';
            app.IntervalEditField.Tooltip = {'enter measurement interval in minutes'};
            app.IntervalEditField.Position = [100 7 61 22];

            % Create Image
            app.Image = uiimage(app.QCTab);
            app.Image.Position = [198 93 108 144];
            app.Image.ImageSource = 'index2.png';

            % Create RUNButton
            app.RUNButton = uibutton(app.QCTab, 'push');
            app.RUNButton.ButtonPushedFcn = createCallbackFcn(app, @RUNButtonPushed, true);
            app.RUNButton.BackgroundColor = [0 0.3294 0.6];
            app.RUNButton.FontSize = 50;
            app.RUNButton.FontWeight = 'bold';
            app.RUNButton.FontColor = [1 1 1];
            app.RUNButton.Tooltip = {'run quality control and save results to pdf'};
            app.RUNButton.Position = [20 30 282 64];
            app.RUNButton.Text = 'RUN';

            % Create Copy2ArchiveTab
            app.Copy2ArchiveTab = uitab(app.TabGroup);
            app.Copy2ArchiveTab.Title = 'Copy 2 Archive';
            app.Copy2ArchiveTab.BackgroundColor = [0 0.2314 0.4118];

            % Create SettingsPanel_2
            app.SettingsPanel_2 = uipanel(app.Copy2ArchiveTab);
            app.SettingsPanel_2.ForegroundColor = [1 1 1];
            app.SettingsPanel_2.Title = 'Settings';
            app.SettingsPanel_2.BackgroundColor = [0 0.3294 0.6];
            app.SettingsPanel_2.Position = [11 268 209 187];

            % Create SeaDropDownLabel
            app.SeaDropDownLabel = uilabel(app.SettingsPanel_2);
            app.SeaDropDownLabel.HorizontalAlignment = 'right';
            app.SeaDropDownLabel.FontColor = [1 1 1];
            app.SeaDropDownLabel.Position = [27 137 27 22];
            app.SeaDropDownLabel.Text = 'Sea';

            % Create SeaDropDown
            app.SeaDropDown = uidropdown(app.SettingsPanel_2);
            app.SeaDropDown.Items = {'Select Sea', 'NORDSEE', 'OSTSEE'};
            app.SeaDropDown.ValueChangedFcn = createCallbackFcn(app, @SeaDropDownValueChanged, true);
            app.SeaDropDown.Position = [69 137 100 22];
            app.SeaDropDown.Value = 'Select Sea';

            % Create StationDropDownLabel
            app.StationDropDownLabel = uilabel(app.SettingsPanel_2);
            app.StationDropDownLabel.HorizontalAlignment = 'right';
            app.StationDropDownLabel.FontColor = [1 1 1];
            app.StationDropDownLabel.Position = [11 107 43 22];
            app.StationDropDownLabel.Text = 'Station';

            % Create StationDropDown
            app.StationDropDown = uidropdown(app.SettingsPanel_2);
            app.StationDropDown.Items = {'Select Station', 'ES1', 'FN1', 'FN3'};
            app.StationDropDown.ValueChangedFcn = createCallbackFcn(app, @StationDropDownValueChanged, true);
            app.StationDropDown.Position = [69 107 100 22];
            app.StationDropDown.Value = 'Select Station';

            % Create ChannelDropDownLabel
            app.ChannelDropDownLabel = uilabel(app.SettingsPanel_2);
            app.ChannelDropDownLabel.HorizontalAlignment = 'right';
            app.ChannelDropDownLabel.FontColor = [1 1 1];
            app.ChannelDropDownLabel.Position = [4 75 50 22];
            app.ChannelDropDownLabel.Text = 'Channel';

            % Create ChannelDropDown
            app.ChannelDropDown = uidropdown(app.SettingsPanel_2);
            app.ChannelDropDown.Items = {'Select Channel', 'H1', 'H2'};
            app.ChannelDropDown.ValueChangedFcn = createCallbackFcn(app, @ChannelDropDownValueChanged, true);
            app.ChannelDropDown.Position = [69 75 100 22];
            app.ChannelDropDown.Value = 'Select Channel';

            % Create SetsourcedirectoryButton
            app.SetsourcedirectoryButton = uibutton(app.SettingsPanel_2, 'push');
            app.SetsourcedirectoryButton.ButtonPushedFcn = createCallbackFcn(app, @SetsourcedirectoryButtonPushed, true);
            app.SetsourcedirectoryButton.Position = [10 46 122 22];
            app.SetsourcedirectoryButton.Text = 'Set source directory';

            % Create SettargetdirectoryButton
            app.SettargetdirectoryButton = uibutton(app.SettingsPanel_2, 'push');
            app.SettargetdirectoryButton.ButtonPushedFcn = createCallbackFcn(app, @SettargetdirectoryButtonPushed, true);
            app.SettargetdirectoryButton.Position = [10 15 122 22];
            app.SettargetdirectoryButton.Text = 'Set target directory';

            % Create Lamp
            app.Lamp = uilamp(app.SettingsPanel_2);
            app.Lamp.Position = [171 47 20 20];
            app.Lamp.Color = [1 0 0];

            % Create Lamp2
            app.Lamp2 = uilamp(app.SettingsPanel_2);
            app.Lamp2.Position = [171 16 20 20];
            app.Lamp2.Color = [1 0 0];

            % Create Lamp_3
            app.Lamp_3 = uilamp(app.SettingsPanel_2);
            app.Lamp_3.Position = [171 137 20 20];
            app.Lamp_3.Color = [1 0 0];

            % Create Lamp_4
            app.Lamp_4 = uilamp(app.SettingsPanel_2);
            app.Lamp_4.Position = [171 108 20 20];
            app.Lamp_4.Color = [1 0 0];

            % Create Lamp_5
            app.Lamp_5 = uilamp(app.SettingsPanel_2);
            app.Lamp_5.Position = [171 76 20 20];
            app.Lamp_5.Color = [1 0 0];

            % Create COPYButton
            app.COPYButton = uibutton(app.Copy2ArchiveTab, 'push');
            app.COPYButton.ButtonPushedFcn = createCallbackFcn(app, @COPYButtonPushed, true);
            app.COPYButton.BackgroundColor = [0 0.3294 0.6];
            app.COPYButton.FontSize = 48;
            app.COPYButton.FontWeight = 'bold';
            app.COPYButton.FontColor = [1 1 1];
            app.COPYButton.Enable = 'off';
            app.COPYButton.Position = [11 27 301 66];
            app.COPYButton.Text = 'COPY';

            % Create ControlPanel
            app.ControlPanel = uipanel(app.Copy2ArchiveTab);
            app.ControlPanel.ForegroundColor = [1 1 1];
            app.ControlPanel.Title = 'Control';
            app.ControlPanel.BackgroundColor = [0 0.3294 0.6];
            app.ControlPanel.Position = [11 103 301 57];

            % Create FiledateoffirstfileiscorrectCheckBox
            app.FiledateoffirstfileiscorrectCheckBox = uicheckbox(app.ControlPanel);
            app.FiledateoffirstfileiscorrectCheckBox.ValueChangedFcn = createCallbackFcn(app, @FiledateoffirstfileiscorrectCheckBoxValueChanged, true);
            app.FiledateoffirstfileiscorrectCheckBox.Text = 'Filedate of first file is correct ';
            app.FiledateoffirstfileiscorrectCheckBox.FontColor = [1 1 1];
            app.FiledateoffirstfileiscorrectCheckBox.Position = [15 8 175 23];

            % Create Lamp_2
            app.Lamp_2 = uilamp(app.ControlPanel);
            app.Lamp_2.Position = [189 9 20 20];
            app.Lamp_2.Color = [1 0 0];

            % Create Image2
            app.Image2 = uiimage(app.Copy2ArchiveTab);
            app.Image2.Position = [226 314 101 134];
            app.Image2.ImageSource = 'index2.png';

            % Create GetdatetimePanel
            app.GetdatetimePanel = uipanel(app.Copy2ArchiveTab);
            app.GetdatetimePanel.ForegroundColor = [1 1 1];
            app.GetdatetimePanel.Title = 'Get datetime';
            app.GetdatetimePanel.BackgroundColor = [0 0.3294 0.6];
            app.GetdatetimePanel.Position = [13 167 301 91];

            % Create FiledateEditFieldLabel
            app.FiledateEditFieldLabel = uilabel(app.GetdatetimePanel);
            app.FiledateEditFieldLabel.HorizontalAlignment = 'right';
            app.FiledateEditFieldLabel.FontColor = [1 1 1];
            app.FiledateEditFieldLabel.Position = [58 43 48 22];
            app.FiledateEditFieldLabel.Text = 'Filedate';

            % Create FiledateEditField
            app.FiledateEditField = uieditfield(app.GetdatetimePanel, 'text');
            app.FiledateEditField.ValueChangedFcn = createCallbackFcn(app, @FiledateEditFieldValueChanged, true);
            app.FiledateEditField.Editable = 'off';
            app.FiledateEditField.Enable = 'off';
            app.FiledateEditField.Position = [121 43 127 22];
            app.FiledateEditField.Value = '-----yymmdd------.wav';

            % Create TEXT
            app.TEXT = uilabel(app.GetdatetimePanel);
            app.TEXT.HorizontalAlignment = 'center';
            app.TEXT.FontColor = [1 1 1];
            app.TEXT.Position = [18 1 269 35];
            app.TEXT.Text = {'The data of the first file in the source directory is:'; 'yymmdd'};

            % Create CalibrationTab
            app.CalibrationTab = uitab(app.TabGroup);
            app.CalibrationTab.Title = 'Calibration';
            app.CalibrationTab.BackgroundColor = [0 0.2314 0.4118];

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
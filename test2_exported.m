classdef test2_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                        matlab.ui.Figure
        TabGroup                        matlab.ui.container.TabGroup
        QCTab                           matlab.ui.container.Tab
        SettingsPanel                   matlab.ui.container.Panel
        SelectpathButton                matlab.ui.control.Button
        DeploymentDatePickerLabel       matlab.ui.control.Label
        DeploymentDatePicker            matlab.ui.control.DatePicker
        RecoveryDatePickerLabel         matlab.ui.control.Label
        RecoveryDatePicker              matlab.ui.control.DatePicker
        StationnameDropDownLabel        matlab.ui.control.Label
        StationnameDropDown             matlab.ui.control.DropDown
        FileDurationEditFieldLabel      matlab.ui.control.Label
        FileDurationEditField           matlab.ui.control.NumericEditField
        GetfromfirstfileButton          matlab.ui.control.Button
        SelectQCpathButton              matlab.ui.control.Button
        HourSpinnerLabel                matlab.ui.control.Label
        HourSpinner                     matlab.ui.control.Spinner
        HourSpinner_2Label              matlab.ui.control.Label
        HourSpinner_2                   matlab.ui.control.Spinner
        Lamp_6                          matlab.ui.control.Lamp
        Lamp_7                          matlab.ui.control.Lamp
        DutyCyclePanel                  matlab.ui.container.Panel
        DutyCycleSwitchLabel            matlab.ui.control.Label
        DutyCycleSwitch                 matlab.ui.control.Switch
        FileDurationEditField_2Label    matlab.ui.control.Label
        FileDurationEditField_2         matlab.ui.control.NumericEditField
        IntervalEditFieldLabel          matlab.ui.control.Label
        IntervalEditField               matlab.ui.control.NumericEditField
        Image                           matlab.ui.control.Image
        RUNButton                       matlab.ui.control.Button
        FlagFilesButton                 matlab.ui.control.Button
        ViewLogFileButton               matlab.ui.control.Button
        RemoveFlagsButton               matlab.ui.control.Button
        GetdatetimePanel_2              matlab.ui.container.Panel
        FiledateEditField_2Label        matlab.ui.control.Label
        FiledateEditField_2             matlab.ui.control.EditField
        TEXT_2                          matlab.ui.control.Label
        Copy2ArchiveTab                 matlab.ui.container.Tab
        SettingsPanel_2                 matlab.ui.container.Panel
        SeaDropDownLabel                matlab.ui.control.Label
        SeaDropDown                     matlab.ui.control.DropDown
        StationDropDownLabel            matlab.ui.control.Label
        StationDropDown                 matlab.ui.control.DropDown
        ChannelDropDownLabel            matlab.ui.control.Label
        ChannelDropDown                 matlab.ui.control.DropDown
        SearchButton                    matlab.ui.control.Button
        Lamp                            matlab.ui.control.Lamp
        Lamp2                           matlab.ui.control.Lamp
        Lamp_3                          matlab.ui.control.Lamp
        Lamp_4                          matlab.ui.control.Lamp
        TargetFolderDropDownLabel       matlab.ui.control.Label
        TargetFolderDropDown            matlab.ui.control.DropDown
        Lamp_5                          matlab.ui.control.Lamp
        TargetDirectoryDropDownLabel_2  matlab.ui.control.Label
        Image3                          matlab.ui.control.Image
        COPYButton                      matlab.ui.control.Button
        ControlPanel                    matlab.ui.container.Panel
        FiledateoffirstfileiscorrectCheckBox  matlab.ui.control.CheckBox
        Lamp_2                          matlab.ui.control.Lamp
        Image2                          matlab.ui.control.Image
        GetdatetimePanel                matlab.ui.container.Panel
        FiledateEditFieldLabel          matlab.ui.control.Label
        FiledateEditField               matlab.ui.control.EditField
        TEXT                            matlab.ui.control.Label
        ClearoriginaldataPanel          matlab.ui.container.Panel
        ViewTransferlogButton           matlab.ui.control.Button
        DELETEButton                    matlab.ui.control.Button
        Lamp_8                          matlab.ui.control.Lamp
        Lamp_9                          matlab.ui.control.Lamp
        SURESwitchLabel                 matlab.ui.control.Label
        SURESwitch                      matlab.ui.control.ToggleSwitch
        CalibrationTab                  matlab.ui.container.Tab
        Panel                           matlab.ui.container.Panel
        SearchButton_2                  matlab.ui.control.Button
        TargetDirectoryDropDownLabel_3  matlab.ui.control.Label
        Lamp_10                         matlab.ui.control.Lamp
        UIAxes                          matlab.ui.control.UIAxes
        BSoundHTab                      matlab.ui.container.Tab
        OpenBSoundHButton               matlab.ui.control.Button
        Image4                          matlab.ui.control.Image
        TEXT_3                          matlab.ui.control.Label
        TEXT_4                          matlab.ui.control.Label
        TEXT_5                          matlab.ui.control.Label
        TEXT_6                          matlab.ui.control.Label
        TEXT_7                          matlab.ui.control.Label
        TEXT_8                          matlab.ui.control.Label
        TEXT_9                          matlab.ui.control.Label
    end

    
    properties (Access = private)
        path = 'X:\Meereskunde\Unterwasserschall-Archiv\Import02\TEST\'% Path to raw .wav files
        qc_path = 'X:\Meereskunde\Unterwasserschall\AMSO23\NORDSEE\ES1\QC\' % path, where qc-log as pdf should be stored
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
        log % Description
        libpath = addpath('./libs') % adds path to index picture
        TL %Transferlog
        
    end
    
    methods (Access = private)
        
        
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: SelectpathButton
        function SelectpathButtonPushed(app, event)
            filepath = uigetdir('X:\Meereskunde\Unterwasserschall-Archiv\');
            drawnow;
            figure(app.UIFigure)
            if filepath(end) ~= '\'
                filepath = append(filepath,'\');
            end
%             assignin('base',"path",path)
            app.path = filepath;
            set(app.RemoveFlagsButton, 'Enable', 'on')
            app.Lamp_6.Color = 'g';
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

        % Button pushed function: SelectQCpathButton
        function SelectQCpathButtonPushed(app, event)
           qc_path = uigetdir('X:\Meereskunde\Unterwasserschall\AMSO23\');
           drawnow;
           figure(app.UIFigure)
%            assignin('base',"qc_path",qc_path)
            if qc_path(end) ~= '\'
                qc_path = append(qc_path,'\');
            end
            app.qc_path = qc_path;
            app.Lamp_7.Color = 'g';
        end

        % Callback function
        function PathEditFieldValueChanged(app, event)
                filepath = app.PathEditField.Value;
%                 assignin('base',"path",path);
                if filepath(end) ~= '\'
                    filepath = append(filepath,'\');
                end
                app.path = path;
        end

        % Callback function
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
            app.filedur=filedur;
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
            [app.QC,app.duration,app.meanv,app.sr,app.stdrms,app.ts,app.ftime] = QualityChecks(app.station,app.path,app.qc_path,DateD,DateR,app.filedur,app.interval);
            
            disp('Writing results to output pdf ... ')
            [app.log] = qc2pdf(app.QC,app.duration,app.meanv,app.sr,app.stdrms,app.ts,app.ftime,app.path,app.qc_path,app.station,DateD,DateR,app.filedur)
            set(app.ViewLogFileButton, 'Enable', 'on')
            set(app.FlagFilesButton, 'Enable', 'on')
            
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

        % Button pushed function: SearchButton
        function SearchButtonPushed(app, event)
            app.sourcedir = uigetdir('X:\Meereskunde\Unterwasserschall-Archiv\Import02\');
            app.sourcedir = [app.sourcedir '\'];
            drawnow;
            figure(app.UIFigure)
            app.Lamp.Color = 'g';

        end

        % Callback function
        function SettargetdirectoryButtonPushed(app, event)
            f=warndlg('If in any doubt please use the SPACESNIFFER to check if enough memory is available in the target directory!')
            waitfor(f);
            app.targetdir = uigetdir('X:\Meereskunde\Unterwasserschall-Archiv\Data10\');
            drawnow;
            figure(app.UIFigure)
            app.Lamp2.Color = 'g';
            %% enable 
            app.FiledateEditField.Enable = 'On';
            app.FiledateEditField.Editable = 'On';
        end

        % Value changed function: FiledateEditField
        function FiledateEditFieldValueChanged(app, event)
            value = app.FiledateEditField.Value;
            y = strfind(value,'yy');
            m = strfind(value,'mm');
            d = strfind(value,'dd');
            flist = dir([app.sourcedir '*.wav']);
            yy = flist(1).name(y:y+1);
            mm = flist(1).name(m:m+1);
            dd = flist(1).name(d:d+1);
            textLabel = [{'The data of the first file in the source directory is:'},...
                        {[dd,'.',mm,'.20',yy]}];
            app.TEXT.Text = textLabel;
            app.yy = y;
            app.mm = m;
            app.dd = d;

        end

        % Button pushed function: COPYButton
        function COPYButtonPushed(app, event)
            f = warndlg('Are you really sure you want to start copying ??? This might impair your network performance!');
            waitfor(f)
            drawnow;
            figure(app.UIFigure)
            status = copycheck(app.sourcedir,app.targetdir,app.sea,app.station,app.channel);
            if status == 1
                app.TL = C2A(app.sea,app.station,app.channel,app.sourcedir,app.targetdir,app.yy,app.mm,app.dd)
                app.ViewTransferlogButton.Enable = 'On';
            else
                h = warndlg('One or more files are allreay existent in target directory!')
                waitfor(h)
            end

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

        % Button pushed function: ViewLogFileButton
        function ViewLogFileButtonPushed(app, event)
%             rptview(app.log,'pdf')
winopen(app.log)
        end

        % Button pushed function: FlagFilesButton
        function FlagFilesButtonPushed(app, event)
addQCprefix(app.QC,app.path)
        end

        % Button pushed function: RemoveFlagsButton
        function RemoveFlagsButtonPushed(app, event)
removeQCprefix(app.path)            
        end

        % Image clicked function: Image3
        function SpaceSnifferButtonPushed(app, event)
            ! X:\Meereskunde\Unterwasserschall\Software\SpaceSniffer.exe
        end

        % Value changed function: TargetFolderDropDown
        function TargetFolderDropDownValueChanged(app, event)
            value = app.TargetFolderDropDown.Value;
            app.targetdir = ['X:\Meereskunde\Unterwasserschall-Archiv\' value];
            f = warndlg('Please ensure, that enough memory is available in the target directory. Use the SPACEScniffer to the right.')
            waitfor(f);
            if ~isequal(value,'Select...')
                app.Lamp2.Color = 'g';
            else 
                app.Lamp2.Color = 'r';
                app.COPYButton.Enable = 'Off';
                app.FiledateEditField.Enable = 'Off';
            end
            app.FiledateEditField.Enable = 'On';
            app.FiledateEditField.Editable = 'On';
        end

        % Button pushed function: ViewTransferlogButton
        function ViewTransferlogButtonPushed(app, event)
            winopen(app.TL)
            app.Lamp_8.Color = 'g';
            app.SURESwitch.Enable = 'On';

        end

        % Callback function
        function SwitchValueChanged(app, event)
            
        end

        % Callback function
        function Switch_4ValueChanged(app, event)
            
        end

        % Value changed function: SURESwitch
        function SURESwitchValueChanged(app, event)
            value = app.SURESwitch.Value;
            if isequal(value,'Yes')
                app.Lamp_9.Color = 'y';
                app.DELETEButton.Enable = 'On';
            else
                app.Lamp_9.Color = 'r';
                app.DELETEButton.Enable = 'Off';
            end
        end

        % Button pushed function: DELETEButton
        function DELETEButtonPushed(app, event)
            clear_import(app.sourcedir,app.targetdir,app.sea,app.station,app.channel,app.yy,app.mm,app.dd) 
        end

        % Button pushed function: SearchButton_2
        function SearchButton_2Pushed(app, event)
            [file,path] = uigetfile({'*wav','Audio Files (*wav)';'*.*','All Files (*.*)'}, ...
            'Select File','X:\Meereskunde\Unterwasserschall\AMSO23');   
            drawnow;
            app.Lamp_10.Color = 'g';
            signal = audioread([path file]);
            info = audioinfo([path file]);
            sr=info.SampleRate;
            xwerte = [1:length(signal)]/sr;
            plot(app.UIAxes,xwerte(1:100:end),signal(1:100:end));
            h=msgbox('Please click a valid start end time of the calibation signal in the graphic!');
            waitfor(h)
            gui_ginputax(2,app.UIAxes)

  
                        
            
            
            
            
            

%             temp = app.UIAxes.CurrentPoint; % Returns 2x3 array of points
%             start = [temp(1,1) temp(1,2)]; % Gets the (x,y) coordinates
%             xline(app.UIAxes,start(1),'r')
%             temp = app.UIAxes.CurrentPoint; % Returns 2x3 array of points
%             ende = [temp(1,1) temp(1,2)]; % Gets the (x,y) coordinates
%             xline(app.UIAxes,ende(1),'r')
            
        end

        % Button pushed function: OpenBSoundHButton
        function OpenBSoundHButtonPushed(app, event)
            ! C:\SOUND\env379\Scripts\python.exe C:\SOUND\env\Lib\site-packages\bsoundh\app.py
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Color = [0.0745 0.6235 1];
            app.UIFigure.Position = [600 400 329 631];
            app.UIFigure.Name = 'UI Figure';
            app.UIFigure.Resize = 'off';

            % Create TabGroup
            app.TabGroup = uitabgroup(app.UIFigure);
            app.TabGroup.Position = [1 1 329 631];

            % Create QCTab
            app.QCTab = uitab(app.TabGroup);
            app.QCTab.Title = 'QC';
            app.QCTab.BackgroundColor = [0 0.2314 0.4118];

            % Create SettingsPanel
            app.SettingsPanel = uipanel(app.QCTab);
            app.SettingsPanel.ForegroundColor = [1 1 1];
            app.SettingsPanel.Title = 'Settings';
            app.SettingsPanel.BackgroundColor = [0 0.3294 0.6];
            app.SettingsPanel.Position = [16 377 295 217];

            % Create SelectpathButton
            app.SelectpathButton = uibutton(app.SettingsPanel, 'push');
            app.SelectpathButton.ButtonPushedFcn = createCallbackFcn(app, @SelectpathButtonPushed, true);
            app.SelectpathButton.Tooltip = {'select path to raw .wav files'};
            app.SelectpathButton.Position = [8 158 75 22];
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
            app.StationnameDropDown.Items = {'Select Staion', 'ES1', 'FN1', 'FN3'};
            app.StationnameDropDown.ValueChangedFcn = createCallbackFcn(app, @StationnameDropDownValueChanged, true);
            app.StationnameDropDown.Tooltip = {'select hyfrophone station'};
            app.StationnameDropDown.Position = [92 39 106 22];
            app.StationnameDropDown.Value = 'Select Staion';

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

            % Create SelectQCpathButton
            app.SelectQCpathButton = uibutton(app.SettingsPanel, 'push');
            app.SelectQCpathButton.ButtonPushedFcn = createCallbackFcn(app, @SelectQCpathButtonPushed, true);
            app.SelectQCpathButton.Tooltip = {'select path, where qc-log  .pdf shall be stored'};
            app.SelectQCpathButton.Position = [8 129 104 22];
            app.SelectQCpathButton.Text = 'Select QC - path';

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

            % Create Lamp_6
            app.Lamp_6 = uilamp(app.SettingsPanel);
            app.Lamp_6.Position = [120 158 20 20];
            app.Lamp_6.Color = [1 0 0];

            % Create Lamp_7
            app.Lamp_7 = uilamp(app.SettingsPanel);
            app.Lamp_7.Position = [120 130 20 20];
            app.Lamp_7.Color = [1 0 0];

            % Create DutyCyclePanel
            app.DutyCyclePanel = uipanel(app.QCTab);
            app.DutyCyclePanel.ForegroundColor = [1 1 1];
            app.DutyCyclePanel.Title = 'Duty Cycle';
            app.DutyCyclePanel.BackgroundColor = [0 0.3294 0.6];
            app.DutyCyclePanel.Position = [16 150 179 119];

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
            app.Image.Position = [203 125 108 144];
            app.Image.ImageSource = 'index2.png';

            % Create RUNButton
            app.RUNButton = uibutton(app.QCTab, 'push');
            app.RUNButton.ButtonPushedFcn = createCallbackFcn(app, @RUNButtonPushed, true);
            app.RUNButton.BackgroundColor = [0 0.3294 0.6];
            app.RUNButton.FontSize = 50;
            app.RUNButton.FontWeight = 'bold';
            app.RUNButton.FontColor = [1 1 1];
            app.RUNButton.Tooltip = {'run quality control and save results to pdf'};
            app.RUNButton.Position = [16 63 295 64];
            app.RUNButton.Text = 'RUN';

            % Create FlagFilesButton
            app.FlagFilesButton = uibutton(app.QCTab, 'push');
            app.FlagFilesButton.ButtonPushedFcn = createCallbackFcn(app, @FlagFilesButtonPushed, true);
            app.FlagFilesButton.BackgroundColor = [0 0.3294 0.6];
            app.FlagFilesButton.FontColor = [1 1 1];
            app.FlagFilesButton.Enable = 'off';
            app.FlagFilesButton.Position = [110 24 90 22];
            app.FlagFilesButton.Text = 'Flag Files';

            % Create ViewLogFileButton
            app.ViewLogFileButton = uibutton(app.QCTab, 'push');
            app.ViewLogFileButton.ButtonPushedFcn = createCallbackFcn(app, @ViewLogFileButtonPushed, true);
            app.ViewLogFileButton.BackgroundColor = [0 0.3294 0.6];
            app.ViewLogFileButton.FontColor = [1 1 1];
            app.ViewLogFileButton.Enable = 'off';
            app.ViewLogFileButton.Position = [24 24 82 22];
            app.ViewLogFileButton.Text = 'View Log File';

            % Create RemoveFlagsButton
            app.RemoveFlagsButton = uibutton(app.QCTab, 'push');
            app.RemoveFlagsButton.ButtonPushedFcn = createCallbackFcn(app, @RemoveFlagsButtonPushed, true);
            app.RemoveFlagsButton.BackgroundColor = [0 0.3294 0.6];
            app.RemoveFlagsButton.FontColor = [1 1 1];
            app.RemoveFlagsButton.Enable = 'off';
            app.RemoveFlagsButton.Position = [206.5 24 100 22];
            app.RemoveFlagsButton.Text = 'Remove Flags';

            % Create GetdatetimePanel_2
            app.GetdatetimePanel_2 = uipanel(app.QCTab);
            app.GetdatetimePanel_2.ForegroundColor = [1 1 1];
            app.GetdatetimePanel_2.Title = 'Get datetime';
            app.GetdatetimePanel_2.BackgroundColor = [0 0.3294 0.6];
            app.GetdatetimePanel_2.Position = [16 279 295 91];

            % Create FiledateEditField_2Label
            app.FiledateEditField_2Label = uilabel(app.GetdatetimePanel_2);
            app.FiledateEditField_2Label.HorizontalAlignment = 'right';
            app.FiledateEditField_2Label.FontColor = [1 1 1];
            app.FiledateEditField_2Label.Position = [58 43 48 22];
            app.FiledateEditField_2Label.Text = 'Filedate';

            % Create FiledateEditField_2
            app.FiledateEditField_2 = uieditfield(app.GetdatetimePanel_2, 'text');
            app.FiledateEditField_2.Editable = 'off';
            app.FiledateEditField_2.Enable = 'off';
            app.FiledateEditField_2.Position = [121 43 127 22];
            app.FiledateEditField_2.Value = '-----yymmdd------.wav';

            % Create TEXT_2
            app.TEXT_2 = uilabel(app.GetdatetimePanel_2);
            app.TEXT_2.HorizontalAlignment = 'center';
            app.TEXT_2.FontColor = [1 1 1];
            app.TEXT_2.Position = [18 1 269 35];
            app.TEXT_2.Text = {'The data of the first file in the source directory is:'; 'yymmdd'};

            % Create Copy2ArchiveTab
            app.Copy2ArchiveTab = uitab(app.TabGroup);
            app.Copy2ArchiveTab.Title = 'Copy 2 Archive';
            app.Copy2ArchiveTab.BackgroundColor = [0 0.2314 0.4118];

            % Create SettingsPanel_2
            app.SettingsPanel_2 = uipanel(app.Copy2ArchiveTab);
            app.SettingsPanel_2.ForegroundColor = [1 1 1];
            app.SettingsPanel_2.Title = 'Settings';
            app.SettingsPanel_2.BackgroundColor = [0 0.3294 0.6];
            app.SettingsPanel_2.Position = [11 409 303 187];

            % Create SeaDropDownLabel
            app.SeaDropDownLabel = uilabel(app.SettingsPanel_2);
            app.SeaDropDownLabel.HorizontalAlignment = 'right';
            app.SeaDropDownLabel.FontColor = [1 1 1];
            app.SeaDropDownLabel.Position = [9 137 27 22];
            app.SeaDropDownLabel.Text = 'Sea';

            % Create SeaDropDown
            app.SeaDropDown = uidropdown(app.SettingsPanel_2);
            app.SeaDropDown.Items = {'Select Sea', 'NORDSEE', 'OSTSEE'};
            app.SeaDropDown.ValueChangedFcn = createCallbackFcn(app, @SeaDropDownValueChanged, true);
            app.SeaDropDown.Position = [114 137 140 22];
            app.SeaDropDown.Value = 'Select Sea';

            % Create StationDropDownLabel
            app.StationDropDownLabel = uilabel(app.SettingsPanel_2);
            app.StationDropDownLabel.HorizontalAlignment = 'right';
            app.StationDropDownLabel.FontColor = [1 1 1];
            app.StationDropDownLabel.Position = [9 107 43 22];
            app.StationDropDownLabel.Text = 'Station';

            % Create StationDropDown
            app.StationDropDown = uidropdown(app.SettingsPanel_2);
            app.StationDropDown.Items = {'Select Station', 'ES1', 'FN1', 'FN3'};
            app.StationDropDown.ValueChangedFcn = createCallbackFcn(app, @StationDropDownValueChanged, true);
            app.StationDropDown.Position = [114 107 140 22];
            app.StationDropDown.Value = 'Select Station';

            % Create ChannelDropDownLabel
            app.ChannelDropDownLabel = uilabel(app.SettingsPanel_2);
            app.ChannelDropDownLabel.HorizontalAlignment = 'right';
            app.ChannelDropDownLabel.FontColor = [1 1 1];
            app.ChannelDropDownLabel.Position = [9 75 50 22];
            app.ChannelDropDownLabel.Text = 'Channel';

            % Create ChannelDropDown
            app.ChannelDropDown = uidropdown(app.SettingsPanel_2);
            app.ChannelDropDown.Items = {'Select Channel', 'H1', 'H2', 'STEREO'};
            app.ChannelDropDown.ValueChangedFcn = createCallbackFcn(app, @ChannelDropDownValueChanged, true);
            app.ChannelDropDown.Position = [114 75 140 22];
            app.ChannelDropDown.Value = 'Select Channel';

            % Create SearchButton
            app.SearchButton = uibutton(app.SettingsPanel_2, 'push');
            app.SearchButton.ButtonPushedFcn = createCallbackFcn(app, @SearchButtonPushed, true);
            app.SearchButton.HorizontalAlignment = 'left';
            app.SearchButton.Position = [114 46 140 22];
            app.SearchButton.Text = 'Search';

            % Create Lamp
            app.Lamp = uilamp(app.SettingsPanel_2);
            app.Lamp.Position = [267 47 20 20];
            app.Lamp.Color = [1 0 0];

            % Create Lamp2
            app.Lamp2 = uilamp(app.SettingsPanel_2);
            app.Lamp2.Position = [267 16 20 20];
            app.Lamp2.Color = [1 0 0];

            % Create Lamp_3
            app.Lamp_3 = uilamp(app.SettingsPanel_2);
            app.Lamp_3.Position = [267 138 20 20];
            app.Lamp_3.Color = [1 0 0];

            % Create Lamp_4
            app.Lamp_4 = uilamp(app.SettingsPanel_2);
            app.Lamp_4.Position = [267 108 20 20];
            app.Lamp_4.Color = [1 0 0];

            % Create TargetFolderDropDownLabel
            app.TargetFolderDropDownLabel = uilabel(app.SettingsPanel_2);
            app.TargetFolderDropDownLabel.HorizontalAlignment = 'right';
            app.TargetFolderDropDownLabel.FontColor = [1 1 1];
            app.TargetFolderDropDownLabel.Position = [9 15 76 22];
            app.TargetFolderDropDownLabel.Text = 'Target Folder';

            % Create TargetFolderDropDown
            app.TargetFolderDropDown = uidropdown(app.SettingsPanel_2);
            app.TargetFolderDropDown.Items = {'Select...', 'Data09', 'Data10', 'Data11', 'Data12'};
            app.TargetFolderDropDown.ValueChangedFcn = createCallbackFcn(app, @TargetFolderDropDownValueChanged, true);
            app.TargetFolderDropDown.Position = [114 15 95 22];
            app.TargetFolderDropDown.Value = 'Select...';

            % Create Lamp_5
            app.Lamp_5 = uilamp(app.SettingsPanel_2);
            app.Lamp_5.Position = [267 76 20 20];
            app.Lamp_5.Color = [1 0 0];

            % Create TargetDirectoryDropDownLabel_2
            app.TargetDirectoryDropDownLabel_2 = uilabel(app.SettingsPanel_2);
            app.TargetDirectoryDropDownLabel_2.HorizontalAlignment = 'right';
            app.TargetDirectoryDropDownLabel_2.FontColor = [1 1 1];
            app.TargetDirectoryDropDownLabel_2.Position = [9 46 95 22];
            app.TargetDirectoryDropDownLabel_2.Text = 'Source Directory';

            % Create Image3
            app.Image3 = uiimage(app.SettingsPanel_2);
            app.Image3.ImageClickedFcn = createCallbackFcn(app, @SpaceSnifferButtonPushed, true);
            app.Image3.Tooltip = {'SPACESNIFFER'};
            app.Image3.Position = [219 8 29 36];
            app.Image3.ImageSource = 'snifferdog.png';

            % Create COPYButton
            app.COPYButton = uibutton(app.Copy2ArchiveTab, 'push');
            app.COPYButton.ButtonPushedFcn = createCallbackFcn(app, @COPYButtonPushed, true);
            app.COPYButton.BackgroundColor = [0 0.3294 0.6];
            app.COPYButton.FontSize = 48;
            app.COPYButton.FontWeight = 'bold';
            app.COPYButton.FontColor = [1 1 1];
            app.COPYButton.Enable = 'off';
            app.COPYButton.Position = [11 154 169 66];
            app.COPYButton.Text = 'COPY';

            % Create ControlPanel
            app.ControlPanel = uipanel(app.Copy2ArchiveTab);
            app.ControlPanel.ForegroundColor = [1 1 1];
            app.ControlPanel.Title = 'Control';
            app.ControlPanel.BackgroundColor = [0 0.3294 0.6];
            app.ControlPanel.Position = [11 239 303 57];

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
            app.Image2.Position = [218 148 80 79];
            app.Image2.ImageSource = 'index2.png';

            % Create GetdatetimePanel
            app.GetdatetimePanel = uipanel(app.Copy2ArchiveTab);
            app.GetdatetimePanel.ForegroundColor = [1 1 1];
            app.GetdatetimePanel.Title = 'Get datetime';
            app.GetdatetimePanel.BackgroundColor = [0 0.3294 0.6];
            app.GetdatetimePanel.Position = [11 308 303 91];

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

            % Create ClearoriginaldataPanel
            app.ClearoriginaldataPanel = uipanel(app.Copy2ArchiveTab);
            app.ClearoriginaldataPanel.ForegroundColor = [1 1 1];
            app.ClearoriginaldataPanel.Title = 'Clear original data';
            app.ClearoriginaldataPanel.BackgroundColor = [0 0.3294 0.6];
            app.ClearoriginaldataPanel.Position = [11 14 303 119];

            % Create ViewTransferlogButton
            app.ViewTransferlogButton = uibutton(app.ClearoriginaldataPanel, 'push');
            app.ViewTransferlogButton.ButtonPushedFcn = createCallbackFcn(app, @ViewTransferlogButtonPushed, true);
            app.ViewTransferlogButton.Enable = 'off';
            app.ViewTransferlogButton.Position = [5 69 105 22];
            app.ViewTransferlogButton.Text = 'View Transferlog';

            % Create DELETEButton
            app.DELETEButton = uibutton(app.ClearoriginaldataPanel, 'push');
            app.DELETEButton.ButtonPushedFcn = createCallbackFcn(app, @DELETEButtonPushed, true);
            app.DELETEButton.BackgroundColor = [1 1 0];
            app.DELETEButton.FontSize = 24;
            app.DELETEButton.FontWeight = 'bold';
            app.DELETEButton.Enable = 'off';
            app.DELETEButton.Tooltip = {'THIS WILL DELETE THE ORIGINAL DATA'};
            app.DELETEButton.Position = [161 21 135 49];
            app.DELETEButton.Text = 'DELETE ';

            % Create Lamp_8
            app.Lamp_8 = uilamp(app.ClearoriginaldataPanel);
            app.Lamp_8.Position = [132 70 20 20];
            app.Lamp_8.Color = [1 0 0];

            % Create Lamp_9
            app.Lamp_9 = uilamp(app.ClearoriginaldataPanel);
            app.Lamp_9.Position = [132 21 20 20];
            app.Lamp_9.Color = [1 0 0];

            % Create SURESwitchLabel
            app.SURESwitchLabel = uilabel(app.ClearoriginaldataPanel);
            app.SURESwitchLabel.HorizontalAlignment = 'center';
            app.SURESwitchLabel.FontColor = [1 1 1];
            app.SURESwitchLabel.Position = [27 41 62 22];
            app.SURESwitchLabel.Text = 'SURE ???';

            % Create SURESwitch
            app.SURESwitch = uiswitch(app.ClearoriginaldataPanel, 'toggle');
            app.SURESwitch.Items = {'No', 'Yes'};
            app.SURESwitch.Orientation = 'horizontal';
            app.SURESwitch.ValueChangedFcn = createCallbackFcn(app, @SURESwitchValueChanged, true);
            app.SURESwitch.FontColor = [1 1 1];
            app.SURESwitch.Position = [30 8 67 30];
            app.SURESwitch.Value = 'No';

            % Create CalibrationTab
            app.CalibrationTab = uitab(app.TabGroup);
            app.CalibrationTab.Title = 'Calibration';
            app.CalibrationTab.BackgroundColor = [0 0.2314 0.4118];

            % Create Panel
            app.Panel = uipanel(app.CalibrationTab);
            app.Panel.ForegroundColor = [1 1 1];
            app.Panel.Title = 'Panel';
            app.Panel.BackgroundColor = [0 0.3294 0.6];
            app.Panel.Position = [10 544 309 54];

            % Create SearchButton_2
            app.SearchButton_2 = uibutton(app.Panel, 'push');
            app.SearchButton_2.ButtonPushedFcn = createCallbackFcn(app, @SearchButton_2Pushed, true);
            app.SearchButton_2.Position = [105 8 100 22];
            app.SearchButton_2.Text = 'Search';

            % Create TargetDirectoryDropDownLabel_3
            app.TargetDirectoryDropDownLabel_3 = uilabel(app.Panel);
            app.TargetDirectoryDropDownLabel_3.HorizontalAlignment = 'right';
            app.TargetDirectoryDropDownLabel_3.FontColor = [1 1 1];
            app.TargetDirectoryDropDownLabel_3.Position = [1 8 95 22];
            app.TargetDirectoryDropDownLabel_3.Text = 'Source Directory';

            % Create Lamp_10
            app.Lamp_10 = uilamp(app.Panel);
            app.Lamp_10.Position = [263 8 20 20];
            app.Lamp_10.Color = [1 0 0];

            % Create UIAxes
            app.UIAxes = uiaxes(app.CalibrationTab);
            title(app.UIAxes, 'Calibration Signal')
            xlabel(app.UIAxes, 'time [s]')
            ylabel(app.UIAxes, 'amplitude')
            app.UIAxes.YLim = [-1 1];
            app.UIAxes.YTick = [-1 -0.5 0 0.5 1];
            app.UIAxes.YTickLabel = {'-1'; '-0.5'; '0'; '0.5'; '1'};
            app.UIAxes.XGrid = 'on';
            app.UIAxes.YGrid = 'on';
            app.UIAxes.Position = [11 351 308 185];

            % Create BSoundHTab
            app.BSoundHTab = uitab(app.TabGroup);
            app.BSoundHTab.Title = 'BSoundH';
            app.BSoundHTab.BackgroundColor = [0 0.2314 0.4118];

            % Create OpenBSoundHButton
            app.OpenBSoundHButton = uibutton(app.BSoundHTab, 'push');
            app.OpenBSoundHButton.ButtonPushedFcn = createCallbackFcn(app, @OpenBSoundHButtonPushed, true);
            app.OpenBSoundHButton.Position = [13 561 100 22];
            app.OpenBSoundHButton.Text = 'Open BSoundH';

            % Create Image4
            app.Image4 = uiimage(app.BSoundHTab);
            app.Image4.Position = [183 483 100 100];
            app.Image4.ImageSource = 'rolf.png';

            % Create TEXT_3
            app.TEXT_3 = uilabel(app.BSoundHTab);
            app.TEXT_3.HorizontalAlignment = 'center';
            app.TEXT_3.FontSize = 24;
            app.TEXT_3.FontWeight = 'bold';
            app.TEXT_3.FontColor = [1 1 1];
            app.TEXT_3.Position = [7 423 282 39];
            app.TEXT_3.Text = 'Processing in BSoundH';

            % Create TEXT_4
            app.TEXT_4 = uilabel(app.BSoundHTab);
            app.TEXT_4.HorizontalAlignment = 'center';
            app.TEXT_4.FontSize = 14;
            app.TEXT_4.FontWeight = 'bold';
            app.TEXT_4.FontColor = [1 1 1];
            app.TEXT_4.Position = [1 403 282 39];
            app.TEXT_4.Text = 'Remember the big 5';

            % Create TEXT_5
            app.TEXT_5 = uilabel(app.BSoundHTab);
            app.TEXT_5.FontWeight = 'bold';
            app.TEXT_5.FontColor = [1 1 1];
            app.TEXT_5.Position = [7 357 347 39];
            app.TEXT_5.Text = '1. Import one month of data by selecting the folder';

            % Create TEXT_6
            app.TEXT_6 = uilabel(app.BSoundHTab);
            app.TEXT_6.FontWeight = 'bold';
            app.TEXT_6.FontColor = [1 1 1];
            app.TEXT_6.Position = [7 330 300 34];
            app.TEXT_6.Text = '2. Set start date from file name and set files as fixed and alligned';

            % Create TEXT_7
            app.TEXT_7 = uilabel(app.BSoundHTab);
            app.TEXT_7.FontWeight = 'bold';
            app.TEXT_7.FontColor = [1 1 1];
            app.TEXT_7.Position = [7 295 347 39];
            app.TEXT_7.Text = '3. Set calibration factor';

            % Create TEXT_8
            app.TEXT_8 = uilabel(app.BSoundHTab);
            app.TEXT_8.FontWeight = 'bold';
            app.TEXT_8.FontColor = [1 1 1];
            app.TEXT_8.Position = [7 260 347 39];
            app.TEXT_8.Text = '4. Start Ambient Evaluation';

            % Create TEXT_9
            app.TEXT_9 = uilabel(app.BSoundHTab);
            app.TEXT_9.FontWeight = 'bold';
            app.TEXT_9.FontColor = [1 1 1];
            app.TEXT_9.Position = [7 222 347 39];
            app.TEXT_9.Text = '5. Export data (don''t forget to validate)';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = test2_exported

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
classdef betta_debugged_fixed_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        QCTool                          matlab.ui.Figure
        Menu                            matlab.ui.container.Menu
        HelpMenu                        matlab.ui.container.Menu
        TabGroup                        matlab.ui.container.TabGroup
        QCTab                           matlab.ui.container.Tab
        SettingsPanel                   matlab.ui.container.Panel
        RawDataButton                   matlab.ui.control.Button
        DeploymentDatePickerLabel       matlab.ui.control.Label
        DeploymentDatePicker            matlab.ui.control.DatePicker
        RecoveryDatePickerLabel         matlab.ui.control.Label
        RecoveryDatePicker              matlab.ui.control.DatePicker
        StationnameDropDownLabel        matlab.ui.control.Label
        StationnameDropDown             matlab.ui.control.DropDown
        FileDurationEditFieldLabel      matlab.ui.control.Label
        FileDurationEditField           matlab.ui.control.NumericEditField
        GetfromfirstfileButton          matlab.ui.control.Button
        QCfilesButton                   matlab.ui.control.Button
        HourSpinnerLabel                matlab.ui.control.Label
        HourSpinner                     matlab.ui.control.Spinner
        HourSpinner_2Label              matlab.ui.control.Label
        HourSpinner_2                   matlab.ui.control.Spinner
        Lamp_6                          matlab.ui.control.Lamp
        Lamp_7                          matlab.ui.control.Lamp
        DeploymentDatePickerLabel_2     matlab.ui.control.Label
        DeploymentDatePickerLabel_3     matlab.ui.control.Label
        DutyCyclePanel                  matlab.ui.container.Panel
        DutyCycleSwitchLabel            matlab.ui.control.Label
        DutyCycleSwitch                 matlab.ui.control.Switch
        IntervalsecEditFieldLabel       matlab.ui.control.Label
        IntervalsecEditField            matlab.ui.control.NumericEditField
        DC_Text                         matlab.ui.control.Label
        Image                           matlab.ui.control.Image
        RUNButton                       matlab.ui.control.Button
        FlagFilesButton                 matlab.ui.control.Button
        ViewLogFileButton               matlab.ui.control.Button
        RemoveFlagsButton               matlab.ui.control.Button
        GetdatetimePanel_2              matlab.ui.container.Panel
        TEXT_2                          matlab.ui.control.Label
        FiledateEditField_2Label        matlab.ui.control.Label
        FiledateEditField_2             matlab.ui.control.EditField
        RenametoStandardButton          matlab.ui.control.Button
        AgreeCheckBox                   matlab.ui.control.CheckBox
        RemovalofleadingandtrailingsecondsPanel  matlab.ui.container.Panel
        RemoveleadingsecondsofeachfileCheckBox  matlab.ui.control.CheckBox
        leadsecseditfield               matlab.ui.control.NumericEditField
        secondsLabel                    matlab.ui.control.Label
        RemovetrailingsecondsofeachfileCheckBox  matlab.ui.control.CheckBox
        trailsecseditfield              matlab.ui.control.NumericEditField
        secondsLabel_2                  matlab.ui.control.Label
        CutButton                       matlab.ui.control.Button
        CreateCopyEditFieldLabel        matlab.ui.control.Label
        CreateCopyEditField             matlab.ui.control.EditField
        CheckBox                        matlab.ui.control.CheckBox
        BrowseButton                    matlab.ui.control.Button
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
        InputwavandVoltagePanel         matlab.ui.container.Panel
        SearchButton_2                  matlab.ui.control.Button
        TargetDirectoryDropDownLabel_3  matlab.ui.control.Label
        Lamp_10                         matlab.ui.control.Lamp
        RMSVoltageVEditFieldLabel       matlab.ui.control.Label
        RMSVoltageVEditField            matlab.ui.control.NumericEditField
        Lamp_11                         matlab.ui.control.Lamp
        RMSVoltageVEditFieldLabel_2     matlab.ui.control.Label
        Lamp_12                         matlab.ui.control.Lamp
        ChooseandComputeButton          matlab.ui.control.Button
        SoundPressureinChamberEditFieldLabel  matlab.ui.control.Label
        CalibrationFactordBEditFieldLabel  matlab.ui.control.Label
        linearCalibrationFactorEditFieldLabel  matlab.ui.control.Label
        ResultsPanel                    matlab.ui.container.Panel
        SoundPressureinChamberdBLabel   matlab.ui.control.Label
        CalibrationLeveldBre1VPaLabel   matlab.ui.control.Label
        LinearCalibrationFactorVPaLabel  matlab.ui.control.Label
        linearCalibrationFactorEditField  matlab.ui.control.NumericEditField
        CalibrationFactordBEditField    matlab.ui.control.NumericEditField
        SoundPressureinChamberEditField  matlab.ui.control.NumericEditField
        UIAxes                          matlab.ui.control.UIAxes
        UIAxes2                         matlab.ui.control.UIAxes
        BSoundHorPamguideTab            matlab.ui.container.Tab
        OpenBSoundHButton               matlab.ui.control.Button
        Image4                          matlab.ui.control.Image
        TEXT_3                          matlab.ui.control.Label
        TEXT_4                          matlab.ui.control.Label
        TEXT_5                          matlab.ui.control.Label
        TEXT_6                          matlab.ui.control.Label
        TEXT_7                          matlab.ui.control.Label
        TEXT_8                          matlab.ui.control.Label
        TEXT_9                          matlab.ui.control.Label
        h5ConverterSpectralQCTab        matlab.ui.container.Tab
        InputPanel                      matlab.ui.container.Panel
        ListBox                         matlab.ui.control.ListBox
        Addhdf5filesButton              matlab.ui.control.Button
        Removehdf5filesButton           matlab.ui.control.Button
        h5formatDropDown                matlab.ui.control.DropDown
        SelectAnalysesPanel             matlab.ui.container.Panel
        PDSCheckBox_2                   matlab.ui.control.CheckBox
        SpectrogramCheckBox             matlab.ui.control.CheckBox
        AutoCorrelationCheckBox         matlab.ui.control.CheckBox
        ATLshippingCheckBox             matlab.ui.control.CheckBox
        ATLintermittentCheckBox         matlab.ui.control.CheckBox
        FAVCheckBox                     matlab.ui.control.CheckBox
        ViolinsCheckBox                 matlab.ui.control.CheckBox
        NoiseFloorCheckBox              matlab.ui.control.CheckBox
        TonalsCheckBox                  matlab.ui.control.CheckBox
        AcousticMetricsCheckBox         matlab.ui.control.CheckBox
        selectallCheckBox               matlab.ui.control.CheckBox
        QualityChecksPanel              matlab.ui.container.Panel
        StationarityCheckBox            matlab.ui.control.CheckBox
        ThresholdsMinMaxCheckBox        matlab.ui.control.CheckBox
        NoiseFloorCheckBox_2            matlab.ui.control.CheckBox
        AutoCorrelationCheckBox_2       matlab.ui.control.CheckBox
        PlausibilityCheckBox            matlab.ui.control.CheckBox
        LogicalCheckBox                 matlab.ui.control.CheckBox
        selectallCheckBox_2             matlab.ui.control.CheckBox
        ExportPanel                     matlab.ui.container.Panel
        SelectOutputpathButton          matlab.ui.control.Button
        EditField                       matlab.ui.control.EditField
        pdfCheckBox                     matlab.ui.control.CheckBox
        matCheckBox                     matlab.ui.control.CheckBox
        figCheckBox                     matlab.ui.control.CheckBox
        RUNButton_2                     matlab.ui.control.Button
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
        
        Jahr
        Monat
        Tag % Description
        Stunde
        Minute
        Sekunde % Description
        dtf % Description
        cal_signal % Signal of Calibration .wav file
        cal_sr % Description
        cal_start
        PAT % Description
        cal_valsig % valid calibration signal
        cal_volt % Calibration Voltage @125Hz
        cal_path % path to calibration file
        copypath = 'null'% path where copy of files is saved where leading (and/or trailing) seconds are removed
        leadsecs = 0 % Number of seconds to be removed at the start of each .wav file
        trailsecs = 0 % Number of seconds to be removed at the end of each .wav file
    end
    
    methods (Access = private)
        
        
        
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: RawDataButton
        function RawDataButtonPushed(app, event)
            filepath = uigetdir('X:\Meereskunde\Unterwasserschall-Archiv\');
            drawnow;
            figure(app.QCTool)
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
            app.DateDeployment = app.DeploymentDatePicker.Value;
            %             assignin('base',"DateDeployment",DateDeployment)
            %             app.DateDeployment = DateDeployment;
        end

        % Value changed function: StationnameDropDown
        function StationnameDropDownValueChanged(app, event)
            station = app.StationnameDropDown.Value;
            %             assignin('base',"station",station)
            app.station = station;
        end

        % Button pushed function: QCfilesButton
        function QCfilesButtonPushed(app, event)
            qc_path = uigetdir('X:\Meereskunde\Unterwasserschall\AMSO23\');
            drawnow;
            figure(app.QCTool)
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
            for ii = 1:length(flist)
                filedur = audioinfo([app.path flist(ii).name]).Duration;
                if filedur < 540
                    continue
                else
                    app.filedur = filedur;
                    break
                end
            end
            %           filedur = audioinfo([app.path flist(1).name]).Duration;
            %             assignin('base',"filedur",filedur)
            
            app.FileDurationEditField.Value = filedur;
            %             app.filedur=filedur;
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
            [app.QC,app.duration,app.meanv,app.sr,app.stdrms,app.ts,app.ftime] = QualityChecks(app.station,app.path,app.qc_path,DateD,DateR,app.filedur,app.interval,app.Jahr,app.Monat,app.Tag,app.Stunde,app.Minute,app.Sekunde,app.dtf);
            
            disp('Writing results to output pdf ... ')
            [app.log] = qc2pdf(app.QC,app.duration,app.meanv,app.sr,app.stdrms,app.ts,app.ftime,app.path,app.qc_path,app.station,DateD,DateR,app.filedur,app.interval)
            set(app.ViewLogFileButton, 'Enable', 'on')
            set(app.FlagFilesButton, 'Enable', 'on')
            
        end

        % Value changed function: DutyCycleSwitch
        function DutyCycleSwitchValueChanged(app, event)
            value = app.DutyCycleSwitch.Value;
            app.DC = value;
            if ( strcmpi(value,'Yes') )
                app.IntervalsecEditField.Enable = 'On';
                app.IntervalsecEditField.Editable = 'On';
            else
                app.IntervalsecEditField.Enable = 'Off';
                app.IntervalsecEditField.Editable = 'Off';
            end
        end

        % Callback function
        function ProcessButtonPushed(app, event)
            
        end

        % Callback function
        function FileDurationEditField_2ValueChanged(app, event)
            value = app.FileDurationEditField_2.Value;
            app.filedur = value;
        end

        % Value changed function: IntervalsecEditField
        function IntervalsecEditFieldValueChanged(app, event)
            value = app.IntervalsecEditField.Value;
            if value <= app.filedur
                errordlg('Interval must be larger than individual file duration')
            else
                app.interval = value;
                app.DC_Text.Text = ['Record for a period of ' num2str(app.filedur/60) ' min. once every ' num2str(app.interval/60)  ' min.']
            end
            
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
            figure(app.QCTool)
            app.Lamp.Color = 'g';
            
        end

        % Callback function
        function SettargetdirectoryButtonPushed(app, event)
            f=warndlg('If in any doubt please use the SPACESNIFFER to check if enough memory is available in the target directory!')
            waitfor(f);
            app.targetdir = uigetdir('X:\Meereskunde\Unterwasserschall-Archiv\Data10\');
            drawnow;
            figure(app.QCTool)
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
            figure(app.QCTool)
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
            [file,app.cal_path] = uigetfile({'*wav','Audio Files (*wav)';'*.*','All Files (*.*)'}, ...
                'Select File','X:\Meereskunde\Unterwasserschall\AMSO23');
            drawnow;
            figure(app.QCTool)
            app.Lamp_10.Color = 'g';
            if app.Lamp_11.Color == [0 1 0] & app.Lamp_10.Color == [0 1 0]
                app.ChooseandComputeButton.Enable = 'On'
            end
            app.cal_signal = audioread([app.cal_path file]);
            info = audioinfo([app.cal_path file]);
            app.cal_sr=info.SampleRate;
            xwerte = [1:length(app.cal_signal)]/app.cal_sr;
            plot(app.UIAxes,xwerte(1:100:end),app.cal_signal(1:100:end));
            %             h=msgbox('Please click a valid start end time of the calibation signal in the graphic!');
            %             waitfor(h)
            
            
            %             % Set up figure handle visibility, run ginput, and return state
            %             fhv = app.QCTool.HandleVisibility;        % Current status
            %             app.QCTool.HandleVisibility = 'callback'; % Temp change (or, 'on')
            %             set(0, 'CurrentFigure', app.QCTool)       % Make fig current
            %             [gin_x,~] = ginput(1);
            %             app.PAT = patch(app.UIAxes,[gin_x(1) gin_x(1) gin_x(1)+30 gin_x(1)+30],[-1 1 1 -1],'m','facealpha',.2,'edgecolor','none');
            %             app.cal_start = gin_x(1);
            %             cal_sample_start = gin_x(1)*app.cal_sr;
            %             cal_sample_end = (gin_x(1)+30)*app.cal_sr;
            %             app.cal_valsig = app.cal_signal(cal_sample_start:cal_sample_end);
            %
            %                                  % run ginput
            %             app.QCTool.HandleVisibility = fhv;        % return original state
            %             app.ChooseandComputeButton.Enable = 'On';
            %             sample_t        = [1:length(app.cal_signal)]/cal_sr; %s                  % SampleZeit
            %             start_sample    = floor(gin_x(1)/cal_sr);        % start of valid signal in s
            %             stop_sample     =  ceil(gin_x(2)/cal_sr);       % end of valid signal in s
            %
            %             time_vector=sample_t(start_sample:stop_sample);
            %             data_vector=app.cal_signal(start_sample:stop_sample);
            %
            %             plot(app.UIAxes,time_vector,data_vector,'r');
            
        end

        % Button pushed function: OpenBSoundHButton
        function OpenBSoundHButtonPushed(app, event)
            ! C:\SOUND\env379\Scripts\python.exe C:\SOUND\env\Lib\site-packages\bsoundh\app.py
        end

        % Value changed function: FiledateEditField_2
        function FiledateEditField_2ValueChanged(app, event)
            value = app.FiledateEditField_2.Value;
            y = strfind(value,'yy');
            m = strfind(value,'MM');
            d = strfind(value,'dd');
            H = strfind(value,'HH');
            M = strfind(value,'mm');
            S = strfind(value,'ss');
            flist = dir([app.path '*.wav']);
            yy = flist(1).name(y:y+1);
            mm = flist(1).name(m:m+1);
            dd = flist(1).name(d:d+1);
            HH = flist(1).name(H:H+1);
            MM = flist(1).name(M:M+1);
            SS = flist(1).name(S:S+1);
            textLabel = [{'The data of the first file in the source directory is:'},...
                {[dd,'.',mm,'.20',yy,' ', HH,':',MM,':',SS '. The renamed file would be:'] }, ...
                {[app.station '_' yy mm dd HH MM SS '.wav']}];
            app.TEXT_2.Text = textLabel;
            app.Jahr = y;
            app.Monat = m;
            app.Tag = d;
            app.Stunde = H;
            app.Minute = M;
            app.Sekunde = S;
            app.dtf = value(y:S+1);
        end

        % Callback function
        function FiledateoffirstfileiscorrectCheckBox_2ValueChanged(app, event)
            value = app.FiledateoffirstfileiscorrectCheckBox_2.Value;
            if value ==1
                app.Lamp_11.Color = 'g';
                app.RUNButton.Enable = 'On';
            else
                app.Lamp_11.Color = 'r';
                app.RUNButton.Enable = 'Off';
            end
        end

        % Button pushed function: RenametoStandardButton
        function RenametoStandardButtonPushed(app, event)
            warndlg(['Renaming will unwiderbringlich change the filenames. Make sure, that the yyMMddHHmmss indices entered above are correct !'])
            umbenenner(app.path,app.Jahr,app.Monat,app.Tag,app.Stunde,app.Minute,app.Sekunde,app.station)
            app.RUNButton.Enable = 'On';
        end

        % Value changed function: AgreeCheckBox
        function AgreeCheckBoxValueChanged(app, event)
            value = app.AgreeCheckBox.Value;
            if value ==1
                app.RenametoStandardButton.Enable = 'On'
                %% activate possibility to remove leading and trailing seconds
                app.RemoveleadingsecondsofeachfileCheckBox.Enable = 'On';
                app.RemovetrailingsecondsofeachfileCheckBox.Enable = 'On';
                app.CheckBox.Enable = 'On';
                app.CreateCopyEditField.Enable = 'On';
                app.BrowseButton.Enable = 'On';
            else
                app.RenametoStandardButton.Enable = 'Off'
            end
        end

        % Button pushed function: ChooseandComputeButton
        function ChooseandComputeButtonPushed(app, event)
            fhv = app.QCTool.HandleVisibility;        % Current status
            app.QCTool.HandleVisibility = 'callback'; % Temp change (or, 'on')
            set(0, 'CurrentFigure', app.QCTool)
            delete(app.PAT)
            [gin_x,~] = ginput(1);
            app.PAT = patch(app.UIAxes,[gin_x(1) gin_x(1) gin_x(1)+30 gin_x(1)+30],[-1 1 1 -1],'m','facealpha',.2,'edgecolor','none');
            app.cal_start = gin_x(1);
            cal_sample_start = gin_x(1)*app.cal_sr;
            cal_sample_end = (gin_x(1)+30)*app.cal_sr;
            app.cal_valsig = app.cal_signal(cal_sample_start:cal_sample_end);
            app.cal_start = gin_x(1);
            app.Lamp_12.Color = 'g'
            
            
            %% calculate
            S_ref = -212.1 ; % Fest Sensitivität vom Kalibrierer (itap)
            U_ref = app.cal_volt;
            U_ref = double(U_ref);
            gain_ref = 40; % Fester Verstärkungsfaktor vom itap Kalibrierer
            L_ref = 20 * log10(U_ref) - gain_ref - S_ref;
            %% display in app
            app.SoundPressureinChamberEditField.Value = double(L_ref);
            %% Calibration dB
            caldb = L_ref - 20 * log10(std(app.cal_valsig));
            %% display in app
            app.CalibrationFactordBEditField.Value = double(caldb);
            callin = 10^(caldb/20);
            %% display in app
            app.linearCalibrationFactorEditField.Value = double(callin);
            
            
            % FFT durchführen, d.h. Funktion fftanalyse aufrufen
            [freq_axis, data_vector_fft] = fftanalyse(2^15, [1:length(app.cal_valsig)]', 1/app.cal_sr, app.cal_valsig);
            
            %% Berechnung des Schalldruckwertes und grafische Ausgabe
            Lp = 20*log10(data_vector_fft./1*10^(-6));
            diffe = L_ref-max(Lp);
            Lp = Lp + diffe;
            fhv = app.QCTool.HandleVisibility;        % Current status
            app.QCTool.HandleVisibility = 'callback'; % Temp change (or, 'on')
            set(0, 'CurrentFigure', app.QCTool)
            
            plot(app.UIAxes2,freq_axis, Lp);
            set(app.UIAxes2, 'XScale', 'log') ;
            set(app.UIAxes2,'YLim',[0 170]);
            app.QCTool.HandleVisibility = fhv;        % return original state
            
            %% mark at which frequency the maximum is found
            [~,f] = max(Lp);
            xline(app.UIAxes2,freq_axis(f),'r')
            %         annotation(app.UIAxes2,'textbox',[.2 .5 .3 .3],'String',['Max SPL @ ' num2str(freq_axis(f)) ' Hz'],'FitBoxToText','on');
            T = text(app.UIAxes2,freq_axis(f)+30,L_ref+1,['Max SPL @ ' num2str(freq_axis(f)) ' Hz'])
            
            %% automatically save figure to path
            h = figure;
            h.Visible = 'off';
            x = app.UIAxes2.XAxis.Parent.Children(3).XData;
            y = app.UIAxes2.XAxis.Parent.Children(3).YData;
            plot(x,y)
            xline(freq_axis(f),'r')
            %         annotation('textbox',[.2 .5 .3 .3],'String',['Max SPL @ ' num2str(freq_axis(f)) ' Hz'],'FitBoxToText','on');
            text(freq_axis(f)+30,L_ref+1,['Max SPL @ ' num2str(freq_axis(f)) ' Hz'])
            h.CurrentAxes.YLabel.String = app.UIAxes2.YLabel.String;
            h.CurrentAxes.YLabel.FontSize = app.UIAxes2.YLabel.FontSize;
            h.CurrentAxes.XLabel.String = app.UIAxes2.XLabel.String;
            h.CurrentAxes.XLabel.FontSize = app.UIAxes2.XLabel.FontSize;
            h.CurrentAxes.XLim = [0 max(x)];
            h.CurrentAxes.YLim = [0 170];
            h.CurrentAxes.XScale = 'log';
            print(h,[app.cal_path datestr(now,'yymmdd') '_Calibration_Spectrum.png'],'-dpng','-r300');
            delete(h)
            
            %% automatically save calibration curve as .mat
            save([app.cal_path datestr(now,'yymmdd') '_Calibration_Curve.mat'],'freq_axis','Lp')
            
            %% automatically save results to .txt
            fp = fopen([app.cal_path datestr(now,'yymmdd') '_Calibration_Results.txt'],'w');
            fprintf(fp, '%s\n\n','Calibration Results');
            fprintf(fp, '%s\n',['The sound pressure level in calibration chamber in dB re 1 µPa: ' num2str(L_ref)]);
            fprintf(fp, '%s\n',['The calibration level in dB/V: ' num2str(caldb) ]);
            fprintf(fp, '%s\n',['The linear calibration level in µPa/V: ' num2str(callin)]);
            fclose(fp)
            
            %% write output to results tab
            
            
        end

        % Value changed function: RMSVoltageVEditField
        function RMSVoltageVEditFieldValueChanged(app, event)
            app.cal_volt = app.RMSVoltageVEditField.Value;
            if app.cal_volt < 0.15 || app.cal_volt > 0.3
                warndlg(['The entered voltage is unrealistic. Please recheck! ... Volltrottel -.-'])
            else
                app.Lamp_11.Color = 'g';
            end
            if app.Lamp_11.Color == [0 1 0] & app.Lamp_10.Color == [0 1 0]
                app.ChooseandComputeButton.Enable = 'On'
            end
        end

        % Callback function
        function ComputeButtonPushed(app, event)
            % Check if all necessary input parameters exist
            
            %% calculate
            S_ref = -212.1 ; % Fest Sensitivität vom Kalibrierer (itap)
            U_ref = app.cal_volt;
            U_ref = double(U_ref);
            gain_ref = 40; % Fester Verstärkungsfaktor vom itap Kalibrierer
            L_ref = 20 * log10(U_ref) - gain_ref - S_ref;
            %% display in app
            app.SoundPressureinChamberEditField.Value = double(L_ref);
            %% Calibration dB
            caldb = L_ref - 20 * log10(std(app.cal_valsig));
            %% display in app
            app.CalibrationFactordBEditField.Value = double(caldb);
            callin = 10^(caldb/20);
            %% display in app
            app.linearCalibrationFactorEditField.Value = double(callin);
            
            
            % FFT durchführen, d.h. Funktion fftanalyse aufrufen
            [freq_axis, data_vector_fft] = fftanalyse(2^15, [1:length(app.cal_valsig)]', 1/app.cal_sr, app.cal_valsig);
            
            %% Berechnung des Schalldruckwertes und grafische Ausgabe
            Lp = 20*log10(data_vector_fft./1*10^(-6));
            diffe = L_ref-max(Lp);
            Lp = Lp + diffe;
            fhv = app.QCTool.HandleVisibility;        % Current status
            app.QCTool.HandleVisibility = 'callback'; % Temp change (or, 'on')
            set(0, 'CurrentFigure', app.QCTool)
            
            plot(app.UIAxes2,freq_axis, Lp);
            set(app.UIAxes2, 'XScale', 'log') ;
            set(app.UIAxes2,'YLim',[0 170]);
            app.QCTool.HandleVisibility = fhv;        % return original state
            
            %% mark at which frequency the maximum is found
            [~,f] = max(Lp);
            xline(app.UIAxes2,freq_axis(f),'r')
            %         annotation(app.UIAxes2,'textbox',[.2 .5 .3 .3],'String',['Max SPL @ ' num2str(freq_axis(f)) ' Hz'],'FitBoxToText','on');
            text(app.UIAxes2,freq_axis(f)+30,L_ref+1,['Max SPL @ ' num2str(freq_axis(f)) ' Hz'])
            
            %% automatically save figure to path
            h = figure;
            h.Visible = 'off';
            x = app.UIAxes2.XAxis.Parent.Children(3).XData;
            y = app.UIAxes2.XAxis.Parent.Children(3).YData;
            plot(x,y)
            xline(freq_axis(f),'r')
            %         annotation('textbox',[.2 .5 .3 .3],'String',['Max SPL @ ' num2str(freq_axis(f)) ' Hz'],'FitBoxToText','on');
            text(freq_axis(f)+30,L_ref+1,['Max SPL @ ' num2str(freq_axis(f)) ' Hz'])
            h.CurrentAxes.YLabel.String = app.UIAxes2.YLabel.String;
            h.CurrentAxes.YLabel.FontSize = app.UIAxes2.YLabel.FontSize;
            h.CurrentAxes.XLabel.String = app.UIAxes2.XLabel.String;
            h.CurrentAxes.XLabel.FontSize = app.UIAxes2.XLabel.FontSize;
            h.CurrentAxes.XLim = [0 max(x)];
            h.CurrentAxes.YLim = [0 170];
            h.CurrentAxes.XScale = 'log';
            print(h,[app.cal_path datestr(now,'yymmdd') '_Calibration_Spectrum.png'],'-dpng','-r300');
            delete(h)
            
            %% automatically save calibration curve as .mat
            save([app.cal_path datestr(now,'yymmdd') '_Calibration_Curve.mat'],'freq_axis','Lp')
            
            %% automatically save results to .txt
            fp = fopen([app.cal_path datestr(now,'yymmdd') '_Calibration_Results.txt'],'w');
            fprintf(fp, '%s\n\n','Calibration Results');
            fprintf(fp, '%s\n',['The sound pressure level in calibration chamber in dB re 1 µPa: ' num2str(L_ref)]);
            fprintf(fp, '%s\n',['The calibration level in dB/V: ' num2str(caldb) ]);
            fprintf(fp, '%s\n',['The linear calibration level in µPa/V: ' num2str(callin)]);
            fclose(fp)
        end

        % Menu selected function: HelpMenu
        function HelpMenuSelected(app, event)
            %             ! X:\Meereskunde\Unterwasserschall\HDF5_Testdaten_Skripte\Skripte\Matlabskripte\QC_toolbox\libs\Wikilogin.bat
            %             dos ('"C:\Program Files\Internet Explorer\iexplore.exe" -extoff http://linwiki-uschall10.srx.bsh.de/mediawiki/index.php/Quality_Checks');
            dos('explorer http://linwiki-uschall10.srx.bsh.de/mediawiki/index.php/Quality_Checks');
        end

        % Value changed function: 
        % RemoveleadingsecondsofeachfileCheckBox
        function RemoveleadingsecondsofeachfileCheckBoxValueChanged(app, event)
            value = app.RemoveleadingsecondsofeachfileCheckBox.Value;
            if value == 1
                app.leadsecseditfield.Enable = 'On';
                app.leadsecseditfield.Editable = 'On';
                app.secondsLabel.Enable = 'On';
            elseif value == 0
                app.leadsecseditfield.Enable = 'Off';
                app.leadsecseditfield.Editable = 'Off';
                app.secondsLabel.Enable = 'Off';
            end
        end

        % Value changed function: 
        % RemovetrailingsecondsofeachfileCheckBox
        function RemovetrailingsecondsofeachfileCheckBoxValueChanged(app, event)
            value = app.RemovetrailingsecondsofeachfileCheckBox.Value;
            if value == 1
                app.trailsecseditfield.Enable = 'On';
                app.trailsecseditfield.Editable = 'On';
                app.secondsLabel_2.Enable = 'On';
            elseif value == 0
                app.trailsecseditfield.Enable = 'Off';
                app.trailsecseditfield.Editable = 'Off';
                app.secondsLabel_2.Enable = 'Off';
            end
        end

        % Button pushed function: CutButton
        function CutButtonPushed(app, event)
            %% Check whether parallel computing toolbox is available
            para = license('test','Distrib_Computing_Toolbox');
            flist = dir([app.path,'*.wav']);
            if  (app.leadsecs ~= 0 || app.trailsecs ~= 0)
                if para == 1
                        probar = parfor_progressbar(length(flist),'Removing leading and/or trailing seconds of .wav files ...');  %create the progress bar
                        paracutsec(probar, app.path, flist, app.copypath, app.leadsecs, app.trailsecs)
                        close(probar);
                else
                        probar = uiprogressdlg( app.QCTool, 'Title', 'Progress', 'Message', 'Removing leading and/or trailing seconds of .wav files ...', 'Value', 0);
                        cutsec(probar, app.path, flist, app.copypath, app.leadsecs, app.trailsecs)
                end
            end
        end

        % Button pushed function: BrowseButton
        function BrowseButtonPushed(app, event)
            % get path where copy of cut files is saved
            app.copypath = uigetdir('G:\');
            % bring back app to top
            drawnow;
            figure(app.QCTool)
            % write copypath to EditField
            app.CreateCopyEditField.Value = [app.copypath '\'];
            app.CutButton.Enable = 'On';
        end

        % Value changed function: CreateCopyEditField
        function CreateCopyEditFieldValueChanged(app, event)
            app.copypath = app.CreateCopyEditField.Value;        
        end

        % Value changed function: leadsecseditfield
        function leadsecseditfieldValueChanged(app, event)
            app.leadsecs = double(app.leadsecseditfield.Value);
            
        end

        % Value changed function: trailsecseditfield
        function trailsecseditfieldValueChanged(app, event)
            app.trailsecs = double(app.trailsecseditfield.Value);
            
        end

        % Value changed function: CheckBox
        function CheckBoxValueChanged(app, event)
            value = app.CheckBox.Value;
            if value == 0
                app.CutButton.Enable = 'On';
            elseif value ==1 && strcmp(app.copypath,'null')
                app.CutButton.Enable = 'Off';
            end
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create QCTool and hide until all components are created
            app.QCTool = uifigure('Visible', 'off');
            app.QCTool.IntegerHandle = 'on';
            app.QCTool.Color = [0.0745 0.6235 1];
            app.QCTool.Position = [600 400 623 632];
            app.QCTool.Name = 'QCTool';
            app.QCTool.Icon = 'index2.png';
            app.QCTool.Resize = 'off';

            % Create Menu
            app.Menu = uimenu(app.QCTool);
            app.Menu.Text = 'Menu';

            % Create HelpMenu
            app.HelpMenu = uimenu(app.Menu);
            app.HelpMenu.MenuSelectedFcn = createCallbackFcn(app, @HelpMenuSelected, true);
            app.HelpMenu.Text = 'Help';

            % Create TabGroup
            app.TabGroup = uitabgroup(app.QCTool);
            app.TabGroup.Position = [1 2 623 631];

            % Create QCTab
            app.QCTab = uitab(app.TabGroup);
            app.QCTab.Title = 'QC';
            app.QCTab.BackgroundColor = [0 0.2314 0.4118];

            % Create SettingsPanel
            app.SettingsPanel = uipanel(app.QCTab);
            app.SettingsPanel.ForegroundColor = [1 1 1];
            app.SettingsPanel.Title = 'Settings';
            app.SettingsPanel.BackgroundColor = [0 0.3294 0.6];
            app.SettingsPanel.Position = [16 395 295 205];

            % Create RawDataButton
            app.RawDataButton = uibutton(app.SettingsPanel, 'push');
            app.RawDataButton.ButtonPushedFcn = createCallbackFcn(app, @RawDataButtonPushed, true);
            app.RawDataButton.Tooltip = {'select path to raw .wav files'};
            app.RawDataButton.Position = [89 155 81 22];
            app.RawDataButton.Text = 'Raw Data';

            % Create DeploymentDatePickerLabel
            app.DeploymentDatePickerLabel = uilabel(app.SettingsPanel);
            app.DeploymentDatePickerLabel.HorizontalAlignment = 'right';
            app.DeploymentDatePickerLabel.FontColor = [1 1 1];
            app.DeploymentDatePickerLabel.Position = [4 98 70 22];
            app.DeploymentDatePickerLabel.Text = 'Deployment';

            % Create DeploymentDatePicker
            app.DeploymentDatePicker = uidatepicker(app.SettingsPanel);
            app.DeploymentDatePicker.Limits = [datetime([2013 1 12]) datetime([2099 12 31])];
            app.DeploymentDatePicker.ValueChangedFcn = createCallbackFcn(app, @DeploymentDatePickerValueChanged, true);
            app.DeploymentDatePicker.Tooltip = {'select date, when hydrophone was deployed'};
            app.DeploymentDatePicker.Position = [89 98 106 22];

            % Create RecoveryDatePickerLabel
            app.RecoveryDatePickerLabel = uilabel(app.SettingsPanel);
            app.RecoveryDatePickerLabel.HorizontalAlignment = 'right';
            app.RecoveryDatePickerLabel.FontColor = [1 1 1];
            app.RecoveryDatePickerLabel.Position = [4 67 56 22];
            app.RecoveryDatePickerLabel.Text = 'Recovery';

            % Create RecoveryDatePicker
            app.RecoveryDatePicker = uidatepicker(app.SettingsPanel);
            app.RecoveryDatePicker.ValueChangedFcn = createCallbackFcn(app, @RecoveryDatePickerValueChanged, true);
            app.RecoveryDatePicker.FontColor = [0.149 0.149 0.149];
            app.RecoveryDatePicker.Tooltip = {'select date, when hydrophone was recovered'};
            app.RecoveryDatePicker.Position = [89 67 106 22];

            % Create StationnameDropDownLabel
            app.StationnameDropDownLabel = uilabel(app.SettingsPanel);
            app.StationnameDropDownLabel.HorizontalAlignment = 'right';
            app.StationnameDropDownLabel.FontColor = [1 1 1];
            app.StationnameDropDownLabel.Position = [4 37 76 22];
            app.StationnameDropDownLabel.Text = 'Station name';

            % Create StationnameDropDown
            app.StationnameDropDown = uidropdown(app.SettingsPanel);
            app.StationnameDropDown.Items = {'Select Station', 'ARK', 'ES1', 'FEB', 'FN1', 'FN3', 'LTK'};
            app.StationnameDropDown.ValueChangedFcn = createCallbackFcn(app, @StationnameDropDownValueChanged, true);
            app.StationnameDropDown.Tooltip = {'select hyfrophone station'};
            app.StationnameDropDown.Position = [89 37 106 22];
            app.StationnameDropDown.Value = 'Select Station';

            % Create FileDurationEditFieldLabel
            app.FileDurationEditFieldLabel = uilabel(app.SettingsPanel);
            app.FileDurationEditFieldLabel.HorizontalAlignment = 'right';
            app.FileDurationEditFieldLabel.FontColor = [1 1 1];
            app.FileDurationEditFieldLabel.Position = [4 8 74 22];
            app.FileDurationEditFieldLabel.Text = 'File Duration';

            % Create FileDurationEditField
            app.FileDurationEditField = uieditfield(app.SettingsPanel, 'numeric');
            app.FileDurationEditField.Limits = [0 Inf];
            app.FileDurationEditField.ValueDisplayFormat = '%.2f';
            app.FileDurationEditField.ValueChangedFcn = createCallbackFcn(app, @FileDurationEditFieldValueChanged, true);
            app.FileDurationEditField.Tooltip = {'enter duration of each recording in seconds'};
            app.FileDurationEditField.Position = [89 8 83 22];

            % Create GetfromfirstfileButton
            app.GetfromfirstfileButton = uibutton(app.SettingsPanel, 'push');
            app.GetfromfirstfileButton.ButtonPushedFcn = createCallbackFcn(app, @GetfromfirstfileButtonPushed, true);
            app.GetfromfirstfileButton.Tooltip = {'get duration from first file in Path > 5min - is done automatically if File Duration is set to 0'};
            app.GetfromfirstfileButton.Position = [186 8 104 22];
            app.GetfromfirstfileButton.Text = 'Get from first file';

            % Create QCfilesButton
            app.QCfilesButton = uibutton(app.SettingsPanel, 'push');
            app.QCfilesButton.ButtonPushedFcn = createCallbackFcn(app, @QCfilesButtonPushed, true);
            app.QCfilesButton.Tooltip = {'select path, where qc-log  .pdf shall be stored'};
            app.QCfilesButton.Position = [89 127 106 22];
            app.QCfilesButton.Text = 'QC files';

            % Create HourSpinnerLabel
            app.HourSpinnerLabel = uilabel(app.SettingsPanel);
            app.HourSpinnerLabel.HorizontalAlignment = 'right';
            app.HourSpinnerLabel.FontColor = [1 1 1];
            app.HourSpinnerLabel.Position = [197 98 32 22];
            app.HourSpinnerLabel.Text = 'Hour';

            % Create HourSpinner
            app.HourSpinner = uispinner(app.SettingsPanel);
            app.HourSpinner.Limits = [0 24];
            app.HourSpinner.ValueChangedFcn = createCallbackFcn(app, @HourSpinnerValueChanged, true);
            app.HourSpinner.Tooltip = {'select hour of the day (0-24), when hydrophone was deployed'};
            app.HourSpinner.Position = [234 98 46 22];

            % Create HourSpinner_2Label
            app.HourSpinner_2Label = uilabel(app.SettingsPanel);
            app.HourSpinner_2Label.HorizontalAlignment = 'right';
            app.HourSpinner_2Label.FontColor = [1 1 1];
            app.HourSpinner_2Label.Position = [197 67 32 22];
            app.HourSpinner_2Label.Text = 'Hour';

            % Create HourSpinner_2
            app.HourSpinner_2 = uispinner(app.SettingsPanel);
            app.HourSpinner_2.Limits = [0 24];
            app.HourSpinner_2.ValueChangedFcn = createCallbackFcn(app, @HourSpinner_2ValueChanged, true);
            app.HourSpinner_2.Tooltip = {'select hour of the day (0-24), when hydrophone was recovered'};
            app.HourSpinner_2.Position = [235 67 45 22];

            % Create Lamp_6
            app.Lamp_6 = uilamp(app.SettingsPanel);
            app.Lamp_6.Position = [257 156 20 20];
            app.Lamp_6.Color = [1 0 0];

            % Create Lamp_7
            app.Lamp_7 = uilamp(app.SettingsPanel);
            app.Lamp_7.Position = [257 128 20 20];
            app.Lamp_7.Color = [1 0 0];

            % Create DeploymentDatePickerLabel_2
            app.DeploymentDatePickerLabel_2 = uilabel(app.SettingsPanel);
            app.DeploymentDatePickerLabel_2.HorizontalAlignment = 'right';
            app.DeploymentDatePickerLabel_2.FontColor = [1 1 1];
            app.DeploymentDatePickerLabel_2.Position = [4 155 66 22];
            app.DeploymentDatePickerLabel_2.Text = 'Select path';

            % Create DeploymentDatePickerLabel_3
            app.DeploymentDatePickerLabel_3 = uilabel(app.SettingsPanel);
            app.DeploymentDatePickerLabel_3.HorizontalAlignment = 'right';
            app.DeploymentDatePickerLabel_3.FontColor = [1 1 1];
            app.DeploymentDatePickerLabel_3.Position = [4 127 66 22];
            app.DeploymentDatePickerLabel_3.Text = 'Select path';

            % Create DutyCyclePanel
            app.DutyCyclePanel = uipanel(app.QCTab);
            app.DutyCyclePanel.ForegroundColor = [1 1 1];
            app.DutyCyclePanel.Title = 'Duty Cycle';
            app.DutyCyclePanel.BackgroundColor = [0 0.3294 0.6];
            app.DutyCyclePanel.Position = [16 257 179 129];

            % Create DutyCycleSwitchLabel
            app.DutyCycleSwitchLabel = uilabel(app.DutyCyclePanel);
            app.DutyCycleSwitchLabel.HorizontalAlignment = 'center';
            app.DutyCycleSwitchLabel.FontColor = [1 1 1];
            app.DutyCycleSwitchLabel.Position = [3 75 64 22];
            app.DutyCycleSwitchLabel.Text = 'Duty Cycle';

            % Create DutyCycleSwitch
            app.DutyCycleSwitch = uiswitch(app.DutyCyclePanel, 'slider');
            app.DutyCycleSwitch.Items = {'Yes', 'No'};
            app.DutyCycleSwitch.ValueChangedFcn = createCallbackFcn(app, @DutyCycleSwitchValueChanged, true);
            app.DutyCycleSwitch.FontColor = [1 1 1];
            app.DutyCycleSwitch.Position = [108 76 45 20];
            app.DutyCycleSwitch.Value = 'No';

            % Create IntervalsecEditFieldLabel
            app.IntervalsecEditFieldLabel = uilabel(app.DutyCyclePanel);
            app.IntervalsecEditFieldLabel.HorizontalAlignment = 'right';
            app.IntervalsecEditFieldLabel.FontColor = [1 1 1];
            app.IntervalsecEditFieldLabel.Position = [3 46 75 22];
            app.IntervalsecEditFieldLabel.Text = 'Interval (sec)';

            % Create IntervalsecEditField
            app.IntervalsecEditField = uieditfield(app.DutyCyclePanel, 'numeric');
            app.IntervalsecEditField.Limits = [0 Inf];
            app.IntervalsecEditField.ValueChangedFcn = createCallbackFcn(app, @IntervalsecEditFieldValueChanged, true);
            app.IntervalsecEditField.Editable = 'off';
            app.IntervalsecEditField.Enable = 'off';
            app.IntervalsecEditField.Tooltip = {'enter measurement interval in seconds'};
            app.IntervalsecEditField.Position = [100 46 61 22];

            % Create DC_Text
            app.DC_Text = uilabel(app.DutyCyclePanel);
            app.DC_Text.HorizontalAlignment = 'center';
            app.DC_Text.WordWrap = 'on';
            app.DC_Text.FontColor = [1 1 0];
            app.DC_Text.Position = [13 0 156 47];
            app.DC_Text.Text = 'Record for a period of ... min once every ... min';

            % Create Image
            app.Image = uiimage(app.QCTab);
            app.Image.Position = [204 248 108 144];
            app.Image.ImageSource = 'index2.png';

            % Create RUNButton
            app.RUNButton = uibutton(app.QCTab, 'push');
            app.RUNButton.ButtonPushedFcn = createCallbackFcn(app, @RUNButtonPushed, true);
            app.RUNButton.BackgroundColor = [0 0.3294 0.6];
            app.RUNButton.FontSize = 50;
            app.RUNButton.FontWeight = 'bold';
            app.RUNButton.FontColor = [1 1 1];
            app.RUNButton.Enable = 'off';
            app.RUNButton.Tooltip = {'run quality control and save results to pdf'};
            app.RUNButton.Position = [16 35 295 73];
            app.RUNButton.Text = 'RUN';

            % Create FlagFilesButton
            app.FlagFilesButton = uibutton(app.QCTab, 'push');
            app.FlagFilesButton.ButtonPushedFcn = createCallbackFcn(app, @FlagFilesButtonPushed, true);
            app.FlagFilesButton.BackgroundColor = [0 0.3294 0.6];
            app.FlagFilesButton.FontColor = [1 1 1];
            app.FlagFilesButton.Enable = 'off';
            app.FlagFilesButton.Position = [110 5 90 22];
            app.FlagFilesButton.Text = 'Flag Files';

            % Create ViewLogFileButton
            app.ViewLogFileButton = uibutton(app.QCTab, 'push');
            app.ViewLogFileButton.ButtonPushedFcn = createCallbackFcn(app, @ViewLogFileButtonPushed, true);
            app.ViewLogFileButton.BackgroundColor = [0 0.3294 0.6];
            app.ViewLogFileButton.FontColor = [1 1 1];
            app.ViewLogFileButton.Enable = 'off';
            app.ViewLogFileButton.Position = [16 5 82 22];
            app.ViewLogFileButton.Text = 'View Log File';

            % Create RemoveFlagsButton
            app.RemoveFlagsButton = uibutton(app.QCTab, 'push');
            app.RemoveFlagsButton.ButtonPushedFcn = createCallbackFcn(app, @RemoveFlagsButtonPushed, true);
            app.RemoveFlagsButton.BackgroundColor = [0 0.3294 0.6];
            app.RemoveFlagsButton.FontColor = [1 1 1];
            app.RemoveFlagsButton.Enable = 'off';
            app.RemoveFlagsButton.Position = [211 5 100 22];
            app.RemoveFlagsButton.Text = 'Remove Flags';

            % Create GetdatetimePanel_2
            app.GetdatetimePanel_2 = uipanel(app.QCTab);
            app.GetdatetimePanel_2.ForegroundColor = [1 1 1];
            app.GetdatetimePanel_2.Title = 'Get datetime';
            app.GetdatetimePanel_2.BackgroundColor = [0 0.3294 0.6];
            app.GetdatetimePanel_2.Position = [318 469 295 131];

            % Create TEXT_2
            app.TEXT_2 = uilabel(app.GetdatetimePanel_2);
            app.TEXT_2.HorizontalAlignment = 'center';
            app.TEXT_2.VerticalAlignment = 'top';
            app.TEXT_2.WordWrap = 'on';
            app.TEXT_2.FontWeight = 'bold';
            app.TEXT_2.FontColor = [1 1 1];
            app.TEXT_2.Position = [-1 14 291 62];
            app.TEXT_2.Text = {'The data of the first file in the source directory is:'; 'yymmddHHMMSS. The renamed file would be: XXX_yyMMddHHmmss.wav'};

            % Create FiledateEditField_2Label
            app.FiledateEditField_2Label = uilabel(app.GetdatetimePanel_2);
            app.FiledateEditField_2Label.HorizontalAlignment = 'right';
            app.FiledateEditField_2Label.FontColor = [1 1 1];
            app.FiledateEditField_2Label.Position = [8 80 48 22];
            app.FiledateEditField_2Label.Text = 'Filedate';

            % Create FiledateEditField_2
            app.FiledateEditField_2 = uieditfield(app.GetdatetimePanel_2, 'text');
            app.FiledateEditField_2.ValueChangedFcn = createCallbackFcn(app, @FiledateEditField_2ValueChanged, true);
            app.FiledateEditField_2.Position = [71 80 211 22];
            app.FiledateEditField_2.Value = '-----yyMMddHHmmss.wav';

            % Create RenametoStandardButton
            app.RenametoStandardButton = uibutton(app.GetdatetimePanel_2, 'push');
            app.RenametoStandardButton.ButtonPushedFcn = createCallbackFcn(app, @RenametoStandardButtonPushed, true);
            app.RenametoStandardButton.Enable = 'off';
            app.RenametoStandardButton.Position = [163 7 126 22];
            app.RenametoStandardButton.Text = 'Rename to Standard';

            % Create AgreeCheckBox
            app.AgreeCheckBox = uicheckbox(app.GetdatetimePanel_2);
            app.AgreeCheckBox.ValueChangedFcn = createCallbackFcn(app, @AgreeCheckBoxValueChanged, true);
            app.AgreeCheckBox.Text = 'Agree!';
            app.AgreeCheckBox.FontColor = [1 1 1];
            app.AgreeCheckBox.Position = [9 7 57 22];

            % Create RemovalofleadingandtrailingsecondsPanel
            app.RemovalofleadingandtrailingsecondsPanel = uipanel(app.QCTab);
            app.RemovalofleadingandtrailingsecondsPanel.ForegroundColor = [1 1 1];
            app.RemovalofleadingandtrailingsecondsPanel.Title = 'Removal of leading and trailing seconds';
            app.RemovalofleadingandtrailingsecondsPanel.BackgroundColor = [0 0.3294 0.6];
            app.RemovalofleadingandtrailingsecondsPanel.Position = [318 202 295 257];

            % Create RemoveleadingsecondsofeachfileCheckBox
            app.RemoveleadingsecondsofeachfileCheckBox = uicheckbox(app.RemovalofleadingandtrailingsecondsPanel);
            app.RemoveleadingsecondsofeachfileCheckBox.ValueChangedFcn = createCallbackFcn(app, @RemoveleadingsecondsofeachfileCheckBoxValueChanged, true);
            app.RemoveleadingsecondsofeachfileCheckBox.Enable = 'off';
            app.RemoveleadingsecondsofeachfileCheckBox.Tooltip = {'Removal of first two seconds might be necessary when processing data from ST600 to remove click sounds'};
            app.RemoveleadingsecondsofeachfileCheckBox.Text = 'Remove leading seconds of each file';
            app.RemoveleadingsecondsofeachfileCheckBox.FontColor = [1 1 1];
            app.RemoveleadingsecondsofeachfileCheckBox.Position = [11 209 219 22];

            % Create leadsecseditfield
            app.leadsecseditfield = uieditfield(app.RemovalofleadingandtrailingsecondsPanel, 'numeric');
            app.leadsecseditfield.ValueChangedFcn = createCallbackFcn(app, @leadsecseditfieldValueChanged, true);
            app.leadsecseditfield.Editable = 'off';
            app.leadsecseditfield.Enable = 'off';
            app.leadsecseditfield.Position = [140 183 42 22];

            % Create secondsLabel
            app.secondsLabel = uilabel(app.RemovalofleadingandtrailingsecondsPanel);
            app.secondsLabel.FontColor = [1 1 1];
            app.secondsLabel.Enable = 'off';
            app.secondsLabel.Position = [194 183 50 22];
            app.secondsLabel.Text = 'seconds';

            % Create RemovetrailingsecondsofeachfileCheckBox
            app.RemovetrailingsecondsofeachfileCheckBox = uicheckbox(app.RemovalofleadingandtrailingsecondsPanel);
            app.RemovetrailingsecondsofeachfileCheckBox.ValueChangedFcn = createCallbackFcn(app, @RemovetrailingsecondsofeachfileCheckBoxValueChanged, true);
            app.RemovetrailingsecondsofeachfileCheckBox.Enable = 'off';
            app.RemovetrailingsecondsofeachfileCheckBox.Text = 'Remove trailing seconds of each file';
            app.RemovetrailingsecondsofeachfileCheckBox.FontColor = [1 1 1];
            app.RemovetrailingsecondsofeachfileCheckBox.Position = [11 155 216 22];

            % Create trailsecseditfield
            app.trailsecseditfield = uieditfield(app.RemovalofleadingandtrailingsecondsPanel, 'numeric');
            app.trailsecseditfield.ValueChangedFcn = createCallbackFcn(app, @trailsecseditfieldValueChanged, true);
            app.trailsecseditfield.Editable = 'off';
            app.trailsecseditfield.Enable = 'off';
            app.trailsecseditfield.Position = [140 129 42 22];

            % Create secondsLabel_2
            app.secondsLabel_2 = uilabel(app.RemovalofleadingandtrailingsecondsPanel);
            app.secondsLabel_2.FontColor = [1 1 1];
            app.secondsLabel_2.Enable = 'off';
            app.secondsLabel_2.Position = [194 129 50 22];
            app.secondsLabel_2.Text = 'seconds';

            % Create CutButton
            app.CutButton = uibutton(app.RemovalofleadingandtrailingsecondsPanel, 'push');
            app.CutButton.ButtonPushedFcn = createCallbackFcn(app, @CutButtonPushed, true);
            app.CutButton.Enable = 'off';
            app.CutButton.Position = [180 60 100 22];
            app.CutButton.Text = 'Cut';

            % Create CreateCopyEditFieldLabel
            app.CreateCopyEditFieldLabel = uilabel(app.RemovalofleadingandtrailingsecondsPanel);
            app.CreateCopyEditFieldLabel.HorizontalAlignment = 'right';
            app.CreateCopyEditFieldLabel.FontColor = [1 1 1];
            app.CreateCopyEditFieldLabel.Enable = 'off';
            app.CreateCopyEditFieldLabel.Position = [22 97 73 22];
            app.CreateCopyEditFieldLabel.Text = 'Create Copy';

            % Create CreateCopyEditField
            app.CreateCopyEditField = uieditfield(app.RemovalofleadingandtrailingsecondsPanel, 'text');
            app.CreateCopyEditField.ValueChangedFcn = createCallbackFcn(app, @CreateCopyEditFieldValueChanged, true);
            app.CreateCopyEditField.Editable = 'off';
            app.CreateCopyEditField.Position = [107 97 100 22];
            app.CreateCopyEditField.Value = 'Select directory';

            % Create CheckBox
            app.CheckBox = uicheckbox(app.RemovalofleadingandtrailingsecondsPanel);
            app.CheckBox.ValueChangedFcn = createCallbackFcn(app, @CheckBoxValueChanged, true);
            app.CheckBox.Enable = 'off';
            app.CheckBox.Text = '';
            app.CheckBox.Position = [11 97 25 22];
            app.CheckBox.Value = true;

            % Create BrowseButton
            app.BrowseButton = uibutton(app.RemovalofleadingandtrailingsecondsPanel, 'push');
            app.BrowseButton.ButtonPushedFcn = createCallbackFcn(app, @BrowseButtonPushed, true);
            app.BrowseButton.Enable = 'off';
            app.BrowseButton.Position = [222 97 58 22];
            app.BrowseButton.Text = 'Browse';

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
            app.StationDropDown.Items = {'Select Station', 'ARK', 'ES1', 'FEB', 'FN1', 'FN3', 'LTK'};
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
            app.Image3.Position = [219 7 29 36];
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

            % Create InputwavandVoltagePanel
            app.InputwavandVoltagePanel = uipanel(app.CalibrationTab);
            app.InputwavandVoltagePanel.ForegroundColor = [1 1 1];
            app.InputwavandVoltagePanel.Title = 'Input .wav and Voltage';
            app.InputwavandVoltagePanel.BackgroundColor = [0 0.3294 0.6];
            app.InputwavandVoltagePanel.Position = [10 487 309 111];

            % Create SearchButton_2
            app.SearchButton_2 = uibutton(app.InputwavandVoltagePanel, 'push');
            app.SearchButton_2.ButtonPushedFcn = createCallbackFcn(app, @SearchButton_2Pushed, true);
            app.SearchButton_2.Position = [119 65 133 22];
            app.SearchButton_2.Text = 'Search';

            % Create TargetDirectoryDropDownLabel_3
            app.TargetDirectoryDropDownLabel_3 = uilabel(app.InputwavandVoltagePanel);
            app.TargetDirectoryDropDownLabel_3.HorizontalAlignment = 'right';
            app.TargetDirectoryDropDownLabel_3.FontColor = [1 1 1];
            app.TargetDirectoryDropDownLabel_3.Position = [3 65 95 22];
            app.TargetDirectoryDropDownLabel_3.Text = 'Source Directory';

            % Create Lamp_10
            app.Lamp_10 = uilamp(app.InputwavandVoltagePanel);
            app.Lamp_10.Position = [275 66 20 20];
            app.Lamp_10.Color = [1 0 0];

            % Create RMSVoltageVEditFieldLabel
            app.RMSVoltageVEditFieldLabel = uilabel(app.InputwavandVoltagePanel);
            app.RMSVoltageVEditFieldLabel.HorizontalAlignment = 'right';
            app.RMSVoltageVEditFieldLabel.FontColor = [1 1 1];
            app.RMSVoltageVEditFieldLabel.Position = [3 39 95 22];
            app.RMSVoltageVEditFieldLabel.Text = 'RMS Voltage (V)';

            % Create RMSVoltageVEditField
            app.RMSVoltageVEditField = uieditfield(app.InputwavandVoltagePanel, 'numeric');
            app.RMSVoltageVEditField.Limits = [0 0.5];
            app.RMSVoltageVEditField.ValueChangedFcn = createCallbackFcn(app, @RMSVoltageVEditFieldValueChanged, true);
            app.RMSVoltageVEditField.Position = [120 39 132 22];

            % Create Lamp_11
            app.Lamp_11 = uilamp(app.InputwavandVoltagePanel);
            app.Lamp_11.Position = [275 40 20 20];
            app.Lamp_11.Color = [1 0 0];

            % Create RMSVoltageVEditFieldLabel_2
            app.RMSVoltageVEditFieldLabel_2 = uilabel(app.InputwavandVoltagePanel);
            app.RMSVoltageVEditFieldLabel_2.HorizontalAlignment = 'right';
            app.RMSVoltageVEditFieldLabel_2.FontColor = [1 1 1];
            app.RMSVoltageVEditFieldLabel_2.Position = [14 12 84 22];
            app.RMSVoltageVEditFieldLabel_2.Text = 'Choose period';

            % Create Lamp_12
            app.Lamp_12 = uilamp(app.InputwavandVoltagePanel);
            app.Lamp_12.Position = [275 14 20 20];
            app.Lamp_12.Color = [1 0 0];

            % Create ChooseandComputeButton
            app.ChooseandComputeButton = uibutton(app.InputwavandVoltagePanel, 'push');
            app.ChooseandComputeButton.ButtonPushedFcn = createCallbackFcn(app, @ChooseandComputeButtonPushed, true);
            app.ChooseandComputeButton.BackgroundColor = [1 1 0];
            app.ChooseandComputeButton.Enable = 'off';
            app.ChooseandComputeButton.Position = [120 13 132 22];
            app.ChooseandComputeButton.Text = 'Choose and Compute';

            % Create SoundPressureinChamberEditFieldLabel
            app.SoundPressureinChamberEditFieldLabel = uilabel(app.CalibrationTab);
            app.SoundPressureinChamberEditFieldLabel.HorizontalAlignment = 'right';
            app.SoundPressureinChamberEditFieldLabel.FontColor = [1 1 1];
            app.SoundPressureinChamberEditFieldLabel.Position = [19 63 157 22];
            app.SoundPressureinChamberEditFieldLabel.Text = 'Sound Pressure in Chamber';

            % Create CalibrationFactordBEditFieldLabel
            app.CalibrationFactordBEditFieldLabel = uilabel(app.CalibrationTab);
            app.CalibrationFactordBEditFieldLabel.HorizontalAlignment = 'right';
            app.CalibrationFactordBEditFieldLabel.FontColor = [1 1 1];
            app.CalibrationFactordBEditFieldLabel.Position = [50 36 126 22];
            app.CalibrationFactordBEditFieldLabel.Text = 'Calibration Factor (dB)';

            % Create linearCalibrationFactorEditFieldLabel
            app.linearCalibrationFactorEditFieldLabel = uilabel(app.CalibrationTab);
            app.linearCalibrationFactorEditFieldLabel.HorizontalAlignment = 'right';
            app.linearCalibrationFactorEditFieldLabel.FontColor = [1 1 1];
            app.linearCalibrationFactorEditFieldLabel.Position = [43 8 133 22];
            app.linearCalibrationFactorEditFieldLabel.Text = 'linear Calibration Factor';

            % Create ResultsPanel
            app.ResultsPanel = uipanel(app.CalibrationTab);
            app.ResultsPanel.ForegroundColor = [1 1 1];
            app.ResultsPanel.Title = 'Results';
            app.ResultsPanel.BackgroundColor = [0 0.3294 0.6];
            app.ResultsPanel.Position = [9 7 309 112];

            % Create SoundPressureinChamberdBLabel
            app.SoundPressureinChamberdBLabel = uilabel(app.ResultsPanel);
            app.SoundPressureinChamberdBLabel.FontColor = [1 1 1];
            app.SoundPressureinChamberdBLabel.Position = [8 60 175 22];
            app.SoundPressureinChamberdBLabel.Text = 'Sound Pressure in Chamber dB';

            % Create CalibrationLeveldBre1VPaLabel
            app.CalibrationLeveldBre1VPaLabel = uilabel(app.ResultsPanel);
            app.CalibrationLeveldBre1VPaLabel.FontColor = [1 1 1];
            app.CalibrationLeveldBre1VPaLabel.Position = [8 36 170 22];
            app.CalibrationLeveldBre1VPaLabel.Text = 'Calibration Level dB re 1V/µPa';

            % Create LinearCalibrationFactorVPaLabel
            app.LinearCalibrationFactorVPaLabel = uilabel(app.ResultsPanel);
            app.LinearCalibrationFactorVPaLabel.FontColor = [1 1 1];
            app.LinearCalibrationFactorVPaLabel.Position = [8 9 173 22];
            app.LinearCalibrationFactorVPaLabel.Text = 'Linear Calibration Factor V/µPa';

            % Create linearCalibrationFactorEditField
            app.linearCalibrationFactorEditField = uieditfield(app.CalibrationTab, 'numeric');
            app.linearCalibrationFactorEditField.Position = [214 17 100 22];

            % Create CalibrationFactordBEditField
            app.CalibrationFactordBEditField = uieditfield(app.CalibrationTab, 'numeric');
            app.CalibrationFactordBEditField.Position = [214 42 100 22];

            % Create SoundPressureinChamberEditField
            app.SoundPressureinChamberEditField = uieditfield(app.CalibrationTab, 'numeric');
            app.SoundPressureinChamberEditField.Position = [214 68 100 22];

            % Create UIAxes
            app.UIAxes = uiaxes(app.CalibrationTab);
            xlabel(app.UIAxes, 'time [s]')
            ylabel(app.UIAxes, 'amplitude')
            app.UIAxes.YLim = [-1 1];
            app.UIAxes.XColor = [1 1 1];
            app.UIAxes.YColor = [1 1 1];
            app.UIAxes.YTick = [-1 -0.5 0 0.5 1];
            app.UIAxes.YTickLabel = {'-1'; '-0.5'; '0'; '0.5'; '1'};
            app.UIAxes.ZColor = [1 1 1];
            app.UIAxes.Color = [0.902 0.902 0.902];
            app.UIAxes.XGrid = 'on';
            app.UIAxes.YGrid = 'on';
            app.UIAxes.FontSize = 10;
            app.UIAxes.GridColor = [1 1 1];
            app.UIAxes.Position = [10 304 307 175];

            % Create UIAxes2
            app.UIAxes2 = uiaxes(app.CalibrationTab);
            xlabel(app.UIAxes2, 'frequency [Hz]')
            ylabel(app.UIAxes2, 'SPL [dB]')
            zlabel(app.UIAxes2, 'Z')
            app.UIAxes2.XLim = [10 40000];
            app.UIAxes2.YLim = [0 170];
            app.UIAxes2.XColor = [1 1 1];
            app.UIAxes2.XTick = [10 100 1000 10000];
            app.UIAxes2.XScale = 'log';
            app.UIAxes2.XMinorTick = 'on';
            app.UIAxes2.YColor = [1 1 1];
            app.UIAxes2.Color = [0.902 0.902 0.902];
            app.UIAxes2.XGrid = 'on';
            app.UIAxes2.YGrid = 'on';
            app.UIAxes2.FontSize = 10;
            app.UIAxes2.GridColor = [1 1 1];
            app.UIAxes2.Position = [10 130 307 175];

            % Create BSoundHorPamguideTab
            app.BSoundHorPamguideTab = uitab(app.TabGroup);
            app.BSoundHorPamguideTab.Title = 'BSoundH or Pamguide';
            app.BSoundHorPamguideTab.BackgroundColor = [0 0.2314 0.4118];

            % Create OpenBSoundHButton
            app.OpenBSoundHButton = uibutton(app.BSoundHorPamguideTab, 'push');
            app.OpenBSoundHButton.ButtonPushedFcn = createCallbackFcn(app, @OpenBSoundHButtonPushed, true);
            app.OpenBSoundHButton.Position = [13 561 100 22];
            app.OpenBSoundHButton.Text = 'Open BSoundH';

            % Create Image4
            app.Image4 = uiimage(app.BSoundHorPamguideTab);
            app.Image4.Position = [183 483 100 100];
            app.Image4.ImageSource = 'rolf.png';

            % Create TEXT_3
            app.TEXT_3 = uilabel(app.BSoundHorPamguideTab);
            app.TEXT_3.HorizontalAlignment = 'center';
            app.TEXT_3.FontSize = 24;
            app.TEXT_3.FontWeight = 'bold';
            app.TEXT_3.FontColor = [1 1 1];
            app.TEXT_3.Position = [7 423 282 39];
            app.TEXT_3.Text = 'Processing in BSoundH';

            % Create TEXT_4
            app.TEXT_4 = uilabel(app.BSoundHorPamguideTab);
            app.TEXT_4.HorizontalAlignment = 'center';
            app.TEXT_4.FontSize = 14;
            app.TEXT_4.FontWeight = 'bold';
            app.TEXT_4.FontColor = [1 1 1];
            app.TEXT_4.Position = [1 403 282 39];
            app.TEXT_4.Text = 'Remember the big 5';

            % Create TEXT_5
            app.TEXT_5 = uilabel(app.BSoundHorPamguideTab);
            app.TEXT_5.FontWeight = 'bold';
            app.TEXT_5.FontColor = [1 1 1];
            app.TEXT_5.Position = [7 357 347 39];
            app.TEXT_5.Text = '1. Import one month of data by selecting the folder';

            % Create TEXT_6
            app.TEXT_6 = uilabel(app.BSoundHorPamguideTab);
            app.TEXT_6.FontWeight = 'bold';
            app.TEXT_6.FontColor = [1 1 1];
            app.TEXT_6.Position = [7 330 300 34];
            app.TEXT_6.Text = '2. Set start date from file name and set files as fixed and alligned';

            % Create TEXT_7
            app.TEXT_7 = uilabel(app.BSoundHorPamguideTab);
            app.TEXT_7.FontWeight = 'bold';
            app.TEXT_7.FontColor = [1 1 1];
            app.TEXT_7.Position = [7 295 347 39];
            app.TEXT_7.Text = '3. Set calibration factor';

            % Create TEXT_8
            app.TEXT_8 = uilabel(app.BSoundHorPamguideTab);
            app.TEXT_8.FontWeight = 'bold';
            app.TEXT_8.FontColor = [1 1 1];
            app.TEXT_8.Position = [7 260 347 39];
            app.TEXT_8.Text = '4. Start Ambient Evaluation';

            % Create TEXT_9
            app.TEXT_9 = uilabel(app.BSoundHorPamguideTab);
            app.TEXT_9.FontWeight = 'bold';
            app.TEXT_9.FontColor = [1 1 1];
            app.TEXT_9.Position = [7 222 347 39];
            app.TEXT_9.Text = '5. Export data (don''t forget to validate)';

            % Create h5ConverterSpectralQCTab
            app.h5ConverterSpectralQCTab = uitab(app.TabGroup);
            app.h5ConverterSpectralQCTab.Title = 'h5 Converter & SpectralQC';
            app.h5ConverterSpectralQCTab.BackgroundColor = [0 0.2314 0.4118];

            % Create InputPanel
            app.InputPanel = uipanel(app.h5ConverterSpectralQCTab);
            app.InputPanel.ForegroundColor = [1 1 1];
            app.InputPanel.Title = 'Input';
            app.InputPanel.BackgroundColor = [0 0.3294 0.6];
            app.InputPanel.Position = [12 437 305 161];

            % Create ListBox
            app.ListBox = uilistbox(app.InputPanel);
            app.ListBox.Items = {};
            app.ListBox.Position = [140 14 156 116];
            app.ListBox.Value = {};

            % Create Addhdf5filesButton
            app.Addhdf5filesButton = uibutton(app.InputPanel, 'push');
            app.Addhdf5filesButton.Position = [8 67 100 22];
            app.Addhdf5filesButton.Text = 'Add .hdf5 file(s)';

            % Create Removehdf5filesButton
            app.Removehdf5filesButton = uibutton(app.InputPanel, 'push');
            app.Removehdf5filesButton.Position = [7 40 123 22];
            app.Removehdf5filesButton.Text = 'Remove .hdf5 file(s)';

            % Create h5formatDropDown
            app.h5formatDropDown = uidropdown(app.InputPanel);
            app.h5formatDropDown.Items = {'BSH format', 'ICES format'};
            app.h5formatDropDown.Position = [9 103 100 22];
            app.h5formatDropDown.Value = 'BSH format';

            % Create SelectAnalysesPanel
            app.SelectAnalysesPanel = uipanel(app.h5ConverterSpectralQCTab);
            app.SelectAnalysesPanel.ForegroundColor = [1 1 1];
            app.SelectAnalysesPanel.Title = 'Select Analyses';
            app.SelectAnalysesPanel.BackgroundColor = [0 0.3294 0.6];
            app.SelectAnalysesPanel.Position = [12 285 305 138];

            % Create PDSCheckBox_2
            app.PDSCheckBox_2 = uicheckbox(app.SelectAnalysesPanel);
            app.PDSCheckBox_2.Text = 'PDS';
            app.PDSCheckBox_2.FontColor = [1 1 1];
            app.PDSCheckBox_2.Position = [6 71 138 22];

            % Create SpectrogramCheckBox
            app.SpectrogramCheckBox = uicheckbox(app.SelectAnalysesPanel);
            app.SpectrogramCheckBox.Text = 'Spectrogram';
            app.SpectrogramCheckBox.FontColor = [1 1 1];
            app.SpectrogramCheckBox.Position = [6 94 132 22];

            % Create AutoCorrelationCheckBox
            app.AutoCorrelationCheckBox = uicheckbox(app.SelectAnalysesPanel);
            app.AutoCorrelationCheckBox.Text = 'Auto Correlation';
            app.AutoCorrelationCheckBox.FontColor = [1 1 1];
            app.AutoCorrelationCheckBox.Position = [6 49 109 22];

            % Create ATLshippingCheckBox
            app.ATLshippingCheckBox = uicheckbox(app.SelectAnalysesPanel);
            app.ATLshippingCheckBox.Text = 'ATL shipping';
            app.ATLshippingCheckBox.FontColor = [1 1 1];
            app.ATLshippingCheckBox.Position = [6 27 91 22];

            % Create ATLintermittentCheckBox
            app.ATLintermittentCheckBox = uicheckbox(app.SelectAnalysesPanel);
            app.ATLintermittentCheckBox.Text = 'ATL intermittent';
            app.ATLintermittentCheckBox.FontColor = [1 1 1];
            app.ATLintermittentCheckBox.Position = [175 29 106 22];

            % Create FAVCheckBox
            app.FAVCheckBox = uicheckbox(app.SelectAnalysesPanel);
            app.FAVCheckBox.Text = 'FAV';
            app.FAVCheckBox.FontColor = [1 1 1];
            app.FAVCheckBox.Position = [175 94 44 22];

            % Create ViolinsCheckBox
            app.ViolinsCheckBox = uicheckbox(app.SelectAnalysesPanel);
            app.ViolinsCheckBox.Text = 'Violins';
            app.ViolinsCheckBox.FontColor = [1 1 1];
            app.ViolinsCheckBox.Position = [175 73 57 22];

            % Create NoiseFloorCheckBox
            app.NoiseFloorCheckBox = uicheckbox(app.SelectAnalysesPanel);
            app.NoiseFloorCheckBox.Text = 'Noise Floor';
            app.NoiseFloorCheckBox.FontColor = [1 1 1];
            app.NoiseFloorCheckBox.Position = [175 51 83 22];

            % Create TonalsCheckBox
            app.TonalsCheckBox = uicheckbox(app.SelectAnalysesPanel);
            app.TonalsCheckBox.Text = 'Tonals';
            app.TonalsCheckBox.FontColor = [1 1 1];
            app.TonalsCheckBox.Position = [6 5 57 22];

            % Create AcousticMetricsCheckBox
            app.AcousticMetricsCheckBox = uicheckbox(app.SelectAnalysesPanel);
            app.AcousticMetricsCheckBox.Text = 'Acoustic Metrics';
            app.AcousticMetricsCheckBox.FontColor = [1 1 1];
            app.AcousticMetricsCheckBox.Position = [175 10 109 22];

            % Create selectallCheckBox
            app.selectallCheckBox = uicheckbox(app.SelectAnalysesPanel);
            app.selectallCheckBox.Text = 'select all';
            app.selectallCheckBox.FontColor = [1 1 1];
            app.selectallCheckBox.Position = [213 117 69 22];

            % Create QualityChecksPanel
            app.QualityChecksPanel = uipanel(app.h5ConverterSpectralQCTab);
            app.QualityChecksPanel.ForegroundColor = [1 1 1];
            app.QualityChecksPanel.Title = 'Quality Checks';
            app.QualityChecksPanel.BackgroundColor = [0 0.3294 0.6];
            app.QualityChecksPanel.Position = [12 157 305 113];

            % Create StationarityCheckBox
            app.StationarityCheckBox = uicheckbox(app.QualityChecksPanel);
            app.StationarityCheckBox.Text = 'Stationarity';
            app.StationarityCheckBox.FontColor = [1 1 1];
            app.StationarityCheckBox.Position = [6 46 138 22];

            % Create ThresholdsMinMaxCheckBox
            app.ThresholdsMinMaxCheckBox = uicheckbox(app.QualityChecksPanel);
            app.ThresholdsMinMaxCheckBox.Text = 'Thresholds Min/Max';
            app.ThresholdsMinMaxCheckBox.FontColor = [1 1 1];
            app.ThresholdsMinMaxCheckBox.Position = [6 69 132 22];

            % Create NoiseFloorCheckBox_2
            app.NoiseFloorCheckBox_2 = uicheckbox(app.QualityChecksPanel);
            app.NoiseFloorCheckBox_2.Text = 'Noise Floor';
            app.NoiseFloorCheckBox_2.FontColor = [1 1 1];
            app.NoiseFloorCheckBox_2.Position = [6 23 83 22];

            % Create AutoCorrelationCheckBox_2
            app.AutoCorrelationCheckBox_2 = uicheckbox(app.QualityChecksPanel);
            app.AutoCorrelationCheckBox_2.Text = 'Auto Correlation';
            app.AutoCorrelationCheckBox_2.FontColor = [1 1 1];
            app.AutoCorrelationCheckBox_2.Position = [6 1 109 22];

            % Create PlausibilityCheckBox
            app.PlausibilityCheckBox = uicheckbox(app.QualityChecksPanel);
            app.PlausibilityCheckBox.Text = 'Plausibility';
            app.PlausibilityCheckBox.FontColor = [1 1 1];
            app.PlausibilityCheckBox.Position = [167 69 132 22];

            % Create LogicalCheckBox
            app.LogicalCheckBox = uicheckbox(app.QualityChecksPanel);
            app.LogicalCheckBox.Text = 'Logical';
            app.LogicalCheckBox.FontColor = [1 1 1];
            app.LogicalCheckBox.Position = [167 48 132 22];

            % Create selectallCheckBox_2
            app.selectallCheckBox_2 = uicheckbox(app.QualityChecksPanel);
            app.selectallCheckBox_2.Text = 'select all';
            app.selectallCheckBox_2.FontColor = [1 1 1];
            app.selectallCheckBox_2.Position = [217 91 69 22];

            % Create ExportPanel
            app.ExportPanel = uipanel(app.h5ConverterSpectralQCTab);
            app.ExportPanel.ForegroundColor = [1 1 1];
            app.ExportPanel.Title = 'Export';
            app.ExportPanel.BackgroundColor = [0 0.3294 0.6];
            app.ExportPanel.Position = [13 64 304 78];

            % Create SelectOutputpathButton
            app.SelectOutputpathButton = uibutton(app.ExportPanel, 'push');
            app.SelectOutputpathButton.Position = [6 33 115 22];
            app.SelectOutputpathButton.Text = 'Select Output path';

            % Create EditField
            app.EditField = uieditfield(app.ExportPanel, 'text');
            app.EditField.Position = [147 33 145 22];

            % Create pdfCheckBox
            app.pdfCheckBox = uicheckbox(app.ExportPanel);
            app.pdfCheckBox.Text = 'pdf';
            app.pdfCheckBox.FontColor = [1 1 1];
            app.pdfCheckBox.Position = [7 8 39 22];

            % Create matCheckBox
            app.matCheckBox = uicheckbox(app.ExportPanel);
            app.matCheckBox.Text = 'mat';
            app.matCheckBox.FontColor = [1 1 1];
            app.matCheckBox.Position = [57 8 42 22];

            % Create figCheckBox
            app.figCheckBox = uicheckbox(app.ExportPanel);
            app.figCheckBox.Text = 'fig';
            app.figCheckBox.FontColor = [1 1 1];
            app.figCheckBox.Position = [110 8 35 22];

            % Create RUNButton_2
            app.RUNButton_2 = uibutton(app.h5ConverterSpectralQCTab, 'push');
            app.RUNButton_2.BackgroundColor = [0 0.3294 0.6];
            app.RUNButton_2.FontSize = 30;
            app.RUNButton_2.FontWeight = 'bold';
            app.RUNButton_2.FontColor = [1 1 1];
            app.RUNButton_2.Position = [12 8 305 44];
            app.RUNButton_2.Text = 'RUN';

            % Show the figure after all components are created
            app.QCTool.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = betta_debugged_fixed_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.QCTool)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.QCTool)
        end
    end
end
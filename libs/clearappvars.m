function clearappvars(GUI)
    %% clear all variables and lights to red
%author
    GUI.bsh_author = [];
    GUI.Lamp_author.Color = 'r';
    GUI.authorEditField.Value = ' ';
% calibration_date
    GUI.bsh_calibration_date = [];
    GUI.Lamp_calibration_date.Color = 'r';
    GUI.calibrationdateDatePicker.Value = datetime(2018,1,18,06,00,00);
% calibration factor    
    GUI.bsh_calibration_factor = [];
    GUI.Lamp_calibration_factor.Color = 'r';
    GUI.calibrationfactorEditField.Value = 0;
% calibration factor unit
    GUI.bsh_calibration_factor_unit = [];
    GUI.Lamp_calibration_factor_unit.Color = 'r';
    GUI.calibraionfactorunitEditField.Value = ' ';
% calibration level
    GUI.bsh_calibration_level = [];
    GUI.Lamp_calibration_level.Color = 'r';
    GUI.calibrationlevelEditField.Value = 0;
% calibration procedure
    GUI.bsh_calibration_procedure = [];
    GUI.Lamp_calibration_procedure.Color = 'r';
    GUI.calibrationprocedureEditField.Value = ' ';
% calibration reference frequency
    GUI.bsh_reference_frequencies_levels = [];
    GUI.Lamp_reference_frequencies_levels.Color = 'r';
    GUI.referencefrequencieslevelsEditField.Value = ' ';
    GUI.referencefrequencieslevelsEditField2.Value = 0;
% comments
    GUI.bsh_comments = [];
    GUI.Lamp_comments.Color = 'r';
    GUI.commentsEditField.Value = ' ';
% measurement position
    GUI.bsh_coordinatesmeasurementposition = [];
    GUI.Lamp_coordinates_measurement_position.Color = 'r';
    GUI.coordinatesmeasurementpositionEditField.Value = ' ';
% coordinates reference
    GUI.bsh_coordinatesreference = [];
    GUI.Lamp_coordinates_reference.Color = 'r';
    GUI.coordinatesreferenceEditField.Value = ' ';
% dataset type
    GUI.bsh_datasettype = [];
    GUI.Lamp_dataset_type.Color = 'r';
    GUI.datasettypeEditField.Value = ' ';
% dataset version
    GUI.bsh_datasetversion = [];
    GUI.Lamp_dataset_version.Color = 'r';
    GUI.datasetversionEditField.Value = ' ';
% hydrophone sensitivity
    GUI.bsh_hydrophone_sensitivity = [];
    GUI.Lamp_hydrophone_sensitivity.Color = 'r';
    GUI.hydrophonesensitivityEditField.Value = 0;
% hydrophone serial number
    GUI.bsh_hydrophone_serial_number = [];
    GUI.Lamp_hydrophone_serial_number.Color = 'r';
    GUI.hydrophoneserialnumberEditField.Value = ' ';
% hydrophone type
    GUI.bsh_hydrophone_type = [];
    GUI.Lamp_hydrophone_type.Color = 'r';
    GUI.hydrophonetypeEditField.Value = ' ';
% hydrophone manufacturer
    GUI.bsh_hydrophone_manufacturer = [];
    GUI.Lamp_hydrophone_manufacturer.Color = 'r';
    GUI.hydrophonemanufacturerEditField.Value = ' ';
% hydrophone sensitivity unit
    GUI.bsh_hydrophone_sensitivity_unit = [];
    GUI.Lamp_hydrophone_sensitivity_unit.Color = 'r';
    GUI.hydrophonesensitivityunitEditField.Value = ' ';
% duty cycle
    GUI.bsh_duty_cycle = [];
    GUI.Lamp_duty_cycle.Color = 'r';
    GUI.dutycycleEditField.Value = ' ';
% frequency count
    GUI.bsh_frequency_count = [];
    GUI.Lamp_frequency_count.Color = 'r';
    GUI.frequencycountEditField.Value = 0;
% frequency index
    GUI.bsh_frequency_index = [];
    GUI.Lamp_frequency_index.Color = 'r';
% leq averaging time
    GUI.bsh_leq_averaging_time = [];
    GUI.Lamp_leq_averaging_time.Color = 'r';
    GUI.leqaveragingtimeEditField.Value = 0;
% leq count
    GUI.bsh_leq_count = [];
    GUI.Lamp_leq_count.Color = 'r';
    GUI.leqcountEditField.Value = 0;
% leq datetime index
    GUI.bsh_datetime_index = [];
    GUI.Lamp_leq_datetime_index.Color = 'r';
% spectral stats L01
    GUI.bsh_spectral_stats_L01 = [];
% spectral stats L05
    GUI.bsh_spectral_stats_L05 = [];
% spectral stats L50
    GUI.bsh_spectral_stats_L50 = [];
% spectral stats L90
    GUI.bsh_spectral_stats_L90 = [];
% spectral stats L99
    GUI.bsh_spectral_stats_L99 = [];
% spectral stats LMax
    GUI.bsh_spectral_stats_LMax = [];
% spectral stats LMean
    GUI.bsh_spectral_stats_LMean = [];
% spectral stats LMin
    GUI.bsh_spectral_stats_LMin = [];
% leq spectro temporal values
    GUI.bsh_leq_spectro_temporal_values = [];
    GUI.Lamp_leq_spectro_temporal_values.Color = 'r';
% leq temporal stats L01
    GUI.bsh_temporal_stats_L01 = [];
% leq temporal stats L05
    GUI.bsh_temporal_stats_L05 = [];
% leq temporal stats L50
    GUI.bsh_temporal_stats_L50 = [];
% leq temporal stats L90
    GUI.bsh_temporal_stats_L90 = [];
% leq temporal stats L99
    GUI.bsh_temporal_stats_L99 = [];
% leq temporal stats LMax
    GUI.bsh_temporal_stats_LMax = [];
% leq temporal stats LMean
    GUI.bsh_temporal_stats_LMean = [];
% leq temporal stats LMin
    GUI.bsh_temporal_stats_LMin = [];
% leq temporal values
    GUI.bsh_leq_temporal_values = [];
    GUI.Lamp_leq_temporal_values.Color = 'r';
% measurement purpose
    GUI.bsh_measurement_purpose = [];
    GUI.Lamp_measurement_purpose.Color = 'r';
    GUI.measurementpurposeDropDown.Value = 'Select ...';
% measurement height
    GUI.bsh_measurement_height = [];
    GUI.Lamp_measurement_height.Color = 'r';
    GUI.measurementheightEditField.Value = 0;
% measurement setup
    GUI.bsh_measurement_setup = [];
    GUI.Lamp_measurement_setup.Color = 'r';
    GUI.measurementsetupDropDown.Value = 'Select ...';
% measurement position
    GUI.bsh_name_measurement_position = [];
    GUI.Lamp_name_measurement_position.Color = 'r';
    GUI.namemeasurementpositionEditField.Value = ' ';
% recorder manufacturer
    GUI.bsh_recorder_manufacturer = [];
    GUI.Lamp_recorder_manufacturer.Color = 'r';
    GUI.recordermanufacturerEditField.Value = ' '; 
% recorder serial number
    GUI.bsh_recorder_serialnumber = [];
    GUI.Lamp_recorder_serial_number.Color = 'r';
    GUI.recorderserialnumberEditField.Value = ' '; 
% recorder type
    GUI.bsh_recorder_type = [];
    GUI.Lamp_recorder_type.Color = 'r';
    GUI.recordertypeEditField.Value = ' '; 
% date of creation
    GUI.bsh_date_of_creation = [];
    GUI.Lamp_date_of_creation.Color = 'r';
    GUI.dateofcreationDatePicker.Value = datetime(2022,8,26,14,30,00);
% measuring institution
    GUI.bsh_measuring_institution = [];
    GUI.Lamp_measuring_institution.Color = 'r';
    GUI.measuringinstitutionEditField.Value = ' ';
% point of contact
    GUI.bsh_point_of_contact = [];
    GUI.Lamp_point_of_contact.Color = 'r';
    GUI.pointofcontactEditField.Value = ' ';
% rawdata samplingrate
    GUI.bsh_rawdata_samplingrate = [];
    GUI.Lamp_rawdata_samplingrate.Color = 'r';
    GUI.rawdatasamplingrateEditField.Value = 0;
% rawdata uuid
    GUI.bsh_rawdata_uuid = [];
    GUI.Lamp_rawdata_uuid.Color = 'r';
    GUI.rawdatauuidEditField.Value = ' ';
end
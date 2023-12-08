
function [D,R,R_EM] = bshh5readcheck(GUI,filename)
[name,group] = getdatasetsfromh5(filename);
%%
R = ones(1,53);
R_EM{53,2}={};
%%
try D.author = h5read(filename,'/author');
    GUI.bsh_author = D.author;
    GUI.Lamp_author.Color = 'g';
    GUI.authorEditField.Value = D.author;
catch
    R(1) = 0;
    R_EM{1,1}='/author';
    Index = find(contains(name,'author'));
    if ~isempty(Index)
        R_EM{1,2}=['Dataset was found here: ' char(group(Index)) ', but should be located here: "/" '];
        D.author = h5read(filename,[char(group(Index)) '/' char(name(Index))]);
    else
        R_EM{1,2} = 'Dataset was not found.';
        D.author = [];
    end
end
%%
try D.dataset_ambient_noise.calibration.calibration_date = h5read(filename,'/dataset_ambient_noise/calibration/calibration_date');
    GUI.bsh_calibration_date = D.dataset_ambient_noise.calibration.calibration_date;
    GUI.Lamp_calibration_date.Color = 'g';
    GUI.calibrationdateDatePicker.Value = datetime(D.dataset_ambient_noise.calibration.calibration_date,'ConvertFrom','posixtime');
catch
    R(2) = 0;
    R_EM{2,1}='.../calibration_date';
    Index = find(contains(name,'calibration_date'));
    if ~isempty(Index)
        R_EM{2,2}=['Dataset was found here: ' char(group(Index)) ', but should be located here: "/dataset_ambient_noise/calibration/" '];
        D.dataset_ambient_noise.calibration.calibration_date = h5read(filename,[char(group(Index)) '/' char(name(Index))]);
    else
        R_EM{2,2} = 'Dataset was not found.';
        D.dataset_ambient_noise.calibration.calibration_date = NaN;
    end
end
%%    
try D.dataset_ambient_noise.calibration.calibration_factor = h5read(filename,'/dataset_ambient_noise/calibration/calibration_factor');
    GUI.bsh_calibration_factor = D.dataset_ambient_noise.calibration.calibration_factor;
    GUI.Lamp_calibration_factor.Color = 'g';
    GUI.calibrationfactorEditField.Value = D.dataset_ambient_noise.calibration.calibration_factor;
catch
    R(3) = 0;
    R_EM{3,1}='.../calibration_factor';
    Index = find(contains(name,'calibration_factor'));
    if ~isempty(Index)
        R_EM{3,2}=['Dataset was found here: ' char(group(Index)) ', but should be located here: "/dataset_ambient_noise/calibration/" '];
        D.dataset_ambient_noise.calibration.calibration_factor = h5read(filename,[char(group(Index)) '/' char(name(Index))]);
    else
        R_EM{3,2} = 'Dataset was not found.';
        D.dataset_ambient_noise.calibration.calibration_factor = NaN;
    end
end
%%
try D.dataset_ambient_noise.calibration.calibration_factor_unit = h5read(filename,'/dataset_ambient_noise/calibration/calibration_factor_unit');
    GUI.bsh_calibration_factor_unit = D.dataset_ambient_noise.calibration.calibration_factor_unit;
    GUI.Lamp_calibration_factor_unit.Color = 'g';
    GUI.calibraionfactorunitEditField.Value = D.dataset_ambient_noise.calibration.calibration_factor_unit;
catch
    R(4) = 0;
    R_EM{4,1}='.../calibration_factor_unit';
    Index = find(contains(name,'calibration_factor_unit'));
    if ~isempty(Index)
        R_EM{4,2}=['Dataset was found here: ' char(group(Index)) ', but should be located here: "/dataset_ambient_noise/calibration/" '];
        D.dataset_ambient_noise.calibration.calibration_factor_unit = h5read(filename,[char(group(Index)) '/' char(name(Index))]);
    else
        R_EM{4,2} = 'Dataset was not found.';
        D.dataset_ambient_noise.calibration.calibration_factor_unit = [];
    end
end
%%
try D.dataset_ambient_noise.calibration.calibration_level = h5read(filename,'/dataset_ambient_noise/calibration/calibration_level');
    GUI.bsh_calibration_level = D.dataset_ambient_noise.calibration.calibration_level;
    GUI.Lamp_calibration_level.Color = 'g';
    GUI.calibrationlevelEditField.Value = D.dataset_ambient_noise.calibration.calibration_level;
catch
    R(5) = 0;
    R_EM{5,1}='.../calibration_level';
    Index = find(contains(name,'calibration_level'));
    if ~isempty(Index)
        R_EM{5,2}=['Dataset was found here: ' char(group(Index)) ', but should be located here: "/dataset_ambient_noise/calibration/" '];
        D.dataset_ambient_noise.calibration.calibration_level = h5read(filename,[char(group(Index)) '/' char(name(Index))]);
    else
        R_EM{5,2} = 'Dataset was not found.';
        D.dataset_ambient_noise.calibration.calibration_level = NaN;
    end
end
%%
try D.dataset_ambient_noise.calibration.calibration_procedure = h5read(filename,'/dataset_ambient_noise/calibration/calibration_procedure');
    GUI.bsh_calibration_procedure = D.dataset_ambient_noise.calibration.calibration_procedure;
    GUI.Lamp_calibration_procedure.Color = 'g';
    GUI.calibrationprocedureEditField.Value = D.dataset_ambient_noise.calibration.calibration_procedure;
catch
    R(6) = 0;
    R_EM{6,1}='.../calibration_procedure';
    Index = find(contains(name,'calibration_procedure'));
    if ~isempty(Index)
        R_EM{6,2}=['Dataset was found here: ' char(group(Index)) ', but should be located here: "/dataset_ambient_noise/calibration/" '];
        D.dataset_ambient_noise.calibration.calibration_procedure = h5read(filename,[char(group(Index)) '/' char(name(Index))]);
    else
        R_EM{6,2} = 'Dataset was not found.';
        D.dataset_ambient_noise.calibration.calibration_procedure = [];
    end
end
%%
try D.dataset_ambient_noise.calibration.reference_frequency = h5read(filename,'/dataset_ambient_noise/calibration/reference_frequencies_levels');
    GUI.bsh_reference_frequencies_levels = D.dataset_ambient_noise.calibration.reference_frequency;
    GUI.Lamp_reference_frequencies_levels.Color = 'g';
    A = split(D.dataset_ambient_noise.calibration.reference_frequency,' ');
    GUI.referencefrequencieslevelsEditField.Value = A(1);
    GUI.referencefrequencieslevelsEditField2.Value = double(A(2));
catch
    R(7) = 0;
    R_EM{7,1}='.../reference_frequency';
    Index = find(contains(name,'reference_frequency'));
    if ~isempty(Index)
        R_EM{7,2}=['Dataset was found here: ' char(group(Index)) ', but should be located here: "/dataset_ambient_noise/calibration/" '];
        D.dataset_ambient_noise.calibration.reference_frequency = h5read(filename,[char(group(Index)) '/' char(name(Index))]);
    else
        R_EM{7,2} = 'Dataset was not found.';
        D.dataset_ambient_noise.calibration.reference_frequency = NaN;
    end
end
%%
try D.dataset_ambient_noise.comments = h5read(filename,'/dataset_ambient_noise/comments');
    GUI.bsh_comments = D.dataset_ambient_noise.comments;
    GUI.Lamp_comments.Color = 'g';
    GUI.commentsEditField.Value = D.dataset_ambient_noise.comments;
catch
    R(8) = 0;
    R_EM{8,1}='.../comments';
    Index = find(contains(name,'comments'));
    if ~isempty(Index)
        R_EM{8,2}=['Dataset was found here: ' char(group(Index)) ', but should be located here: "/dataset_ambient_noise/" '];
        D.dataset_ambient_noise.comments = h5read(filename,[char(group(Index)) '/' char(name(Index))]);
    else
        R_EM{8,2} = 'Dataset was not found.';
        D.dataset_ambient_noise.comments = [];
    end
end
%%
try D.dataset_ambient_noise.coordinates_measurement_position = h5read(filename,'/dataset_ambient_noise/coordinates_measurement_position');
    GUI.bsh_coordinatesmeasurementposition = D.dataset_ambient_noise.coordinates_measurement_position;
    GUI.Lamp_coordinates_measurement_position.Color = 'g';
    A = ['[' num2str(D.dataset_ambient_noise.coordinates_measurement_position(1)) ','  num2str(D.dataset_ambient_noise.coordinates_measurement_position(2)) ']'];
    GUI.coordinatesmeasurementpositionEditField.Value = A;
catch
    R(9) = 0;
    R_EM{9,1}='.../coordinates_measurement_position';
    Index = find(contains(name,'coordinates_measurement_position'));
    if ~isempty(Index)
        R_EM{9,2}=['Dataset was found here: ' char(group(Index)) ', but should be located here: "/dataset_ambient_noise/" '];
        D.dataset_ambient_noise.coordinates_measurement_position = h5read(filename,[char(group(Index)) '/' char(name(Index))]);
    else
        R_EM{9,2} = 'Dataset was not found.';
        D.dataset_ambient_noise.coordinates_measurement_position = NaN;
    end
end
%%
try D.dataset_ambient_noise.coordinates_reference = h5read(filename,'/dataset_ambient_noise/coordinates_reference');
    GUI.bsh_coordinatesreference = D.dataset_ambient_noise.coordinates_reference;
    GUI.Lamp_coordinates_reference.Color = 'g';
    GUI.coordinatesreferenceEditField.Value = D.dataset_ambient_noise.coordinates_reference;
catch
    R(10) = 0;
    R_EM{10,1}='.../coordinates_reference';
    Index = find(contains(name,'coordinates_reference'));
    if ~isempty(Index)
        R_EM{10,2}=['Dataset was found here: ' char(group(Index)) ', but should be located here: "/dataset_ambient_noise/" '];
        D.dataset_ambient_noise.coordinates_reference = h5read(filename,[char(group(Index)) '/' char(name(Index))]);
    else
        R_EM{10,2} = 'Dataset was not found.';
        D.dataset_ambient_noise.coordinates_reference = [];
    end
end
%%
try D.dataset_ambient_noise.dataset_type = h5read(filename,'/dataset_ambient_noise/dataset_type');
    GUI.bsh_datasettype = D.dataset_ambient_noise.dataset_type;
    GUI.Lamp_dataset_type.Color = 'g';
    GUI.datasettypeEditField.Value = D.dataset_ambient_noise.dataset_type;
catch
    R(11) = 0;
    R_EM{11,1}='.../dataset_type';
    Index = find(contains(name,'dataset_type'));
    if ~isempty(Index)
        R_EM{11,2}=['Dataset was found here: ' char(group(Index)) ', but should be located here: "/dataset_ambient_noise/" '];
        D.dataset_ambient_noise.dataset_type = h5read(filename,[char(group(Index)) '/' char(name(Index))]);
    else
        R_EM{11,2} = 'Dataset was not found.';
        D.dataset_ambient_noise.dataset_type = [];
    end
end
%%
try D.dataset_ambient_noise.dataset_version = h5read(filename,'/dataset_ambient_noise/dataset_version');
    GUI.bsh_datasetversion = D.dataset_ambient_noise.dataset_version;
    GUI.Lamp_dataset_version.Color = 'g';
    GUI.datasetversionEditField.Value = D.dataset_ambient_noise.dataset_version;
catch
    R(12) = 0;
    R_EM{12,1}='.../dataset_version';
    Index = find(contains(name,'dataset_version'));
    if ~isempty(Index)
        R_EM{12,2}=['Dataset was found here: ' char(group(Index)) ', but should be located here: "/dataset_ambient_noise/" '];
        D.dataset_ambient_noise.dataset_version = h5read(filename,[char(group(Index)) '/' char(name(Index))]);
    else
        R_EM{12,2} = 'Dataset was not found.';
        D.dataset_ambient_noise.dataset_version = NaN;
    end
end
%%
try D.dataset_ambient_noise.hydrophone.hydrophone_sensitivity = h5read(filename,'/dataset_ambient_noise/hydrophone/hydrophone_sensitivity');
    GUI.bsh_hydrophone_sensitivity = D.dataset_ambient_noise.hydrophone.hydrophone_sensitivity;
    GUI.Lamp_hydrophone_sensitivity.Color = 'g';
    GUI.hydrophonesensitivityEditField.Value = D.dataset_ambient_noise.hydrophone.hydrophone_sensitivity;
catch
    R(13) = 0;
    R_EM{13,1}='.../hydrophone_sensitivity';
    Index = find(strcmp(name,'hydrophone_sensitivity'));
    if ~isempty(Index)
        R_EM{13,2}=['Dataset was found here: ' char(group(Index)) ', but should be located here: "/dataset_ambient_noise/hydrophone/" '];
        D.dataset_ambient_noise.hydrophone.hydrophone_sensitivity = h5read(filename,[char(group(Index)) '/' char(name(Index))]);
    else
        R_EM{13,2} = 'Dataset was not found.';
        D.dataset_ambient_noise.hydrophone.hydrophone_sensitivity = NaN;
    end
end
%%
try D.dataset_ambient_noise.hydrophone.hydrophone_serial_number = h5read(filename,'/dataset_ambient_noise/hydrophone/hydrophone_serial_number');
    GUI.bsh_hydrophone_serial_number = D.dataset_ambient_noise.hydrophone.hydrophone_serial_number;
    GUI.Lamp_hydrophone_serial_number.Color = 'g';
    GUI.hydrophoneserialnumberEditField.Value = D.dataset_ambient_noise.hydrophone.hydrophone_serial_number;
catch
    R(14) = 0;
    R_EM{14,1}='.../hydrophone_serial_number';
    Index = find(contains(name,'hydrophone_serial_number'));
    if ~isempty(Index)
        R_EM{14,2}=['Dataset was found here: ' char(group(Index)) ', but should be located here: "/dataset_ambient_noise/hydrophone/" '];
        D.dataset_ambient_noise.hydrophone.hydrophone_serial_number = h5read(filename,[char(group(Index)) '/' char(name(Index))]);
    else
        R_EM{14,2} = 'Dataset was not found.';
        D.dataset_ambient_noise.hydrophone.hydrophone_serial_number = [];
    end
end
%%
try D.dataset_ambient_noise.hydrophone.hydrophone_type = h5read(filename,'/dataset_ambient_noise/hydrophone/hydrophone_type');
    GUI.bsh_hydrophone_type = D.dataset_ambient_noise.hydrophone.hydrophone_type;
    GUI.Lamp_hydrophone_type.Color = 'g';
    GUI.hydrophonetypeEditField.Value = D.dataset_ambient_noise.hydrophone.hydrophone_type;
catch
    R(15) = 0;
    R_EM{15,1}='.../hydrophone_type';
    Index = find(contains(name,'hydrophone_type'));
    if ~isempty(Index)
        R_EM{15,2}=['Dataset was found here: ' char(group(Index)) ', but should be located here: "/dataset_ambient_noise/hydrophone/" '];
        D.dataset_ambient_noise.hydrophone.hydrophone_type = h5read(filename,[char(group(Index)) '/' char(name(Index))]);
    else
        R_EM{15,2} = 'Dataset was not found.';
        D.dataset_ambient_noise.hydrophone.hydrophone_type = [];
    end
end
%%
try D.dataset_ambient_noise.hydrophone.hydrophone_manufacturer = h5read(filename,'/dataset_ambient_noise/hydrophone/hydrophone_manufacturer');
    GUI.bsh_hydrophone_manufacturer = D.dataset_ambient_noise.hydrophone.hydrophone_manufacturer;
    GUI.Lamp_hydrophone_manufacturer.Color = 'g';
    GUI.hydrophonemanufacturerEditField.Value = D.dataset_ambient_noise.hydrophone.hydrophone_manufacturer;
catch
    R(16) = 0;
    R_EM{16,1}='.../hydrophone_manufacturer';
    Index = find(contains(name,'hydrophone_manufacturer'));
    if ~isempty(Index)
        R_EM{16,2}=['Dataset was found here: ' char(group(Index)) ', but should be located here: "/dataset_ambient_noise/hydrophone/" '];
        D.dataset_ambient_noise.hydrophone.hydrophone_manufacturer = h5read(filename,[char(group(Index)) '/' char(name(Index))]);
    else
        R_EM{16,2} = 'Dataset was not found.';
        D.dataset_ambient_noise.hydrophone.hydrophone_manufacturer = [];
    end
end
%%
try D.dataset_ambient_noise.hydrophone.hydrophone_sensitivity_unit = h5read(filename,'/dataset_ambient_noise/hydrophone/hydrophone_sensitivity_unit');
    GUI.bsh_hydrophone_sensitivity_unit = D.dataset_ambient_noise.hydrophone.hydrophone_sensitivity_unit;
    GUI.Lamp_hydrophone_sensitivity_unit.Color = 'g';
    GUI.hydrophonesensitivityunitEditField.Value = D.dataset_ambient_noise.hydrophone.hydrophone_sensitivity_unit;
catch
    R(17) = 0;
    R_EM{17,1}='.../hydrophone_sensitivity_unit';
    Index = find(strcmp(name,'hydrophone_sensitivity_unit'));
    if ~isempty(Index)
        R_EM{17,2}=['Dataset was found here: ' char(group(Index)) ', but should be located here: "/dataset_ambient_noise/hydrophone/" '];
        D.dataset_ambient_noise.hydrophone.hydrophone_sensitivity_unit = h5read(filename,[char(group(Index)) '/' char(name(Index))]);
    else
        R_EM{17,2} = 'Dataset was not found.';
        D.dataset_ambient_noise.hydrophone.hydrophone_sensitivity_unit = [];
    end
end
%%
try D.dataset_ambient_noise.measurement_data.duty_cycle = h5read(filename,'/dataset_ambient_noise/measurement_data/duty_cycle');
    GUI.bsh_duty_cycle = D.dataset_ambient_noise.measurement_data.duty_cycle;
    GUI.Lamp_duty_cycle.Color = 'g';
    A = regexprep(num2str(D.dataset_ambient_noise.measurement_data.duty_cycle),'\s+',',');
    GUI.dutycycleEditField.Value = A;
catch
    R(18) = 0;
    R_EM{18,1}='.../duty_cycle';
    Index = find(contains(name,'duty_cycle'));
    if ~isempty(Index)
        R_EM{18,2}=['Dataset was found here: ' char(group(Index)) ', but should be located here: "/dataset_ambient_noise/measurement_data/" '];
        D.dataset_ambient_noise.measurement_data.duty_cycle = h5read(filename,[char(group(Index)) '/' char(name(Index))]);
    else
        R_EM{18,2} = 'Dataset was not found.';
        D.dataset_ambient_noise.measurement_data.duty_cycle = NaN;
    end
end
%%
try D.dataset_ambient_noise.measurement_data.frequency_count = h5read(filename,'/dataset_ambient_noise/measurement_data/frequency_count');
    GUI.bsh_frequency_count = D.dataset_ambient_noise.measurement_data.frequency_count;
    GUI.Lamp_frequency_count.Color = 'g';
    GUI.frequencycountEditField.Value = double(D.dataset_ambient_noise.measurement_data.frequency_count);
catch
    R(19) = 0;
    R_EM{19,1}='.../frequency_count';
    Index = find(contains(name,'frequency_count'));
    if ~isempty(Index)
        R_EM{19,2}=['Dataset was found here: ' char(group(Index)) ', but should be located here: "/dataset_ambient_noise/measurement_data/" '];
        D.dataset_ambient_noise.measurement_data.frequency_count = h5read(filename,[char(group(Index)) '/' char(name(Index))]);
    else
        R_EM{19,2} = 'Dataset was not found.';
        D.dataset_ambient_noise.measurement_data.frequency_count = NaN;
    end
end
%%
try D.dataset_ambient_noise.measurement_data.frequency_index = h5read(filename,'/dataset_ambient_noise/measurement_data/frequency_index');
    GUI.bsh_frequency_index = D.dataset_ambient_noise.measurement_data.frequency_index;
    GUI.Lamp_frequency_index.Color = 'g';
catch
    R(20) = 0;
    R_EM{20,1}='.../frequency_index';
    Index = find(contains(name,'frequency_index'));
    if ~isempty(Index)
        R_EM{20,2}=['Dataset was found here: ' char(group(Index)) ', but should be located here: "/dataset_ambient_noise/measurement_data/" '];
        D.dataset_ambient_noise.measurement_data.frequency_index = h5read(filename,[char(group(Index)) '/' char(name(Index))]);
    else
        R_EM{20,2} = 'Dataset was not found.';
        D.dataset_ambient_noise.measurement_data.frequency_index = NaN;
    end
end
%%
try D.dataset_ambient_noise.measurement_data.leq_averaging_time = h5read(filename,'/dataset_ambient_noise/measurement_data/leq_averaging_time');
    GUI.bsh_leq_averaging_time = D.dataset_ambient_noise.measurement_data.leq_averaging_time;
    GUI.Lamp_leq_averaging_time.Color = 'g';
    GUI.leqaveragingtimeEditField.Value = D.dataset_ambient_noise.measurement_data.leq_averaging_time;
catch
    R(21) = 0;
    R_EM{21,1}='.../leq_averaging_time';
    Index = find(contains(name,'leq_averaging_time'));
    if ~isempty(Index)
        R_EM{21,2}=['Dataset was found here: ' char(group(Index)) ', but should be located here: "/dataset_ambient_noise/measurement_data/" '];
        D.dataset_ambient_noise.measurement_data.leq_averaging_time = h5read(filename,[char(group(Index)) '/' char(name(Index))]);
    else
        R_EM{21,2} = 'Dataset was not found.';
        D.dataset_ambient_noise.measurement_data.leq_averaging_time = NaN;
    end
end
%%
try D.dataset_ambient_noise.measurement_data.leq_count = h5read(filename,'/dataset_ambient_noise/measurement_data/leq_count');
    GUI.bsh_leq_count = D.dataset_ambient_noise.measurement_data.leq_count;
    GUI.Lamp_leq_count.Color = 'g';
    GUI.leqcountEditField.Value = double(D.dataset_ambient_noise.measurement_data.leq_count);
catch
   R(22) = 0;
    R_EM{22,1}='.../leq_count';
    Index = find(contains(name,'leq_count'));
    if ~isempty(Index)
        R_EM{22,2}=['Dataset was found here: ' char(group(Index)) ', but should be located here: "/dataset_ambient_noise/measurement_data/" '];
        D.dataset_ambient_noise.measurement_data.leq_count = h5read(filename,[char(group(Index)) '/' char(name(Index))]);
    else
        R_EM{22,2} = 'Dataset was not found.';
        D.dataset_ambient_noise.measurement_data.leq_count = NaN;
    end
end 
%%
try D.dataset_ambient_noise.measurement_data.leq_datetime_index = h5read(filename,'/dataset_ambient_noise/measurement_data/leq_datetime_index');
    GUI.bsh_datetime_index = D.dataset_ambient_noise.measurement_data.leq_datetime_index;
    GUI.Lamp_leq_datetime_index.Color = 'g';
catch
    R(23) = 0;
    R_EM{23,1}='.../leq_datetime_index';
    Index = find(contains(name,'leq_datetime_index'));
    if ~isempty(Index)
        R_EM{23,2}=['Dataset was found here: ' char(group(Index)) ', but should be located here: "/dataset_ambient_noise/measurement_data/" '];
        D.dataset_ambient_noise.measurement_data.leq_datetime_index = h5read(filename,[char(group(Index)) '/' char(name(Index))]);
    else
        R_EM{23,2} = 'Dataset was not found.';
        D.dataset_ambient_noise.measurement_data.leq_datetime_index = NaN;
    end
end 
%%
try D.dataset_ambient_noise.measurement_data.leq_spectral_stats.L01 = h5read(filename,'/dataset_ambient_noise/measurement_data/leq_spectral_stats/L01');
    GUI.bsh_spectral_stats_L01 = D.dataset_ambient_noise.measurement_data.leq_spectral_stats.L01;
catch
    R(24) = 0;
    R_EM{24,1}='.../leq_spectral_stats/L01';
    Index = find(contains(name,'L01'));
    u = strfind(group(Index),'spectral');
    u = find(~cellfun(@isempty,u));
    Index = Index(u);
    if ~isempty(Index)
        R_EM{24,2}=['Dataset was found here: ' char(group(Index)) ', but should be located here: "/dataset_ambient_noise/measurement_data/leq_spectral_stats/" '];
        D.dataset_ambient_noise.measurement_data.leq_spectral_stats.L01 = h5read(filename,[char(group(Index)) '/' char(name(Index))]);
    else
        R_EM{24,2} = 'Dataset was not found.';
        D.dataset_ambient_noise.measurement_data.leq_spectral_stats.L01 = NaN;
    end
end 
%%
try D.dataset_ambient_noise.measurement_data.leq_spectral_stats.L05 = h5read(filename,'/dataset_ambient_noise/measurement_data/leq_spectral_stats/L05');
    GUI.bsh_spectral_stats_L05 = D.dataset_ambient_noise.measurement_data.leq_spectral_stats.L05;
catch
    R(25) = 0;
    R_EM{25,1}='.../leq_spectral_stats/L05';
    Index = find(contains(name,'L05'));
    u = strfind(group(Index),'spectral');
    u = find(~cellfun(@isempty,u));
    Index = Index(u);
    if ~isempty(Index)
        R_EM{25,2}=['Dataset was found here: ' char(group(Index)) ', but should be located here: "/dataset_ambient_noise/measurement_data/leq_spectral_stats/" '];
        D.dataset_ambient_noise.measurement_data.leq_spectral_stats.L05 = h5read(filename,[char(group(Index)) '/' char(name(Index))]);
    else
        R_EM{25,2} = 'Dataset was not found.';
        D.dataset_ambient_noise.measurement_data.leq_spectral_stats.L05 = NaN;
    end
end 
%%
try D.dataset_ambient_noise.measurement_data.leq_spectral_stats.L50 = h5read(filename,'/dataset_ambient_noise/measurement_data/leq_spectral_stats/L50');
    GUI.bsh_spectral_stats_L50 = D.dataset_ambient_noise.measurement_data.leq_spectral_stats.L50;
catch
    R(26) = 0;
    R_EM{26,1}='.../leq_spectral_stats/L50';
    Index = find(contains(name,'L50'));
    u = strfind(group(Index),'spectral');
    u = find(~cellfun(@isempty,u));
    Index = Index(u);
    if ~isempty(Index)
        R_EM{26,2}=['Dataset was found here: ' char(group(Index)) ', but should be located here: "/dataset_ambient_noise/measurement_data/leq_spectral_stats/" '];
        D.dataset_ambient_noise.measurement_data.leq_spectral_stats.L50 = h5read(filename,[char(group(Index)) '/' char(name(Index))]);
    else
        R_EM{26,2} = 'Dataset was not found.';
        D.dataset_ambient_noise.measurement_data.leq_spectral_stats.L50 = NaN;
    end
end 
%%
try D.dataset_ambient_noise.measurement_data.leq_spectral_stats.L90 = h5read(filename,'/dataset_ambient_noise/measurement_data/leq_spectral_stats/L90');
    GUI.bsh_spectral_stats_L90 = D.dataset_ambient_noise.measurement_data.leq_spectral_stats.L90;
catch
    R(27) = 0;
    R_EM{27,1}='.../leq_spectral_stats/L90';
    Index = find(contains(name,'L90'));
    u = strfind(group(Index),'spectral');
    u = find(~cellfun(@isempty,u));
    Index = Index(u);
    if ~isempty(Index)
        R_EM{27,2}=['Dataset was found here: ' char(group(Index)) ', but should be located here: "/dataset_ambient_noise/measurement_data/leq_spectral_stats/" '];
        D.dataset_ambient_noise.measurement_data.leq_spectral_stats.L90 = h5read(filename,[char(group(Index)) '/' char(name(Index))]);
    else
        R_EM{27,2} = 'Dataset was not found.';
        D.dataset_ambient_noise.measurement_data.leq_spectral_stats.L90 = NaN;
    end
end 
%%
try D.dataset_ambient_noise.measurement_data.leq_spectral_stats.L99 = h5read(filename,'/dataset_ambient_noise/measurement_data/leq_spectral_stats/L99');
    GUI.bsh_spectral_stats_L99 = D.dataset_ambient_noise.measurement_data.leq_spectral_stats.L99;
catch
    R(28) = 0;
    R_EM{28,1}='.../leq_spectral_stats/L99';
    Index = find(contains(name,'L99'));
    u = strfind(group(Index),'spectral');
    u = find(~cellfun(@isempty,u));
    Index = Index(u);
    if ~isempty(Index)
        R_EM{28,2}=['Dataset was found here: ' char(group(Index)) ', but should be located here: "/dataset_ambient_noise/measurement_data/leq_spectral_stats/" '];
        D.dataset_ambient_noise.measurement_data.leq_spectral_stats.L99 = h5read(filename,[char(group(Index)) '/' char(name(Index))]);
    else
        R_EM{28,2} = 'Dataset was not found.';
        D.dataset_ambient_noise.measurement_data.leq_spectral_stats.L99 = NaN;
    end
end 
%%
try D.dataset_ambient_noise.measurement_data.leq_spectral_stats.LMax = h5read(filename,'/dataset_ambient_noise/measurement_data/leq_spectral_stats/LMax');
    GUI.bsh_spectral_stats_LMax = D.dataset_ambient_noise.measurement_data.leq_spectral_stats.LMax;
catch
    R(29) = 0;
    R_EM{29,1}='.../leq_spectral_stats/LMax';
    Index = find(contains(name,'LMax'));
    u = strfind(group(Index),'spectral');
    u = find(~cellfun(@isempty,u));
    Index = Index(u);
    if ~isempty(Index)
        R_EM{29,2}=['Dataset was found here: ' char(group(Index)) ', but should be located here: "/dataset_ambient_noise/measurement_data/leq_spectral_stats/" '];
        D.dataset_ambient_noise.measurement_data.leq_spectral_stats.LMax = h5read(filename,[char(group(Index)) '/' char(name(Index))]);
    else
        R_EM{29,2} = 'Dataset was not found.';
        D.dataset_ambient_noise.measurement_data.leq_spectral_stats.LMax = NaN;
    end
end 
%%
try D.dataset_ambient_noise.measurement_data.leq_spectral_stats.LMean = h5read(filename,'/dataset_ambient_noise/measurement_data/leq_spectral_stats/LMean');
    GUI.bsh_spectral_stats_LMean = D.dataset_ambient_noise.measurement_data.leq_spectral_stats.LMean;
catch
    R(30) = 0;
    R_EM{30,1}='.../leq_spectral_stats/LMean';
    Index = find(contains(name,'LMean'));
    u = strfind(group(Index),'spectral');
    u = find(~cellfun(@isempty,u));
    Index = Index(u);
    if ~isempty(Index)
        R_EM{30,2}=['Dataset was found here: ' char(group(Index)) ', but should be located here: "/dataset_ambient_noise/measurement_data/leq_spectral_stats/" '];
        D.dataset_ambient_noise.measurement_data.leq_spectral_stats.LMean = h5read(filename,[char(group(Index)) '/' char(name(Index))]);
    else
        R_EM{30,2} = 'Dataset was not found.';
        D.dataset_ambient_noise.measurement_data.leq_spectral_stats.LMean = NaN;
    end
end 
%%
try D.dataset_ambient_noise.measurement_data.leq_spectral_stats.LMin = h5read(filename,'/dataset_ambient_noise/measurement_data/leq_spectral_stats/LMin');
    GUI.bsh_spectral_stats_LMin = D.dataset_ambient_noise.measurement_data.leq_spectral_stats.LMin;
catch
    R(31) = 0;
    R_EM{31,1}='.../leq_spectral_stats/LMin';
    Index = find(contains(name,'LMin'));
    u = strfind(group(Index),'spectral');
    u = find(~cellfun(@isempty,u));
    Index = Index(u);
    if ~isempty(Index)
        R_EM{31,2}=['Dataset was found here: ' char(group(Index)) ', but should be located here: "/dataset_ambient_noise/measurement_data/leq_spectral_stats/" '];
        D.dataset_ambient_noise.measurement_data.leq_spectral_stats.LMin = h5read(filename,[char(group(Index)) '/' char(name(Index))]);
    else
        R_EM{31,2} = 'Dataset was not found.';
        D.dataset_ambient_noise.measurement_data.leq_spectral_stats.LMin = NaN;
    end
end 
%%
try D.dataset_ambient_noise.measurement_data.leq_spectro_temporal_values = h5read(filename,'/dataset_ambient_noise/measurement_data/leq_spectro_temporal_values');
    GUI.bsh_leq_spectro_temporal_values = D.dataset_ambient_noise.measurement_data.leq_spectro_temporal_values;
    GUI.Lamp_leq_spectro_temporal_values.Color = 'g';
catch
    R(32) = 0;
    R_EM{32,1}='.../leq_spectro_temporal_values';
    Index = find(contains(name,'leq_spectro_temporal_values'));
    if ~isempty(Index)
        R_EM{32,2}=['Dataset was found here: ' char(group(Index)) ', but should be located here: "/dataset_ambient_noise/measurement_data/" '];
        D.dataset_ambient_noise.measurement_data.leq_spectro_temporal_values = h5read(filename,[char(group(Index)) '/' char(name(Index))]);
    else
        R_EM{32,2} = 'Dataset was not found.';
        D.dataset_ambient_noise.measurement_data.leq_spectro_temporal_values = NaN;
    end
end 
%%
try D.dataset_ambient_noise.measurement_data.leq_temporal_stats.L01 = h5read(filename,'/dataset_ambient_noise/measurement_data/leq_temporal_stats/L01');
    GUI.bsh_temporal_stats_L01 = D.dataset_ambient_noise.measurement_data.leq_temporal_stats.L01;
catch
    R(33) = 0;
    R_EM{33,1}='.../leq_temporal_stats/L01';
    Index = find(contains(name,'L01'));
    u = strfind(group(Index),'temporal');
    u = find(~cellfun(@isempty,u));
    Index = Index(u);
    if ~isempty(Index)
        R_EM{33,2}=['Dataset was found here: ' char(group(Index)) ', but should be located here: "/dataset_ambient_noise/measurement_data/leq_temporal_stats/" '];
        D.dataset_ambient_noise.measurement_data.leq_temporal_stats.L01 = h5read(filename,[char(group(Index)) '/' char(name(Index))]);
    else
        R_EM{33,2} = 'Dataset was not found.';
        D.dataset_ambient_noise.measurement_data.leq_temporal_stats.L01 = NaN;
    end
end 
%%
try D.dataset_ambient_noise.measurement_data.leq_temporal_stats.L05 = h5read(filename,'/dataset_ambient_noise/measurement_data/leq_temporal_stats/L05');
    GUI.bsh_temporal_stats_L05 = D.dataset_ambient_noise.measurement_data.leq_temporal_stats.L05;
catch
    R(34) = 0;
    R_EM{34,1}='.../leq_temporal_stats/L05';
    Index = find(contains(name,'L05'));
    u = strfind(group(Index),'temporal');
    u = find(~cellfun(@isempty,u));
    Index = Index(u);
    if ~isempty(Index)
        R_EM{34,2}=['Dataset was found here: ' char(group(Index)) ', but should be located here: "/dataset_ambient_noise/measurement_data/leq_temporal_stats/" '];
        D.dataset_ambient_noise.measurement_data.leq_temporal_stats.L05 = h5read(filename,[char(group(Index)) '/' char(name(Index))]);
    else
        R_EM{34,2} = 'Dataset was not found.';
        D.dataset_ambient_noise.measurement_data.leq_temporal_stats.L05 = NaN;
    end
end 
%%
try D.dataset_ambient_noise.measurement_data.leq_temporal_stats.L50 = h5read(filename,'/dataset_ambient_noise/measurement_data/leq_temporal_stats/L50');
    GUI.bsh_temporal_stats_L50 = D.dataset_ambient_noise.measurement_data.leq_temporal_stats.L50;
catch
    R(35) = 0;
    R_EM{35,1}='.../leq_temporal_stats/L50';
    Index = find(contains(name,'L50'));
    u = strfind(group(Index),'temporal');
    u = find(~cellfun(@isempty,u));
    Index = Index(u);
    if ~isempty(Index)
        R_EM{35,2}=['Dataset was found here: ' char(group(Index)) ', but should be located here: "/dataset_ambient_noise/measurement_data/leq_temporal_stats/" '];
        D.dataset_ambient_noise.measurement_data.leq_temporal_stats.L50 = h5read(filename,[char(group(Index)) '/' char(name(Index))]);
    else
        R_EM{35,2} = 'Dataset was not found.';
        D.dataset_ambient_noise.measurement_data.leq_temporal_stats.L50 = NaN;
    end
end 
%%
try D.dataset_ambient_noise.measurement_data.leq_temporal_stats.L90 = h5read(filename,'/dataset_ambient_noise/measurement_data/leq_temporal_stats/L90');
    GUI.bsh_temporal_stats_L90 = D.dataset_ambient_noise.measurement_data.leq_temporal_stats.L90;
catch
    R(36) = 0;
    R_EM{36,1}='.../leq_temporal_stats/L90';
    Index = find(contains(name,'L90'));
    u = strfind(group(Index),'temporal');
    u = find(~cellfun(@isempty,u));
    Index = Index(u);
    if ~isempty(Index)
        R_EM{36,2}=['Dataset was found here: ' char(group(Index)) ', but should be located here: "/dataset_ambient_noise/measurement_data/leq_temporal_stats/" '];
        D.dataset_ambient_noise.measurement_data.leq_temporal_stats.L90 = h5read(filename,[char(group(Index)) '/' char(name(Index))]);
    else
        R_EM{36,2} = 'Dataset was not found.';
        D.dataset_ambient_noise.measurement_data.leq_temporal_stats.L90 = NaN;
    end
end 
%%
try D.dataset_ambient_noise.measurement_data.leq_temporal_stats.L99 = h5read(filename,'/dataset_ambient_noise/measurement_data/leq_temporal_stats/L99');
    GUI.bsh_temporal_stats_L99 = D.dataset_ambient_noise.measurement_data.leq_temporal_stats.L99;
catch
    R(37) = 0;
    R_EM{37,1}='.../leq_temporal_stats/L99';
    Index = find(contains(name,'L99'));
    u = strfind(group(Index),'temporal');
    u = find(~cellfun(@isempty,u));
    Index = Index(u);
    if ~isempty(Index)
        R_EM{37,2}=['Dataset was found here: ' char(group(Index)) ', but should be located here: "/dataset_ambient_noise/measurement_data/leq_temporal_stats/" '];
        D.dataset_ambient_noise.measurement_data.leq_temporal_stats.L99 = h5read(filename,[char(group(Index)) '/' char(name(Index))]);
    else
        R_EM{37,2} = 'Dataset was not found.';
        D.dataset_ambient_noise.measurement_data.leq_temporal_stats.L99 = NaN;
    end
end 
%%
try D.dataset_ambient_noise.measurement_data.leq_temporal_stats.LMax = h5read(filename,'/dataset_ambient_noise/measurement_data/leq_temporal_stats/LMax');
    GUI.bsh_temporal_stats_LMax = D.dataset_ambient_noise.measurement_data.leq_temporal_stats.LMax;
catch
    R(38) = 0;
    R_EM{38,1}='.../leq_temporal_stats/LMax';
    Index = find(contains(name,'LMax'));
    u = strfind(group(Index),'temporal');
    u = find(~cellfun(@isempty,u));
    Index = Index(u);
    if ~isempty(Index)
        R_EM{38,2}=['Dataset was found here: ' char(group(Index)) ', but should be located here: "/dataset_ambient_noise/measurement_data/leq_temporal_stats/" '];
        D.dataset_ambient_noise.measurement_data.leq_temporal_stats.LMax = h5read(filename,[char(group(Index)) '/' char(name(Index))]);
    else
        R_EM{38,2} = 'Dataset was not found.';
        D.dataset_ambient_noise.measurement_data.leq_temporal_stats.LMax = NaN;
    end
end 
%%
try D.dataset_ambient_noise.measurement_data.leq_temporal_stats.LMean = h5read(filename,'/dataset_ambient_noise/measurement_data/leq_temporal_stats/LMean');
    GUI.bsh_temporal_stats_LMean = D.dataset_ambient_noise.measurement_data.leq_temporal_stats.LMean;
catch
    R(39) = 0;
    R_EM{39,1}='.../leq_temporal_stats/LMean';
    Index = find(contains(name,'LMean'));
    u = strfind(group(Index),'temporal');
    u = find(~cellfun(@isempty,u));
    Index = Index(u);
    if ~isempty(Index)
        R_EM{39,2}=['Dataset was found here: ' char(group(Index)) ', but should be located here: "/dataset_ambient_noise/measurement_data/leq_temporal_stats/" '];
        D.dataset_ambient_noise.measurement_data.leq_temporal_stats.LMean = h5read(filename,[char(group(Index)) '/' char(name(Index))]);
    else
        R_EM{39,2} = 'Dataset was not found.';
        D.dataset_ambient_noise.measurement_data.leq_temporal_stats.LMean = NaN;
    end
end 
%%
try D.dataset_ambient_noise.measurement_data.leq_temporal_stats.LMin = h5read(filename,'/dataset_ambient_noise/measurement_data/leq_temporal_stats/LMin');
    GUI.bsh_temporal_stats_LMin = D.dataset_ambient_noise.measurement_data.leq_temporal_stats.LMin;
catch
    R(40) = 0;
    R_EM{40,1}='.../leq_temporal_stats/LMin';
    Index = find(contains(name,'LMin'));
    u = strfind(group(Index),'temporal');
    u = find(~cellfun(@isempty,u));
    Index = Index(u);
    if ~isempty(Index)
        R_EM{40,2}=['Dataset was found here: ' char(group(Index)) ', but should be located here: "/dataset_ambient_noise/measurement_data/leq_temporal_stats/" '];
        D.dataset_ambient_noise.measurement_data.leq_temporal_stats.LMin = h5read(filename,[char(group(Index)) '/' char(name(Index))]);
    else
        R_EM{40,2} = 'Dataset was not found.';
        D.dataset_ambient_noise.measurement_data.leq_temporal_stats.LMin = NaN;
    end
end 
%%
try D.dataset_ambient_noise.measurement_data.leq_temporal_values = h5read(filename,'/dataset_ambient_noise/measurement_data/leq_temporal_values');
    GUI.bsh_leq_temporal_values = D.dataset_ambient_noise.measurement_data.leq_temporal_values;
    GUI.Lamp_leq_temporal_values.Color = 'g';
catch
    R(41) = 0;
    R_EM{41,1}='.../leq_temporal_values';
    Index = find(contains(name,'leq_temporal_values'));
    if ~isempty(Index)
        R_EM{41,2}=['Dataset was found here: ' char(group(Index)) ', but should be located here: "/dataset_ambient_noise/measurement_data/" '];
        D.dataset_ambient_noise.measurement_data.leq_temporal_values = h5read(filename,[char(group(Index)) '/' char(name(Index))]);
    else
        R_EM{41,2} = 'Dataset was not found.';
        D.dataset_ambient_noise.measurement_data.leq_temporal_values = NaN;
    end
end 
%%
try D.dataset_ambient_noise.measurement_purpose = h5read(filename,'/dataset_ambient_noise/measurement_purpose');
    GUI.bsh_measurement_purpose = D.dataset_ambient_noise.measurement_purpose;
    GUI.Lamp_measurement_purpose.Color = 'g';
    GUI.measurementpurposeDropDown.Value = D.dataset_ambient_noise.measurement_purpose;
catch
    R(42) = 0;
    R_EM{42,1}='.../measurement_purpose';
    Index = find(contains(name,'measurement_purpose'));
    if ~isempty(Index)
        R_EM{42,2}=['Dataset was found here: ' char(group(Index)) ', but should be located here: "/dataset_ambient_noise/" '];
        D.dataset_ambient_noise.measurement_purpose = h5read(filename,[char(group(Index)) '/' char(name(Index))]);
    else
        R_EM{42,2} = 'Dataset was not found.';
        D.dataset_ambient_noise.measurement_purpose = [];
    end
end 
%%
try D.dataset_ambient_noise.measurement_setup.measurement_height = h5read(filename,'/dataset_ambient_noise/measurement_setup/measurement_height');
    GUI.bsh_measurement_height = D.dataset_ambient_noise.measurement_setup.measurement_height;
    GUI.Lamp_measurement_height.Color = 'g';
    GUI.measurementheightEditField.Value = D.dataset_ambient_noise.measurement_setup.measurement_height;
catch
    R(43) = 0;
    R_EM{43,1}='.../measurement_height';
    Index = find(contains(name,'measurement_height'));
    if ~isempty(Index)
        R_EM{43,2}=['Dataset was found here: ' char(group(Index)) ', but should be located here: "/dataset_ambient_noise/measurement_setup/" '];
        D.dataset_ambient_noise.measurement_setup.measurement_height = h5read(filename,[char(group(Index)) '/' char(name(Index))]);
    else
        R_EM{43,2} = 'Dataset was not found.';
        D.dataset_ambient_noise.measurement_setup.measurement_height = NaN;
    end
end 
%%
try D.dataset_ambient_noise.measurement_setup.measurement_setup = h5read(filename,'/dataset_ambient_noise/measurement_setup/measurement_setup');
    GUI.bsh_measurement_setup = D.dataset_ambient_noise.measurement_setup.measurement_setup;
    GUI.Lamp_measurement_setup.Color = 'g';
    GUI.measurementsetupDropDown.Value = D.dataset_ambient_noise.measurement_setup.measurement_setup;
catch
    R(44) = 0;
    R_EM{44,1}='.../measurement_setup';
    Index = find(contains(name,'measurement_setup'));
    if ~isempty(Index)
        R_EM{44,2}=['Dataset was found here: ' char(group(Index)) ', but should be located here: "/dataset_ambient_noise/measurement_setup/" '];
        D.dataset_ambient_noise.measurement_setup.measurement_setup = h5read(filename,[char(group(Index)) '/' char(name(Index))]);
    else
        R_EM{44,2} = 'Dataset was not found.';
        D.dataset_ambient_noise.measurement_setup.measurement_setup = [];
    end
end 
%%
try D.dataset_ambient_noise.name_measurement_position = h5read(filename,'/dataset_ambient_noise/name_measurement_position');
    GUI.bsh_name_measurement_position = D.dataset_ambient_noise.name_measurement_position;
    GUI.Lamp_name_measurement_position.Color = 'g';
    GUI.namemeasurementpositionEditField.Value = D.dataset_ambient_noise.name_measurement_position;
catch
   R(45) = 0;
    R_EM{45,1}='.../name_measurement_position';
    Index = find(contains(name,'name_measurement_position'));
    if ~isempty(Index)
        R_EM{45,2}=['Dataset was found here: ' char(group(Index)) ', but should be located here: "/dataset_ambient_noise/" '];
        D.dataset_ambient_noise.name_measurement_position = h5read(filename,[char(group(Index)) '/' char(name(Index))]);
    else
        R_EM{45,2} = 'Dataset was not found.';
        D.dataset_ambient_noise.name_measurement_position = [];
    end
end  
%%
try D.dataset_ambient_noise.recorder.recorder_manufacturer = h5read(filename,'/dataset_ambient_noise/recorder/recorder_manufacturer');
    GUI.bsh_recorder_manufacturer = D.dataset_ambient_noise.recorder.recorder_manufacturer;
    GUI.Lamp_recorder_manufacturer.Color = 'g';
    GUI.recordermanufacturerEditField.Value = D.dataset_ambient_noise.recorder.recorder_manufacturer;
catch
    R(46) = 0;
    R_EM{46,1}='.../recorder_manufacturer';
    Index = find(contains(name,'recorder_manufacturer'));
    if ~isempty(Index)
        R_EM{46,2}=['Dataset was found here: ' char(group(Index)) ', but should be located here: "/dataset_ambient_noise/recorder/" '];
        D.dataset_ambient_noise.recorder.recorder_manufacturer = h5read(filename,[char(group(Index)) '/' char(name(Index))]);
    else
        R_EM{46,2} = 'Dataset was not found.';
        D.dataset_ambient_noise.recorder.recorder_manufacturer = [];
    end
end  
%%
try D.dataset_ambient_noise.recorder.recorder_serial_number = h5read(filename,'/dataset_ambient_noise/recorder/recorder_serial_number');
    GUI.bsh_recorder_serialnumber = D.dataset_ambient_noise.recorder.recorder_serial_number;
    GUI.Lamp_recorder_serial_number.Color = 'g';
    GUI.recorderserialnumberEditField.Value = D.dataset_ambient_noise.recorder.recorder_serial_number;
catch
  R(47) = 0;
    R_EM{47,1}='.../recorder_serial_number';
    Index = find(contains(name,'recorder_serial_number'));
    if ~isempty(Index)
        R_EM{47,2}=['Dataset was found here: ' char(group(Index)) ', but should be located here: "/dataset_ambient_noise/recorder/" '];
        D.dataset_ambient_noise.recorder.recorder_serial_number = h5read(filename,[char(group(Index)) '/' char(name(Index))]);
    else
        R_EM{47,2} = 'Dataset was not found.';
        D.dataset_ambient_noise.recorder.recorder_serial_number = [];
    end
end  
%%
try D.dataset_ambient_noise.recorder.recorder_type = h5read(filename,'/dataset_ambient_noise/recorder/recorder_type');
    GUI.bsh_recorder_type = D.dataset_ambient_noise.recorder.recorder_type;
    GUI.Lamp_recorder_type.Color = 'g';
    GUI.recordertypeEditField.Value = D.dataset_ambient_noise.recorder.recorder_type;
catch
    R(48) = 0;
    R_EM{48,1}='.../recorder_type';
    Index = find(contains(name,'recorder_type'));
    if ~isempty(Index)
        R_EM{48,2}=['Dataset was found here: ' char(group(Index)) ', but should be located here: "/dataset_ambient_noise\recorder/" '];
        D.dataset_ambient_noise.recorder.recorder_type = h5read(filename,[char(group(Index)) '/' char(name(Index))]);
    else
        R_EM{48,2} = 'Dataset was not found.';
        D.dataset_ambient_noise.recorder.recorder_type = [];
    end
end  
%%
try D.date_of_creation = h5read(filename,'/date_of_creation');
    GUI.bsh_date_of_creation = D.date_of_creation;
    GUI.Lamp_date_of_creation.Color = 'g';
    GUI.dateofcreationDatePicker.Value = datetime(D.date_of_creation,'ConvertFrom','posixtime');
catch
    R(49) = 0;
    R_EM{49,1}='/date_of_creation';
    Index = find(contains(name,'date_of_creation'));
    if ~isempty(Index)
        R_EM{49,2}=['Dataset was found here: ' char(group(Index)) ', but should be located here: "/" '];
        D.date_of_creation = h5read(filename,[char(group(Index)) '/' char(name(Index))]);
    else
        R_EM{49,2} = 'Dataset was not found.';
        D.date_of_creation = NaN;
    end
end  
%%
try D.measurement_institution = h5read(filename,'/measuring_institution');
    GUI.bsh_measuring_institution = D.measurement_institution;
    GUI.Lamp_measuring_institution.Color = 'g';
    GUI.measuringinstitutionEditField.Value = D.measurement_institution;
catch
    R(50) = 0;
    R_EM{50,1}='/measuring_institution';
    Index = find(contains(name,'measuring_institution'));
    if ~isempty(Index)
        R_EM{50,2}=['Dataset was found here: ' char(group(Index)) ', but should be located here: "/" '];
        D.measurement_institution = h5read(filename,[char(group(Index)) '/' char(name(Index))]);
    else
        R_EM{50,2} = 'Dataset was not found.';
        D.measurement_institution = [];
    end
end  
%%
try D.point_of_contact = h5read(filename,'/point_of_contact');
    GUI.bsh_point_of_contact = D.point_of_contact;
    GUI.Lamp_point_of_contact.Color = 'g';
    GUI.pointofcontactEditField.Value = D.point_of_contact;
catch
    R(51) = 0;
    R_EM{51,1}='/point_of_contact';
    Index = find(contains(name,'point_of_contact'));
    if ~isempty(Index)
        R_EM{51,2}=['Dataset was found here: ' char(group(Index)) ', but should be located here: "/" '];
        D.point_of_contact = h5read(filename,[char(group(Index)) '/' char(name(Index))]);
    else
        R_EM{51,2} = 'Dataset was not found.';
        D.point_of_contact = [];
    end
end  
%%
try D.rawdata_samplingrate = h5read(filename,'/rawdata_samplingrate');
    GUI.bsh_rawdata_samplingrate = D.rawdata_samplingrate;
    GUI.Lamp_rawdata_samplingrate.Color = 'g';
    GUI.rawdatasamplingrateEditField.Value = double(D.rawdata_samplingrate);
catch
    R(52) = 0;
    R_EM{52,1}='/rawdata_samplingrate';
    Index = find(contains(name,'rawdata_samplingrate'));
    if ~isempty(Index)
        R_EM{52,2}=['Dataset was found here: ' char(group(Index)) ', but should be located here: "/" '];
        D.rawdata_samplingrate = h5read(filename,[char(group(Index)) '/' char(name(Index))]);
    else
        R_EM{52,2} = 'Dataset was not found.';;
        D.rawdata_samplingrate = NaN;
    end
end  
%%
try D.rawdata_uuid = h5read(filename,'/rawdata_uuid');
    GUI.bsh_rawdata_uuid = D.rawdata_uuid;
    GUI.Lamp_rawdata_uuid.Color = 'g';
    GUI.rawdatauuidEditField.Value = D.rawdata_uuid;
catch
    R(53) = 0;
    R_EM{53,1}='/rawdata_uuid';
    Index = find(contains(name,'rawdata_uuid'));
    if ~isempty(Index)
        R_EM{53,2}=['Dataset was found here: ' char(group(Index)) ', but should be located here: "/" '];
        D.rawdata_uuid = h5read(filename,[char(group(Index)) '/' char(name(Index))]);
    else
        R_EM{53,2} = 'Dataset was not found.';;
        D.rawdata_uuid = [];
    end
end  
end
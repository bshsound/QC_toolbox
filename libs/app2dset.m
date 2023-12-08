function dset = app2dset(app)
    

    dset = struct(...
        'author', app.bsh_author, ...
        'date_of_creation', app.bsh_date_of_creation, ...
        'measuring_institution', app.bsh_measuring_institution, ...
        'point_of_contact', app.bsh_point_of_contact, ...
        'rawdata_samplingrate', app.bsh_rawdata_samplingrate, ...
        'rawdata_uuid', app.bsh_rawdata_uuid, ...
        'dataset_ambient_noise', struct( ...
            'calibration', struct( ...
                'calibration_date', app.bsh_calibration_date, ...
                'calibration_factor', app.bsh_calibration_factor, ...
                'calibration_factor_unit', app.bsh_calibration_factor_unit, ...
                'calibration_level', app.bsh_calibration_level, ...
                'calibration_procedure', app.bsh_calibration_procedure, ...
                'reference_frequencies_levels', app.bsh_reference_frequencies_levels), ...
            'comments', app.bsh_comments, ...
            'coordinates_measurement_position', app.bsh_coordinatesmeasurementposition, ...
            'coordinates_reference', app.bsh_coordinatesreference, ...
            'dataset_type', app.bsh_datasettype, ...
            'dataset_version', app.bsh_datasetversion, ...
            'hydrophone', struct( ...
                'hydrophone_manufacturer', app.bsh_hydrophone_manufacturer, ...
                'hydrophone_sensitivity', app.bsh_hydrophone_sensitivity, ...
                'hydrophone_sensitivity_unit', app.bsh_hydrophone_sensitivity_unit, ...
                'hydrophone_serial_number', app.bsh_hydrophone_serial_number, ...
                'hydrophone_type', app.bsh_hydrophone_type), ...
            'measurement_data', struct( ...
                'duty_cycle', app.bsh_duty_cycle, ...
                'frequency_count', app.bsh_frequency_count, ...
                'frequency_index', app.bsh_frequency_index, ...
                'leq_averaging_time', app.bsh_leq_averaging_time, ...
                'leq_count', app.bsh_leq_count, ...
                'leq_datetime_index', app.bsh_datetime_index, ...
                'leq_spectral_stats', struct( ...
                    'L01', app.bsh_spectral_stats_L01, ...
                    'L05', app.bsh_spectral_stats_L05, ...
                    'L50', app.bsh_spectral_stats_L50, ...
                    'L90', app.bsh_spectral_stats_L90, ...
                    'L99', app.bsh_spectral_stats_L99, ...
                    'LMax', app.bsh_spectral_stats_LMax, ...
                    'LMean', app.bsh_spectral_stats_LMean, ...
                    'LMin', app.bsh_spectral_stats_LMin), ...
                'leq_spectro_temporal_values', app.bsh_leq_spectro_temporal_values, ...
                'leq_temporal_stats', struct( ...
                    'L01', app.bsh_temporal_stats_L01, ...
                    'L05', app.bsh_temporal_stats_L05, ...
                    'L50', app.bsh_temporal_stats_L50, ...
                    'L90', app.bsh_temporal_stats_L90, ...
                    'L99', app.bsh_temporal_stats_L99, ...
                    'LMax', app.bsh_temporal_stats_LMax, ...
                    'LMean', app.bsh_temporal_stats_LMean, ...
                    'LMin', app.bsh_temporal_stats_LMin), ...
                'leq_temporal_values', app.bsh_leq_temporal_values), ...
            'measurement_purpose', app.bsh_measurement_purpose, ...  
            'measurement_setup', struct( ...
                'measurement_height', app.bsh_measurement_height, ...
                'measurement_setup', app.bsh_measurement_setup), ...
            'name_measurement_position', app.bsh_name_measurement_position, ...
            'recorder', struct( ...
                'recorder_manufacturer', app.bsh_recorder_manufacturer, ...
                'recorder_serial_number', app.bsh_recorder_serialnumber, ...
                'recorder_type', app.bsh_recorder_type)));
end
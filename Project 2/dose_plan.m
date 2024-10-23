function[tumour_dose,total_dose] = dose_plan(patient_data)
rowcol=rowcol_pairs(patient_data);
for i= 1:length(patient_data)
    beams{i}=radiation_beam(rowcol(i).rows,rowcol(i).cols,5.0000e-09,patient_data{i});
end
for i= 1:length(beams)
    total_dose(i)=sum(sum(beams{i}))*1000; 
end
 % Initialize arrays for total dose and tumor dose
    num_files = length(patient_data);
    total_dose = zeros(1, num_files);
    tumor_dose = zeros(1, num_files);
    % Define the threshold value for identifying tumor pixels
    threshold = 250;
    % Loop through each MRI image in patient_data
    for i = 1:num_files
        % Get the current image
        mri_image = patient_data{i};
        % Get the tumor coordinates
        coords_struct = rowcol_pairs({mri_image});
        rows = coords_struct.rows;
        cols = coords_struct.cols;
        % Generate radiation beam intensity pattern
        rad_map = radiation_beam(rows, cols, 0.5e-8, mri_image);
        % Calculate the total dose (sum of all intensity values in rad_map)
        total_dose(i) = sum(rad_map(:));
        % Identify tumor pixel positions using the threshold value
        tumor_mask = mri_image > threshold;
        % Calculate the tumor dose (sum of intensity values in rad_map where tumor_mask is true)
        tumor_dose(i) = sum(rad_map(tumor_mask));
    end 
    % Convert doses to mGy
    total_dose = total_dose * 1e3;
    tumor_dose = tumor_dose * 1e3;
end 
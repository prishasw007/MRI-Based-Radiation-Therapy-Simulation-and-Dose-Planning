function [rad_map] = radiation_beam(rows,cols,intensity,mri_image)
    [num_rows, num_cols] = size(mri_image);
    rad_map = zeros(num_rows, num_cols);
    for i = 1:length(rows)
        rad_map(rows(i),:) = rad_map(rows(i),:)+intensity;
        rad_map(:,cols(i)) = rad_map(:,cols(i))+intensity;
    end 
end
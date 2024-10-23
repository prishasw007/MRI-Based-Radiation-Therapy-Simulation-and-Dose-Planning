function [tumor_coords] = rowcol_pairs(test_object)
test_object{1} = imread('test_object.tif');
tumor_coords = struct('rows',{},'cols',{});
for i = 1:length(test_object)
    img = test_object{i};
    threshold = img>250;
    [rows,cols] = find(threshold);
    tumor_coords(i).rows = rows;
    tumor_coords(i).cols = cols;
end


function [patient_data,num_files] = load_patient_data()
    patient_data ={};
    num =1;    
    filename = "patient" + num2str(num,"%.3d") + "mri.tif";
    while isfile(filename)
        patient_data(num)= {imread(filename)}
        num = num+1;
        filename = "patient" + num2str(num,"%.3d") + "mri.tif";
    end 
    num_files = num -1
end


    
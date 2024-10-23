# MRI-Based-Radiation-Therapy-Simulation-and-Dose-Planning
# Overview
### In the US alone, there are approximately 1.7 million new cancer patients each year. Radiation therapy employs ionizing radiation to target and kill cancerous tumors by causing DNA damage. This project simulates External Beam Radiation Therapy, which uses photon or electron beams delivered from multiple angles to create a concentrated dose on tumors while minimizing damage to healthy tissues. The project includes processing MRI scans, identifying tumor locations, generating radiation beam patterns, and calculating the radiation dose for both the tumor and the total body. MATLAB will be used to develop and test the required functions. Several mri scans were provided for testing code. 

# Functions
## 1. load_patient_data
### Objective: Load a series of MRI scans stored in .tif format and output the image data in a cell array patient_data, along with the total number of files num_files.
### Input/Output: Images are sequentially read from the working directory and stored in the array.

## 2. rowcol_pairs
### Objective: Identify tumor locations in the MRI images using a threshold filter (value > 250) and generate pairs of row and column positions where the tumor is located.
### Output: Returns tumor_coords, an array of structs containing row-column pairs indicating tumor pixel locations.

## 3. radiation_beam
### Objective: Using the tumor's pixel positions, generate a crossed radiation beam intensity pattern, mapping the radiation dose delivered to each pixel in the image.
### Output: rad_map, a radiation dose intensity map.

## 4. dose_plan
### Objective: Calculate the total radiation dose and the dose deposited in the tumor using the radiation_beam function and sum the intensities in both the entire image and within the tumor region.
### Output: Returns tumor_dose and total_dose in milliGray.

# Testing
### Each task can be individually tested with provided test objects (e.g., test_object.tif) to verify correctness of functions before integrating.
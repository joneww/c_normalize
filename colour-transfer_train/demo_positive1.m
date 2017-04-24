clc;
clear;
fprintf('  ... load images\n');
%read target image
I1 = double(imread('target.jpg'))/255;
HSD_I1 = rgb2hsd(I1*255);

%find orig imge folder and read orig image
input_fileFolder = '/home/zhuzj/dataset/camelyon16_B2/raw_data/positive';
output_fileFolder = '/home/zhuzj/dataset/camelyon16_B2/input_HSD/train_data/positive';
num_base = 100000;
num_end = 207671;
% input_fileFolder = './test';
% output_fileFolder = './test_save';

input_files = dir(fullfile(input_fileFolder,'*.jpg'));
fprintf('  ... start Transfer \n');
for file_num = num_base:num_end;
    I0_name = fullfile(input_fileFolder,input_files(file_num).name);
    I0 = double(imread(I0_name))/255;
    if mod(file_num,500) == 0
        fprintf('  ... cnt : %d\n',file_num);  
    end 
    HSD_I0 = rgb2hsd(I0*255);
    %fprintf('  ... MKL Colour Transfer %s\n',I0_name);
    
     out_mkl_HSD = colour_transfer_MKL(HSD_I0,HSD_I1);
     mean_out_mkl_HSD = out_mkl_HSD*3/4 + HSD_I0/4;	
     out_mkl_RGB = hsd2rgb(mean_out_mkl_HSD)/255;
     out_mkl_name = fullfile(output_fileFolder,input_files(file_num).name); 

    imwrite(out_mkl_RGB, out_mkl_name);
    
end


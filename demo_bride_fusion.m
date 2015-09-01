clear all 
close all
clc

addpath('MVsearch');
addpath('exposure fusion');

workingDir = 's1';

if(~exist([workingDir '/result_fusion'],'dir'))
        mkdir([workingDir '/result_fusion']);
end


for i=1:50
    %disp('pic num');
    %disp(i);
    tic
    dir=sprintf([workingDir '/%d'],i);
    I = load_images(dir);
    R1 = exposure_fusion(I,[1 1 1]);
    out=sprintf([workingDir '/result_fusion/%d.jpg'],i);
    disp(out);
    imwrite(R1,out); 
    toc
end





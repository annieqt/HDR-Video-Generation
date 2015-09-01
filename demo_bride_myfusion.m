clear all 
close all
clc


addpath('MVsearch');
addpath('exposure fusion');

workingDir = 'bride_imgs';

if(~exist([workingDir '/result_myfusion'],'dir'))
        mkdir([workingDir '/result_myfusion']);
end

for i=162:163
    %disp('pic num');
    disp(i);
    tic
    w=mydetection_bride(i);
    toc
    dir=sprintf([workingDir '/%d'],i);
    I = load_images(dir);
    tic
    R1 = myfusion_bride(I,[1 1 1],w);
    toc
    out=sprintf([workingDir '/result_myfusion/%d.jpg'],i);
    imwrite(R1,out);
 
end





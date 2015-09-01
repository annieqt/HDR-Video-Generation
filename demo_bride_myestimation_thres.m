clc
clear all

addpath('MVsearch');
addpath('exposure fusion');

workingDir = 'bride_imgs';
outputDir = 'bride_imgs/erode';

if(~exist(outputDir,'dir'))
        mkdir(outputDir);
end

for i=75:163
    disp(i);
    
    tic
    [w1,w2]=myestimation_bride(i);
    toc    
    w(:,:,1)=w1;
    w(:,:,2)=w2;

    dir=sprintf([workingDir '/%d'],i);
    I = load_images(dir);
    R1 = myfusion_estimation(I,[1 1 1],w);
%     R2 = exposure_fusion(I,[1 1 1]);

%     figure;
%     subplot(221);
%     imshow(R1);
%     subplot(222);
%     imshow(R2);
 
    out=sprintf([outputDir '/%d.jpg'],i);
    imwrite(R1,out);
 
end



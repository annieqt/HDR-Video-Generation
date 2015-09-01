clear all 
close all
clc

addpath('MVsearch');
addpath('exposure fusion');

workingDir = 'bride_imgs';
outputDir = 'imgs_compensated_high';


opts.BlockSize   = 4;
opts.SearchLimit = 10;

if(~exist([workingDir '/result_fusion'],'dir'))
        mkdir([workingDir '/result_fusion']);
end

if(~exist(outputDir,'dir'))
        mkdir(outputDir);
end

for i=150:151
    file1=sprintf([workingDir '/%d/%d.jpg'],i,1);
    disp(file1);
    file2=sprintf([workingDir '/%d/%d.jpg'],i,0);
    disp(file2);
    file3=sprintf([workingDir '/%d/%d.jpg'],i+1,1);
    disp(file3);
    
    img0 = im2double(imread(file1));
    img2 = im2double(imread(file3));

    tic
    [MVx, MVy] = Bidirectional_ME(img0, img2, opts);%from img2 to img0
    toc
    
    %save mv filed
%     figure(1);
%     quiver(MVx(end:-1:1,:), MVy(end:-1:1,:));
%     saveas(1,'interproduct/MV.jpg');
%     
    %myestimation1 myestimation3
    MVx=MVx.*(1/2);
    MVy=MVy.*(1/2);
    
    
%     figure(2);
%     quiver(MVx(end:-1:1,:), MVy(end:-1:1,:));
%     saveas(2,'interproduct/1-2MV.jpg');
    
    tic
    imgMC = reconstruct(img2, MVx, MVy, 0.5);  %img1
    toc    
    imwrite(imgMC,'interproduct/compensated0.jpg'); 
    
    
    
    
    target1 = sprintf([outputDir '/%d.jpg'],i*2-1);
    target2 = sprintf([outputDir '/%d.jpg'],i*2);
    
    imwrite(imgMC,target2); 
    copyfile(file2,target1);
    
end





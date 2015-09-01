clear all 
close all
clc

addpath('MVsearch');
addpath('exposure fusion');

workingDir = 'imgs_compensated_high';

for i=1:162
    imgDir = sprintf([workingDir '/%d/0.jpg'],i);
    img = im2double(imread(imgDir));
    img=imcrop(img,[0,0,1920,1086]);
    target=sprintf([workingDir '/%d/0.jpg'],i);;
    imwrite(img,target); 
end
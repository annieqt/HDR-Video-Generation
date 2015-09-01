clear all 
close all
clc


addpath('MVsearch');
addpath('exposure fusion');

if(~exist('imgs/result1','dir'))
        mkdir('imgs/result1');
end


for i=65:95
    %disp('pic num');
    %disp(i);
    tic
    w=mydetection3(i);
    toc
    dir=sprintf('street/%d',i);
    I = load_images(dir);
    tic
    R1 = myfusion(I,[1 1 1],w);
    toc
    out=sprintf('imgs/result1/%d.jpg',i);
    imwrite(R1,out);
 
end





clear all 
close all
clc

workingDir = 'imgs_compensated_high';
for i =1:162
    dir=sprintf([workingDir '/%d'],i);
    if(~exist([workingDir ,'dir']))
        mkdir(dir);
    end
    
    file1 = sprintf([workingDir '/%d.jpg'],i*2-1);
    file2 = sprintf([workingDir '/%d.jpg'],i*2);
    disp(file1);
    disp(file2);
    target1 = sprintf([workingDir '/%d/0.jpg'],i);
    target2 = sprintf([workingDir '/%d/1.jpg'],i);
    
    copyfile(file1,target1);
    copyfile(file2,target2)


end




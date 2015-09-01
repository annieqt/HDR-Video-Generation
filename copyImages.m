clc
clear


for i=1:96
    disp(i);
    file1=sprintf('street/%d/1.jpg',i);
    file2=sprintf('street/%d/2.jpg',i);
    file3=sprintf('street/%d/3.jpg',i);
    file4=sprintf('street/%d/4.jpg',i);
    
    target1=sprintf('street_copies/%d.jpg',4*i-3);
    target2=sprintf('street_copies/%d.jpg',4*i-2);
    target3=sprintf('street_copies/%d.jpg',4*i-1);
    target4=sprintf('street_copies/%d.jpg',4*i);
    
    copyfile(file1,target1);
    copyfile(file2,target2);
    copyfile(file3,target3);
    copyfile(file4,target4);
end
function [w1,w2]=myestimation_bride_test(i)
disp(['myestimation_bride i: ' i]);
workingDir = 'bride_imgs';
opts.BlockSize   = 4;
opts.SearchLimit = 10;

file=sprintf([workingDir '/%d/%d.jpg'],i,1);
img = im2double(rgb2gray(imread(file)));
[m,n,c]=size(img);
w=zeros(m,n,2);

file1=sprintf([workingDir '/%d/%d.jpg'],i,j);
file2=sprintf([workingDir '/%d/%d.jpg'],i,j+1);
file3=sprintf([workingDir '/%d/%d.jpg'],i+1,j);
img0 = im2double(rgb2gray(imread(file1)));
img1 = im2double(rgb2gray(imread(file2)));
img2 = im2double(rgb2gray(imread(file3)));

tic
[MVx, MVy] = Bidirectional_ME(img0, img2, opts);
toc

 
 
MVx=MVx.*(-1/2);
MVy=MVy.*(-1/2);


w2 = myReconstruct(img1, MVx, MVy);
w1=ones(m,n);

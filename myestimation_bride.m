function [w1,w2]=myestimation_bride(i)
disp(['myestimation_bride i: ' i]);
workingDir = 'bride_imgs';
opts.BlockSize   = 4;
opts.SearchLimit = 10;

file=sprintf([workingDir '/%d/%d.jpg'],i,1);
img = im2double(rgb2gray(imread(file)));
[m,n,c]=size(img);

file1=sprintf([workingDir '/%d/%d.jpg'],i,0);
disp(file1);
file2=sprintf([workingDir '/%d/%d.jpg'],i,1);
disp(file2);
file3=sprintf([workingDir '/%d/%d.jpg'],i+1,0);
disp(file3);
img0 = im2double(rgb2gray(imread(file1)));
img1 = im2double(rgb2gray(imread(file2)));
img2 = im2double(rgb2gray(imread(file3)));

tic
[MVx, MVy] = Bidirectional_ME(img0, img2, opts);%from img2 to img0
toc
% myestimation1 myestimation2
% MVx=MVx.*(-1/2);
% MVy=MVy.*(-1/2);

%myestimation1 myestimation3
MVx=MVx.*(1/2);
MVy=MVy.*(1/2);

%reconstruct should use reference frame (2nd); but myReconstruction need
%the first frame, so reverting is needed
w2 = myReconstruct(img1, MVx, MVy);
w1=ones(m,n);






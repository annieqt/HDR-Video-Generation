function [w1,w2,w3]=myestimation()


opts.BlockSize   = 4;
opts.SearchLimit = 10;
for i=1:3:3
file0=sprintf('imgs/%d.jpg',i);
file1=sprintf('imgs/%d.jpg',i+1);
file2=sprintf('imgs/%d.jpg',i+2);
file3=sprintf('imgs/%d.jpg',i+3);
img0 = im2double(imread(file0));
img1 = im2double(imread(file1));
img2 = im2double(imread(file2));
img3 = im2double(imread(file3));

disp(i);

tic
[MVx, MVy] = Bidirectional_ME(img0, img3, opts);
toc

MVx=MVx.*(-1/3);
MVy=MVy.*(-1/3);

% figure(1);
% quiver(MVx(end:-1:1,:), MVy(end:-1:1,:));
% title('Motion Vector Field');

w2 = myReconstruct(img1, MVx, MVy);


%ԭMV*1/3
MVx=MVx.*(2);
MVy=MVy.*(2);

w3= myReconstruct(img2, MVx, MVy);
[m,n,c]=size(img0);
w1=ones(m,n);
end
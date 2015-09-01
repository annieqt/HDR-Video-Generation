clc
clear all

addpath('MVsearch');
addpath('exposure fusion');
% tic
% myalignment(3);
% toc


tic
[w1,w2,w3]=myestimation;
toc
w(:,:,1)=w1;
w(:,:,2)=w2;
w(:,:,3)=w3;
%  tic
%  figure;
% subplot(221);
% imshow(w(:,:,1))
% subplot(222);
% imshow(w(:,:,2));
%  subplot(223);
% imshow(w(:,:,3));
% toc





se = strel('square',12);
A=imdilate(~w(:,:,2),se);
 [L,num]=bwlabel(A);
           maxarea = 0;
           maxindex =0;
           for i = 1:num
               temp = length( find(L==i) );
               if (temp > maxarea)
                   maxarea = temp;
                   maxindex = i;
               end
           end
  bw1 = (L == maxindex);
w(:,:,2)=~bw1;

A=imdilate(~w(:,:,3),se);
% figure;
% imshow(A);
 [L,num]=bwlabel(A);
           maxarea = 0;
           maxindex =0;
           for i = 1:num
               temp = length( find(L==i) );
               if (temp > maxarea)
                   maxarea = temp;
                   maxindex = i;
               end
           end
  bw1 = (L == maxindex);
w(:,:,3)=~bw1;
% figure;
% imshow(w(:,:,2));
% figure;
% imshow(w(:,:,3));
dir=sprintf('street/%d',0);
I = load_images('origin_imgs/0');
    R1 = myfusion(I,[1 1 1],w);
    R2 = exposure_fusion(I,[1 1 1]);
%      out=sprintf('imgs/mymethod.jpg');
%      imwrite(R1,out);
figure;
subplot(221);
imshow(R1);
subplot(222);
imshow(R2);

toc
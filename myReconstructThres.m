function w = myReconstruct(img1, MVx, MVy)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Integer pixel motion compensation
%
% g = reconstruct(img0, MVx, MVy, pel)
% constructs a motion compensated frame of img0 according to the motion
% vectors specified by MVx and MVy
%
% 
% Stanley Chan
% 29 Apr, 2010
% 10 Feb, 2011
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
img = imresize(img1, 1, 'bilinear');
pel=1;
BlockSize  = floor(size(img,1)/size(MVx,1));
[m n C]    = size(img);
M          = floor(m/BlockSize)*BlockSize;
N          = floor(n/BlockSize)*BlockSize;
w          = ones(m, n);

MVxmap = imresize(MVx, BlockSize);
MVymap = imresize(MVy, BlockSize);

Dx = round(MVxmap*(1/pel));
Dy = round(MVymap*(1/pel));

[xgrid ygrid] = meshgrid(1:N, 1:M);

X = min(max(xgrid+Dx, 1), M);
%原来的这里是不是写错了，应该是M吧？
Y = min(max(ygrid+Dy, 1), N);

%这里可以用一个概率系数
for i=1:M
    for j=1:N        
if(abs(Dx(i,j))<3&&abs(Dy(i,j))<3)
    w(i,j)=1;    
else
    w(i,j)=0;
    w(X(i,j),Y(i,j))=0;
end;
    end
end

se = strel('square',12);
A=imdilate(~w(:,:,2),se);
A=imerode(~w(:,:,2),se);    
[L,num]=bwlabel(A);
       maxarea = 0;
       maxindex =0;
       for k = 1:num
           temp = length( find(L==k) );
           if (temp > maxarea)
               maxarea = temp;
               maxindex = k;
           end
       end
bw1 = (L == maxindex);
w(:,:,2)=~bw1;


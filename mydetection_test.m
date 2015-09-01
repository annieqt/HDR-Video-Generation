function w=mydetection(i)
const=3;

for j=1:3
file0=sprintf('cup/%d/%d.jpg',i,j);
file1=sprintf('cup/%d/%d.jpg',i+1,j);
img0 = im2double(imread(file0));
% img1 = im2double(imread(file1));
% img2 = im2double(imread(file2));
img3 = im2double(imread(file1));
[m,n,c]=size(img0);
diff=abs(img3-img0);

%this is a threshold....
thre=const*sum(sum(sum(diff)))/(m*n*1.0);
disp(thre);
diff=im2bw(diff,thre);
%figure(j);
%imshow(diff);

se = strel('square',12);
A=imdilate(diff,se);%ÅòÕÍ²Ù×÷

[L,num]=bwlabel(A);
disp(num);
 bw=zeros(m,n);
  if (num>0)               
      for k = 1:num
         temp = length( find(L==k) );
         if (temp > 10)

                   bw=bw|(L==k);
         end
      end
%      bw3 = (L == maxindex);
 else
     bw=bw|zeros(m,n);
  end

end
  
w(:,:,1)=~bw;
w(:,:,2)=~bw;
w(:,:,3)=~bw;
w(:,:,4)=ones(m,n);
end

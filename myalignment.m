function I=myalignment(num)
%resize the imgs first
%remove global motion with Alignment algorithm of Ward.

%input the number of imgs 

if(~exist('imgs','dir'))
    mkdir imgs;

end
    in=sprintf('origin_imgs/IMG_05%d.JPG',68);
    a=imread(in);
    a=imresize(a,1/6);
    [M,N,C]=size(a);
    I=zeros(M,N,C,num);
    I(:,:,:,1)=a(:,:,:);
for i=2:num
    in=sprintf('origin_imgs/IMG_05%d.JPG',i+67);
    a=imread(in);
    a=imresize(a,1/6);
    I(:,:,:,i)=a(:,:,:);
end

for i=1:num
    out=sprintf('origin_imgs/%d',floor((i-1)/3));
    if(~exist(out,'dir'))
        mkdir(out);
    end
    out=sprintf('origin_imgs/%d/%d.jpg',floor((i-1)/3),i);
    imwrite(uint8(I(:,:,:,i)),out);
end

        
%注意校准次序  
for i=1:(num-1)/3        
[alignment,stack]=WardAlignment(I(:,:,:,3*i-2:3*i+1), 1, 'origin_imgs', 'jpg', 2);
I(:,:,:,3*i+1)=stack(:,:,:,4);
for j=1:4
    outfile=sprintf('imgs/%d.jpg',3*i+j-3);
    imwrite(uint8(stack(:,:,:,j)),outfile);
end
end

%     [alignment,stack]=WardAlignment(I(:,:,:,num-2:num), 1, 'origin_imgs', 'jpg', 3);
%      outfile=sprintf('imgs/%d.jpg',num-1);
%      imwrite(uint8(stack(:,:,:,2)),outfile);
%       outfile=sprintf('imgs/%d.jpg',num);
%      imwrite(uint8(stack(:,:,:,3)),outfile);


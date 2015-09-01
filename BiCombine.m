%%combine:
img1=imread('imgs/1/2E1.jpg');
img2=imread('imgs/1/2E2.jpg');
        
[M,N,C]=size(img1);
%     I=zeros(M,N,C,2);
%     I(:,:,:,1)=img1;
%     I(:,:,:,2)=img2;
% 
%     [alignment,stack]=WardAlignment(I, 1, 'imgs/1', 'jpg', 2);
%     img1=stack(:,:,:,1);
%     img2=stack(:,:,:,2);
    
%     figure;
%     subplot(221)
% imshow(uint8(img1+img2)/2);
% subplot(222)
% imshow(uint8(img1));
% subplot(223)
% imshow(uint8(img2));

w=ones(M,N,C);
img3=rgb2gray(img1-img2);
for i=1:M
    for j=1:N
        if(img3(i,j)>10)
            w(i,j,1)=0;
            w(i,j,2)=0;
            w(i,j,3)=0;
        end
    end
end
imwrite(img2,'imgs/1/test2/2E.jpg');
%%
img1=imread('imgs/1/0E1.jpg');
img2=imread('imgs/1/0E2.jpg');
 w=ones(M,N,C);
img3=rgb2gray(img1-img2);
for i=1:M
    for j=1:N
        if(img3(i,j)>10)
            w(i,j,1)=0;
            w(i,j,2)=0;
            w(i,j,3)=0;
        end
    end
end
imwrite(img2,'imgs/1/test2/0E.jpg');
       




 I = load_images('imgs/1/test2');
 R1 = myfusion(I,[1 1 1],w);
 
figure;
imshow(R1);
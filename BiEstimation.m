function BiEstimation()


opts.BlockSize   = 8;
opts.SearchLimit = 10;
for i=1:3:8
file0=sprintf('imgs/%d.jpg',i);
file1=sprintf('imgs/%d.jpg',i+1);
file2=sprintf('imgs/%d.jpg',i+2);
file3=sprintf('imgs/%d.jpg',i+3);
img0 = im2double(imread(file0));
img1 = im2double(imread(file1));
img2 = im2double(imread(file2));
img3 = im2double(imread(file3));


tic
[MVx0, MVy0] = Bidirectional_ME(img0, img3, opts);
toc
MVx=MVx0.*(-1/3);
MVy=MVy0.*(-1/3);
tic
imgMC1 = reconstruct(img1, MVx, MVy, 0.5);
toc
    outdir1=sprintf('imgs/%d',(i-1)/3);
    if(~exist(outdir1,'dir'))
    mkdir(outdir1);
    end
    
    outfile1=sprintf('imgs/%d/0E1.jpg',(i-1)/3);
    imwrite(imgMC1,outfile1);
    
%ԭMV*1/3
MVx=MVx0.*(-2/3);
MVy=MVy0.*(-2/3);
% dlmwrite('MVx.txt',MVx);
% dlmwrite('MVy.txt',MVy);
tic
imgMC2 = reconstruct(img2, MVx, MVy, 0.5);
toc
    outfile2=sprintf('imgs/%d/2E1.jpg',(i-1)/3);
    imwrite(imgMC2,outfile2);
[M,N,C]=size(imgMC1);
imgchange=img0(1:M,1:N,:);
    outfile3=sprintf('imgs/%d/1E.jpg',(i-1)/3);
    imwrite(imgchange,outfile3);
%%oppsite 
    
MVx=MVx0.*(1/3);
MVy=MVy0.*(1/3);
tic
imgMC3 = reconstruct(img1, MVx, MVy, 0.5);
toc


    outdir1=sprintf('imgs/%d',(i-1)/3+1);
    if(~exist(outdir1,'dir'))
    mkdir(outdir1);
    end
    
    outfile1=sprintf('imgs/%d/0E2.jpg',(i-1)/3+1);
    imwrite(imgMC3,outfile1);
    
%ԭMV*1/3
MVx=MVx0.*(2/3);
MVy=MVy0.*(2/3);
% dlmwrite('MVx.txt',MVx);
% dlmwrite('MVy.txt',MVy);
tic
imgMC4 = reconstruct(img2, MVx, MVy, 0.5);
toc
    outfile2=sprintf('imgs/%d/2E2.jpg',(i-1)/3+1);
    imwrite(imgMC4,outfile2);
    
%     I=zeros(M,N,C,2);
%     I(:,:,:,1)=imgMC1;
%     I(:,:,:,2)=imgMC3;
%     outdir1=sprintf('imgs/%d',(i-1)/3);
%     [alignment,stack]=WardAlignment(I, 1, outdir1, 'jpg', 2);
%     outfile1=sprintf('imgs/%d/0E1.jpg',(i-1)/3);
%     imwrite(stack(:,:,:,1),outfile1);
%     outfile1=sprintf('imgs/%d/0E2.jpg',(i-1)/3+1);
%     imwrite(stack(:,:,:,2),outfile1);
%     I(:,:,:,1)=imgMC2;
%     I(:,:,:,2)=imgMC4;
%     [alignment,stack]=WardAlignment(I, 1, outdir1, 'jpg', 2);
%     outfile1=sprintf('imgs/%d/2E1.jpg',(i-1)/3);
%     imwrite(stack(:,:,:,1),outfile1);
%     outfile1=sprintf('imgs/%d/2E2.jpg',(i-1)/3+1);
%     imwrite(stack(:,:,:,2),outfile1);
    
    
end



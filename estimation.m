function estimation()


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
[MVx, MVy] = Bidirectional_ME(img0, img3, opts);
toc

MVx=MVx.*(-1/3);
MVy=MVy.*(-1/3);
figure(1);
quiver(MVx(end:-1:1,:), MVy(end:-1:1,:));
title('Motion Vector Field');
tic
imgMC = reconstruct(img1, MVx, MVy, 0.5);
toc


    outdir1=sprintf('imgs/%d',(i-1)/3);
    if(~exist(outdir1,'dir'))
    mkdir(outdir1);
    end
    
    outfile1=sprintf('imgs/%d/0E.jpg',(i-1)/3);
    imwrite(imgMC,outfile1);
    
%ԭMV*1/3
MVx=MVx.*(2);
MVy=MVy.*(2);
% dlmwrite('MVx.txt',MVx);
% dlmwrite('MVy.txt',MVy);
tic
imgMC = reconstruct(img2, MVx, MVy, 0.5);
toc
    outfile2=sprintf('imgs/%d/2E.jpg',(i-1)/3);
    imwrite(imgMC,outfile2);
[M,N,C]=size(imgMC);
imgchange=img0(1:M,1:N,:);
    outfile3=sprintf('imgs/%d/1E.jpg',(i-1)/3);
    imwrite(imgchange,outfile3);
end
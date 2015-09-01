for i=0:3:299
    file0=sprintf('tmp/%d.jpg',i);
    file1=sprintf('imgs/small/%d.jpg',i+1);
    file2=sprintf('imgs/small/%d.jpg',i+2);
    img0=imread(file0);
    img1=imread(file1);
    img2=imread(file2);
    dir=sprintf('origin/%d',i/3);
    mkdir(dir);
    
    out=sprintf('origin/%d/%d.jpg',i/3,i);
    imwrite(img0,out);
    out=sprintf('origin/%d/%d.jpg',i/3,i+1);
    imwrite(img1,out);
    out=sprintf('origin/%d/%d.jpg',i/3,i+2);
    imwrite(img2,out);
end
    
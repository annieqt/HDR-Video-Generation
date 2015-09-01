function fusion
    for i=0:1
    in=sprintf('origin_imgs/%d',i);
    outdir=sprintf('origin_imgs/%d/result',i);
    if(~exist(outdir,'dir'))
        mkdir(outdir);
    end
    I = load_images(in);
    R1 = exposure_fusion(I,[1 1 1]);
     out=sprintf('origin_imgs/%d/result/original_imgs.jpg',i);
     imwrite(R1,out);

    in=sprintf('imgs/%d',i); 
   outdir=sprintf('imgs/%d/result',i);
    if(~exist(outdir,'dir'))
        mkdir(outdir);
    end
    I = load_images(in);
    R2 = exposure_fusion(I,[1 1 1]);
    out=sprintf('imgs/%d/result/out.jpg',i);
     imwrite(R2,out);
    end

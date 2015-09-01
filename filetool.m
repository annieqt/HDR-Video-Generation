if(~exist('street','dir'))
        mkdir('street');
end

fileFolder=fullfile('E:\ѧϰ\HDR\HDR code\video\new hdr\HDR\HDR');
dirOutput=dir(fullfile(fileFolder,'snap0*.tiff'));
fileNames={dirOutput.name}';
for i=1:length(fileNames)/4
    disp(i);
    outdir=sprintf('street/%d',i);
    if(~exist(outdir,'dir'))
    mkdir(outdir)
    end
    for j=1:4
    a= imread(fullfile(fileFolder,fileNames{4*i+j-4}));
    out=sprintf('street/%d/%d.jpg',i,j);
    a=imresize(a,1);
    imwrite(a,out);
    end
end


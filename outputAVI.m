clc
clear
%imgs_compensated/result_fusion -> video/bride_compensated.avi

ImagesFolder='high';

jpegFiles = dir(strcat(ImagesFolder,'/*.jpg'));

S = [jpegFiles(:).datenum]; 
[S,S] = sort(S);
jpegFilesS = jpegFiles(S);

VideoFile='bride_video';
writerObj = VideoWriter('video/high.avi');

fps= 10; 
writerObj.FrameRate = fps;

open(writerObj);

for t= 1:length(jpegFilesS)
     Frame=imread(strcat(ImagesFolder,'\',jpegFilesS(t).name));
     writeVideo(writerObj,im2frame(Frame));
end

close(writerObj);
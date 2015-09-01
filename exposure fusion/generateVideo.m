clear all; close all; clc;

vidObj = VideoWriter('origin.avi');    %创建VideoWrite对象
open(vidObj);                        %打开该对象
srcDir=uigetdir('origin_out'); %获得选择的文件夹
cd(srcDir);
allnames=struct2cell(dir('*.jpg')); %只处理8位的bmp文件
[k,len]=size(allnames); %获得jpg文件的个数
for i=1:len
    name=allnames{1,i};
    I=imread(name); %读取文件
 writeVideo(vidObj,I);    %将当前图形写到vidObj对象中
end
close(vidObj);  

vidObj = VideoWriter('result.avi');    %创建VideoWrite对象
open(vidObj);                        %打开该对象
srcDir=uigetdir('out'); %获得选择的文件夹
cd(srcDir);
allnames=struct2cell(dir('*.jpg')); %只处理8位的bmp文件
[k,len]=size(allnames); %获得jpg文件的个数
for i=1:len
    name=allnames{1,i};
    I=imread(name); %读取文件
 writeVideo(vidObj,I);    %将当前图形写到vidObj对象中
end
close(vidObj);  






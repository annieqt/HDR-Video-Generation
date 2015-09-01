clear all; close all; clc;

vidObj = VideoWriter('origin.avi');    %����VideoWrite����
open(vidObj);                        %�򿪸ö���
srcDir=uigetdir('origin_out'); %���ѡ����ļ���
cd(srcDir);
allnames=struct2cell(dir('*.jpg')); %ֻ����8λ��bmp�ļ�
[k,len]=size(allnames); %���jpg�ļ��ĸ���
for i=1:len
    name=allnames{1,i};
    I=imread(name); %��ȡ�ļ�
 writeVideo(vidObj,I);    %����ǰͼ��д��vidObj������
end
close(vidObj);  

vidObj = VideoWriter('result.avi');    %����VideoWrite����
open(vidObj);                        %�򿪸ö���
srcDir=uigetdir('out'); %���ѡ����ļ���
cd(srcDir);
allnames=struct2cell(dir('*.jpg')); %ֻ����8λ��bmp�ļ�
[k,len]=size(allnames); %���jpg�ļ��ĸ���
for i=1:len
    name=allnames{1,i};
    I=imread(name); %��ȡ�ļ�
 writeVideo(vidObj,I);    %����ǰͼ��д��vidObj������
end
close(vidObj);  






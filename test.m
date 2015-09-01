clc
clear all

addpath('MVsearch');
addpath('exposure fusion');
% tic
% myalignment(3);
% toc


tic
    [w1,w2,w3]=myestimation;
toc


tic
    w=mydetection3(i);
toc




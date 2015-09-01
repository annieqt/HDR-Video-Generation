clear all
close all
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Demo for Subpixel Motion Estimation
% version 1.6
%
% Stanley Chan
% 
% Copyright 2010
% University of California, San Diego
%
% Last modified: 
% 29 Apr, 2010
% 29 Jun, 2010
%  7 Jul, 2010
%  3 Jan, 2013 clean up demo
%%%%%
addpath('MVsearch');
addpath('exposure fusion');

workingDir = 'bride_imgs';

tic
    [w1,w2]=myestimation_bride_test(1);
toc

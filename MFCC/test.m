clc;clear;

%% Developed by Shiwen Deng & Yatian Gao @ UOIT.

%% Add class path of Tool Box.
addpath('/Applications/MATLAB_R2016b.app/toolbox/AuditoryToolbox');
addpath('/Applications/MATLAB_R2016b.app/toolbox/Netlab/');
addpath('/Applications/MATLAB_R2016b.app/toolbox/xmltree/');

%% Step One: Getting all the MFCC features from files.
mfcc_train = yatianMFCC('/Users/yatian/sound/data/gooddata/yueyu-48/after/');
mfcc_train'
%% Step two: Result Storing and Reading.

%dlmwrite('/Users/yatian/Desktop/result/mfcc.txt',mfcc_train);
%mfcc_train = dlmread('/Users/yatian/Desktop/result/mfcc.txt');

%% Step three: Train GMM using MFCC.
%mix = trainGMM(mfcc_train);

%% Step four: Save gmm model to xml
%saveGMM(mix,'/Users/yatian/Desktop/result/trainedgmm/');


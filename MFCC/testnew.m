
clc;clear;

%% Developed by Shiwen Deng & Yatian Gao @ UOIT.

%% Add class path of Tool Box.
addpath('/Applications/MATLAB_R2016b.app/toolbox/AuditoryToolbox');
addpath('/Applications/MATLAB_R2016b.app/toolbox/Netlab/');
addpath('/Applications/MATLAB_R2016b.app/toolbox/xmltree/');

%% Start script
%%?????wav???
maindir = '/Users/yatian/sound/data/gooddata/datafortraining/';
subdir  = dir( maindir );

for i = 1 : length( subdir )
    if( isequal( subdir( i ).name, '.' )||...
        isequal( subdir( i ).name, '..')||...
        ~subdir( i ).isdir)               % ?????????
        continue;
    end
    path_name = [ maindir, subdir( i ).name ,'/'];
    path_name
    %% Step One: Getting all the MFCC features from files.
%    mfcc_train = yatianMFCC(path_name);
    %% Step two: Result Storing and Reading.
 %   dlmwrite([path_name,'mfcc.txt'],mfcc_train);
    mfcc_train = dlmread([path_name,'mfcc.txt']);
    %% Step three: Train GMM using MFCC.
    mix = trainGMM(mfcc_train);
    %% Step four: Save gmm model to xml
    saveGMM(mix,path_name);
end
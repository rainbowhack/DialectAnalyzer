function [ mfcc_train ] = yatianMFCC( path_name )
% Developed by Shiwen Deng & Yatian Gao
%   This function is used to generate 12 vector MFCC features in wav file.
%   Input args is the root folder for the wav files.
%   Output args is the trained MFCC feature which is a N * 12 matrix. N is
%   the number of sample number @UOIT

%   Add class path of Tool Box.
addpath('/Applications/MATLAB_R2016b.app/toolbox/AuditoryToolbox');
%Iterator all possible wav files in the path.
files = dir([path_name,'*.wav']);
n = length(files);
mfcc_train = [];
for i = 1:n
     fprintf('Getting the wav file NO:');
     fprintf([num2str(i),'\n']);
     waveFile =[path_name,files(i).name];
     [x, fs]=audioread(waveFile);
     x=x-mean(x);
     x=x/max(x);
     [ceps] = mfcc(x, fs);
     if sum(sum(isnan(ceps)))>0  %remove the columns that includes NaN data from ceps
         [r,c] = find(isnan(ceps)>0);
         c = unique(c);
         ceps(:,c) = [];
     end
     mfcc_train = [mfcc_train, ceps(2:13,:)];
end
     mfcc_train = mfcc_train';
end


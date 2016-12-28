function [ mfcc_train ] = MFCC( input_args )
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明

%引入ToolBox
addpath('E:\matlab\toolbox\AuditoryToolbox');
%path_name定义wav文件的根目录。
path_name = 'J:\整理好的数据\粤语-48\默认分割组\';
%在指定目录下读取所有文件files.
files = dir([path_name,'*.wav']);
n = length(files);
mfcc_train = [];
for i = 1:n
     fprintf('Getting the wav file NO:');
     fprintf([num2str(i),'\n']);
     waveFile =[path_name,files(i).name];
     [x, fs]=audioread(waveFile);
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


clc;clear;

% Developed by Shiwen Deng & Yatian Gao @ UOIT.

mfcc_train = MFCC();

mix = trainGMM(mfcc_train);
mix
saveGMM(mix,'E:\音频实验数据\To Yatian\');


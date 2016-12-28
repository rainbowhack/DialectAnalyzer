function [ mix ] = trainGMM( mfcc_train )
%UNTITLED5 此处显示有关此函数的摘要
%   此处显示详细说明
n_in = 12;
n_centers = 10;
mix = gmm(n_in, n_centers, 'spherical');
options = foptions;
options(1) = 1; % print error values
options(14) = 500;   % number of iterations of k-means
mix = gmminit(mix, mfcc_train, options);  % with each row corresponding to a vector

% train model
options(1) = 1; % print error values
options(5) = 1; %prevent collapse of variances
options(14) = 200; % number of iterations
mix = gmmem(mix, mfcc_train, options);

end


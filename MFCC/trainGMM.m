function [ mix ] = trainGMM( mfcc_train )


n_in = 12;
n_centers = 50;
mix = gmm(n_in, n_centers, 'spherical');
options = foptions;
options(1) = 1; % print error values
options(14) = 500;   % number of iterations of k-means
mix = gmminit(mix, mfcc_train, options);  % with each row corresponding to a vector

% train model
options(1) = 1; % print error values
options(5) = 1; %prevent collapse of variances
options(14) = 100; % number of iterations
mix = gmmem(mix, mfcc_train, options);

end


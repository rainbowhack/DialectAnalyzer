function [ output_args ] = saveGMM( mix , path_name )
%UNTITLED6 此处显示有关此函数的摘要
%   此处显示详细说明
%save the matlab data struct to disk by using the xml toolbox
addpath 'E:\matlab\toolbox\xmltree';
tree = struct2xml(mix);
save(tree,[path_name,'gmm.xml']);

end


clear;clc

% read the gmm of each class

addpath 'D:\Dropbox\Matlab-Toolbox\xmltree';
addpath 'D:\Dropbox\Matlab-Toolbox\AuditoryToolbox';
addpath 'D:\Dropbox\Matlab-Toolbox\Netlab';

path = 'D:\Data\Environment Context\segment_data\';
files = dir(path);
n=length(files);

icount = 1;
for i = 1:n
    if ~isdir(files(i).name)
        classname = files(i).name;
        gmm_name = [path,classname,'\gmm.xml'];
        tree = xmltree(gmm_name);
        GMMs{icount} = convert(tree);
        %convert char data to number
        GMMs{icount}.nin = str2num(GMMs{icount}.nin);
        GMMs{icount}.ncentres = str2num(GMMs{icount}.ncentres);
        GMMs{icount}.priors = str2num(GMMs{icount}.priors);
        GMMs{icount}.centres = str2num(GMMs{icount}.centres);
        GMMs{icount}.covars = str2num(GMMs{icount}.covars);
        GMMs{icount}.nwts = str2num(GMMs{icount}.nwts);
        
        classes(icount).name = classname;
        classes(icount).id = icount;
        classes(icount).num = 0;
        
        
        n_class = icount;
        icount = icount +1;
    end
end
for i = 1:n_class
    classes(i).results = zeros(n_class,1);
end

%obtain information of test data
tree = xmltree('D:\Data\Environment Context\alcs_testfiles.xml');
alcs_testfiles = convert(tree);

N = length(alcs_testfiles.class);


for i = 1:N
    filename = cell2mat(alcs_testfiles.file(i));
    [x, fs] = wavread(filename);
    [ceps] = mfcc(x, fs);
    if sum(sum(isnan(ceps)))>0  %remove the columns that includes NaN data from ceps
        [r,c] = find(isnan(ceps)>0);
        c = unique(c);
        ceps(:,c) = [];
    end
    ceps(1,:) = [];
    ceps = ceps';
    for j = 1:n_class
        mix = GMMs{j};
        de = gmmprob(mix, ceps);
        desum(j) = sum(de);
    end
    
    % max likelihood
    [v, classid] = max(desum);
    
    s1 = cell2mat(alcs_testfiles.class(i));
    for j = 1:n_class
        if strcmp(s1,classes(j).name)
            classes(j).num = classes(j).num + 1;
            classes(j).results(classid) = classes(j).results(classid) + 1;
        end
    end
    
end
rmpath  'D:\Dropbox\Matlab-Toolbox\xmltree';
rmpath 'D:\Dropbox\Matlab-Toolbox\AuditoryToolbox';
addpath 'D:\Dropbox\Matlab-Toolbox\Netlab';



a=0;
for i = 1:n_class
    names{i} = classes(i).name;
    y(i,:) = classes(i).results;
    classid = classes(i).id;
    a(i,1) = classes(i).results(classid)/classes(i).num;
end
figure;
bar(y)







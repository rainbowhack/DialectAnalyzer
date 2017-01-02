%% Add class path of Tool Box.
addpath('/Applications/MATLAB_R2016b.app/toolbox/AuditoryToolbox');
addpath('/Applications/MATLAB_R2016b.app/toolbox/Netlab/');
addpath('/Applications/MATLAB_R2016b.app/toolbox/xmltree/');

gmmpath = '/Users/yatian/sound/data/gooddata/datafortraining/1-zhongyuanguanhua/';
        gmm_name = [gmmpath,'gmm.xml'];
        gmm_name
        tree = xmltree(gmm_name);
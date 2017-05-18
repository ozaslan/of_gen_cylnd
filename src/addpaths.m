function addpaths()

[pathstr, ~, ~] = fileparts(mfilename('fullpath'));

addpath(pathstr);
addpath([pathstr '/../utils/']);


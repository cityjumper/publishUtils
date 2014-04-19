%% MATLAB Publish Utilities
% This file when published in MATLAB will illustrate new dynamic elements
% for HTML. Please note this only applies for HTML publishing.
%%

myyear = {'2011';'2012';'2013';'2014'};
values = rand(4,1);
mytable = table(myyear,values);

disp(makeTableChart(mytable));
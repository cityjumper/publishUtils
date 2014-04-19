%% MATLAB Publish Utilities
% This file when published in MATLAB will illustrate new dynamic elements
% for HTML. Please note this only applies for HTML publishing.
%%

myyear = {'2011';'2012';'2013';'2014'};
values = [12;122;1231;1213];
morevalues= [true;false;true;false];
mytable = table(myyear,values,morevalues);

disp(makeTableChart(mytable));
mytable.Properties.VariableNames{1} = 'Year';
mytable.Properties.VariableNames{2} = 'Values';
mytable.Properties.VariableNames{3} = 'MoreValues';
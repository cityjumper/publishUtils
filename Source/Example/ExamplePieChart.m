%% MATLAB Publish Utilities
% This file when published in MATLAB will illustrate new dynamic elements
% for HTML. Please note this only applies for HTML publishing.
% Copyright 2014 The MathWorks, Inc. Gareth Thomas
%


%% PieChart
%

myyear = {'2011';'2012';'2013';'2014'};
values = [12;122.44;1231;1213];
morevalues= [true;false;true;false];
mytable = table(myyear,values,morevalues);

mytable.Properties.VariableNames{1} = 'Year';
mytable.Properties.VariableNames{2} = 'Values';
mytable.Properties.VariableNames{3} = 'MoreValues';

disp(makePieChart(mytable));
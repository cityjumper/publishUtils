%% MATLAB Publish Utilities
% This file when published in MATLAB will illustrate new dynamic elements
% for HTML. Please note this only applies for HTML publishing.
% Copyright 2014 The MathWorks, Inc.Gareth Thomas
%


%% ColumnChart
%
mycountry = {'Portugal';'Germany';'Spain';'China'};
values = [12;122;1231;1213];

mytable1 = table(mycountry,values);

myChartOptions.isStacked = 'false';
disp(makeColumnChart(mytable1,myChartOptions));   

%% MATLAB Publish Utilities
% This file when published in MATLAB will illustrate new dynamic elements
% for HTML. Please note this only applies for HTML publishing.
% Copyright 2014 The MathWorks, Inc.
% Gareth Thomas
%%

myyear = {'2011';'2012';'2013';'2014'};
values = [12;122;1231;1213];
morevalues= [true;false;true;false];
mytable = table(myyear,values,morevalues);

disp(makeTableChart(mytable));
mytable.Properties.VariableNames{1} = 'Year';
mytable.Properties.VariableNames{2} = 'Values';
mytable.Properties.VariableNames{3} = 'MoreValues';


%% ColumnChart
%
mycountry = {'Portugal';'Germany';'Spain';'China'};
values = [12;122;1231;1213];

mytable1 = table(mycountry,values);

myChartOptions.isStacked = 'false';
disp(makeColumnChart(mytable1,myChartOptions));   
%% GeoChart
%
myChartOptions.region = 'auto';
myChartOptions.displaymode = 'regions';
disp(makeGeoChart(mytable1,myChartOptions));   
%% LineChart
%
myChartOptions.isStacked = 'false';
disp(makeLineChart(mytable1,myChartOptions));  
%% Map
%
disp(makeMap(mytable1));  
%% PieChart
%
disp(makePieChart(mytable));
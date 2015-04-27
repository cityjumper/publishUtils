%% MATLAB Publish Utilities
% This file when published in MATLAB will illustrate new dynamic elements
% for HTML. Please note this only applies for HTML publishing.
% Copyright 2014 The MathWorks, Inc.Gareth Thomas
%

%% Annotation Chart
%
mytable2 = table((datetime:-1:datetime-10)',(1:10)',repmat('lol',10,1),repmat('wow',10,1),(1:10)'+3,repmat('l1121ol',10,1),repmat('w21ow',10,1));
disp(makeAnnotationChart(mytable2));
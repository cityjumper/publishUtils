function out = makePitChart(mytable)
% Given a mytable of 2x2 this will plot a pie chart
% The mytable has to have the format of column1 string, column 2 numbers

aux_rand = floor(rand(1)*100);

s = {};
s{end+1} = sprintf('<html><head><script type="text/javascript" src="https://www.google.com/jsapi"></script><script type="text/javascript">google.load("visualization", "1", {packages:["corechart"]});google.setOnLoadCallback(drawChart);function drawChart() {var data = google.visualization.arrayToDataTable([');

s{end+1} = sprintf('[''%s'', ''%s''],',char(mytable.Properties.VariableNames(1)),char(mytable.Properties.VariableNames(2)));

% write first row for TableData
for i=1:size(mytable,1)
    s{end+1} = sprintf('[''%s'',%d],',char(mytable.(1)(i)),mytable.(2)(i));
end
s{end+1} = sprintf(']);var options = {};var chart = new google.visualization.PieChart(document.getElementById(''piechart%d''));chart.draw(data, options);}</script></head><body><div id="piechart%d" style="width: 900px; height: 500px;"></div></body></html>',aux_rand,aux_rand);
out = '';
for i=1:length(s)
    out = sprintf('%s%s',out,s{i});
end
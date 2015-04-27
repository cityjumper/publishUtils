function out = makeAnnotationChart(mytable)
% data must look like:
% date|number|string title|string text|number|string title|string text....
% Generate Random name
aux_rand = floor(rand(1)*1000);
s = {};
s{end+1} = sprintf('<html><head><script type="text/javascript" src="https://www.google.com/jsapi?autoload={''modules'':[{''name'':''visualization'',''version'':''1'',''packages'':[''annotationchart'']}]}"></script><script type=''text/javascript''>google.load(''visualization'', ''1'', {''packages'':[''annotationchart'']});google.setOnLoadCallback(drawChart);function drawChart() {var data = new google.visualization.DataTable();');

s{end+1} = sprintf('data.addColumn(''date'', ''Date'');');
% Add Column names
for i = 2:3:length(mytable.Properties.VariableNames)
    
        s{end+1} = sprintf('data.addColumn(''number'', ''%s'');',mytable.Properties.VariableNames{i});
        s{end+1} = sprintf('data.addColumn(''string'', ''%s'');',mytable.Properties.VariableNames{i+1});
        s{end+1} = sprintf('data.addColumn(''string'', ''%s'');',mytable.Properties.VariableNames{i+2});
end
s{end+1} = sprintf('data.addRows([');
% Add Rows
for i=1:size(mytable,1)
    s{end+1} = sprintf('[new Date(%d, %d, %d),',year(mytable{i,1}),month(mytable{i,1}),day(mytable{i,1}));
    for j=2:3:size(mytable,2)
         s{end+1} = sprintf('%d,''%s'', ''%s'',',mytable{i,j},mytable{i,j+1},mytable{i,j+2});
    end
    s{end+1} = sprintf('],');
end

s{end+1} = sprintf(']); var chart = new google.visualization.AnnotationChart(document.getElementById(''chart_div%d''));var options = {displayAnnotations: true};chart.draw(data, options);}</script></head><body><div id=''chart_div%d'' style=''width: 900px; height: 500px;''></div></body></html>',aux_rand,aux_rand);

out = '';
for i=1:length(s)
    out = sprintf('%s%s',out,s{i});
end
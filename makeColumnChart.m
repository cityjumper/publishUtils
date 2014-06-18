function out = makeColumnChart(mytable,myChartOptions)

% Generate Random name
aux_rand = floor(rand(1)*1000);
s = {};
s{end+1} = sprintf('<html><head><script type="text/javascript" src="https://www.google.com/jsapi"></script><script type="text/javascript">google.load("visualization", "1", {packages:["corechart"]});google.setOnLoadCallback(drawChart);function drawChart() ');

%s{end+1} = sprintf('{var data = google.visualization.arrayToDataTable([[');

s{end+1} = sprintf('{var data = new google.visualization.DataTable();');
% Add Column names
for i = 1:length(mytable.Properties.VariableNames)
    if(isnumeric(mytable.(i)(1)))
        s{end+1} = sprintf('data.addColumn(''number'', ''%s'');',char(mytable.Properties.VariableNames(i)));
    else
        if(islogical(mytable.(i)(1)))
            s{end+1} = sprintf('data.addColumn(''boolean'', ''%s'');',char(mytable.Properties.VariableNames(i)));
        else
            s{end+1} = sprintf('data.addColumn(''string'', ''%s'');',char(mytable.Properties.VariableNames(i)));
        end
        
    end
end
s{end+1} = sprintf('data.addRows([');
% Add Rows
for i=1:size(mytable,1)
    s{end+1} = sprintf('[');
    for j=1:size(mytable,2)
        if (isnumeric(mytable.(j)(i)))
            %s{end+1} = sprintf('{v: %d},',(mytable.(j)(i)));
            s{end+1} = sprintf('%.0f,',(mytable.(j)(i)));
        else
            if (islogical(mytable.(j)(i)))
                if(mytable.(j)(i))
                    s{end+1} = sprintf('true,');
                else
                    s{end+1} = sprintf('false,');
                end
                
            else
                s{end+1} = sprintf('''%s'',',char(mytable.(j)(i)));
            end
        end
    end
    s{end+1} = sprintf('],');
end

s{end+1} = sprintf(']); var options = {hAxis: {textStyle: {fontName: ''Arial''}},isStacked: %s};var chart = new google.visualization.ColumnChart(document.getElementById(''chart_div%d''));chart.draw(data, options);}</script></head><body><div id="chart_div%d" style="width: 700px; height: 200px;"></div></body></html>',myChartOptions.isStacked,aux_rand,aux_rand);

out = '';
for i=1:length(s)
    out = sprintf('%s%s',out,s{i});
end
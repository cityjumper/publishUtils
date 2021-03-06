function out = makeTableChart(mytable)
% Receives mytable which is of the table format
% Copyright 2014 The MathWorks, Inc.
% Gareth Thomas
aux_rand = floor(rand(1)*10000);
s = {};
s{end+1} = sprintf('<html><head><script type=''text/javascript'' src=''https://www.google.com/jsapi''></script><script type=''text/javascript''>google.load(''visualization'', ''1'', {packages:[''table'']});google.setOnLoadCallback(drawTable);function drawTable() ');
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
            s{end+1} = sprintf('{v: %.3f, f: ''%.3f ''},',(mytable.(j)(i)),(mytable.(j)(i)));
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
% Finish writting
s{end+1} = sprintf(']);var table = new google.visualization.Table(document.getElementById(''table_div%d''));table.draw(data, {showRowNumber: false});}</script></head><body><div id=''table_div%d''></div><br></body></html>',aux_rand,aux_rand);
out = '';
for i=1:length(s)
    out = sprintf('%s%s',out,s{i});
end
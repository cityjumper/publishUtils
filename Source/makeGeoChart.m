function out = makeGeoChart(mygeotable,myChartOptions)
% Given a table with *.country and *.pop where pop is a number create a
% map;

% Generate Random name
aux_rand = floor(rand(1)*10000);

s = {};
s{end+1} = sprintf('<html><head><meta http-equiv="X-UA-Compatible" content="IE=edge"><script type=''text/javascript'' src=''https://www.google.com/jsapi''></script><script type=''text/javascript''>google.load(''visualization'', ''1'', {''packages'': [''geochart'']});google.setOnLoadCallback(drawRegionsMap);function drawRegionsMap() ');
s{end+1} = sprintf('{var data = google.visualization.arrayToDataTable([[''Country'', ''Value''],');
% Data
for i = 1:length(mygeotable.(1)(:))
    s{end+1} =  sprintf('[''%s'', %d],',char(mygeotable.(1)(i)),mygeotable.(2)(i));
end

% Chart options
s{end+1} = sprintf(']);var options = { region:''%s'',colorAxis: {colors: [''white'', ''blue'']},displayMode: ''%s''};',myChartOptions.region,myChartOptions.displaymode);
s{end+1} = sprintf('var chart = new google.visualization.GeoChart(document.getElementById(''chart_div%d''));chart.draw(data, options);};</script></head><body><div id="chart_div%d" style="width: 900px; height: 500px;"></div></body></html>',aux_rand,aux_rand);

out = '';
for i=1:length(s)
    out = sprintf('%s%s',out,s{i});
end
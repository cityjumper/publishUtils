function out =makeMap(mytable)
% the input mytable should be a 2x2 only with strings. The first will show
% the location and the second the string to attach.
aux_rand = floor(rand(1)*100);
s = {};
s{end+1} = sprintf('<html><head><script type="text/javascript" src="https://www.google.com/jsapi"></script><script type="text/javascript">google.load("visualization", "1", {packages:["map"]});google.setOnLoadCallback(drawMap);function drawMap() {var data = google.visualization.arrayToDataTable([[''Location'', ''Name''],');

for i = 1:size(mytable,1)
    s{end+1} = sprintf('[''%s'', ''%s''],',char(mytable.(1)(i)),char(mytable.(1)(i)));
end
s{end+1} = sprintf(']);var map = new google.visualization.Map(document.getElementById(''map_div%d''));map.draw(data, {showTip: true});}</script></head><body><div id="map_div%d" style="width: 1200px; height: 400px"></div></body></html>',aux_rand,aux_rand);


out = '';
for i=1:length(s)
    out = sprintf('%s%s',out,s{i});
end
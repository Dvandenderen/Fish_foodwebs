
% calculate temperature dependencies integrating the vertical distribution

function[scTemp, scTempm] = calctemperature(param)

load('tempdata.mat');
tempdata = table2array(tempdata);
tempdata(:,5) = 10;
dist = (param.depthDay + param.depthNight)/2;
TQ10 =  param.Q10.^((tempdata(1:param.bottom+1 , (param.region+1))-10)/10);
TQ10m =  param.Q10m.^((tempdata(1:param.bottom+1 , (param.region+1))-10)/10);

scTemp_step = dist .* TQ10;
scTemp = sum(scTemp_step,1);

scTemp_stepm = dist .* TQ10m;
scTempm = sum(scTemp_stepm,1);


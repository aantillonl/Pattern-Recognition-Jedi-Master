function features=extract_features(data)
% Extract features from the sensor data. Fill the features to the
% data structure.
% data: cell array of structs

[fx,fy,fz,mx,my,mz]=feature_maxfreq(data);
[px,py,pz]=feature_peak_indices(data);
ma=max(data);
mi=min(data);
me=mean(data);
st=std(data);

[totalDistance,totalDisplacement] = GetDistanceAndDisplacement(data);

features = [fx fy fz mx my mz px py pz ma mi me st totalDistance' totalDisplacement'];
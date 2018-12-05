function output = mapFPs(roiRect, featurePoints)
    % Maps feature points to original face image
    
    origin = roiRect(1, 1:2); % Get x,y coordinates only
    rows = size(featurePoints);
    mappedPoints = featurePoints(:,:);
    for i = 1:rows
        mappedPoints(i,:) = [(origin(1,1) + featurePoints(i,1)) (origin(1,2) + featurePoints(i,2))];
    
    output = mappedPoints;
end


function output = featureSearch(image, leftCornerPoint, rightCornerPoint)
    [rows, ~] = size(image);
    mid = floor((leftCornerPoint(1) + rightCornerPoint(1))/2);
    % Mid feature point top down
    topMidPoint = [1 1];
    for i = 1:rows
        if image(i, mid) ~= 0
            topMidPoint = [mid i];
            break;
        end
    end
    
    bottomMidPoint = [1 1];
    % Mid feature point bottom up
    for i = rows: -1: 1
        if (image(i, mid) ~= 0)
            bottomMidPoint = [mid i];
            break;
        end
    end
    
    leftMid = floor((leftCornerPoint(1) + mid)/2);
    % left mid feature point top down
    topLeftMidPoint = [1 1];
    for i = 1:rows
        if image(i, leftMid) ~= 0
            topLeftMidPoint = [leftMid i];
            break;
        end
    end
    bottomLeftMidPoint = [1 1];
    % left mid feature point bottom up
    for i = rows: -1: 1
        if (image(i, leftMid) ~= 0)
            bottomLeftMidPoint = [leftMid i];
            break;
        end
    end
    
    rightMid = floor((rightCornerPoint(1) + mid)/2);
    % right mid feature point top down
    topRightMidPoint = [1 1];
    for i = 1:rows
        if image(i, rightMid) ~= 0
            topRightMidPoint = [rightMid i];
            break;
        end
    end
    
    bottomRightMidPoint = [1 1];
    % right mid feature point bottom up
    for i = rows: -1: 1
        if (image(i, rightMid) ~= 0)
            bottomRightMidPoint = [rightMid i];
            break;
        end
    end
    
    output = [leftCornerPoint; rightCornerPoint; topMidPoint; bottomMidPoint; topLeftMidPoint; bottomLeftMidPoint; topRightMidPoint; bottomRightMidPoint];

end
function output = featureSearchEX(image)
%linear search for extremum points
    image = bwareaopen(image,20);
    [rows, cols] = size(image);
    leftCornerPoint = -1;
    rightCornerPoint = -1;
    % Left corner point search starting from bottom left 
    for j = 1:cols
        whitePixelFound = false;
        for i = rows: -1: 1
            if (image(i,j) ~= 0)
                leftCornerPoint = [j i]; % [x y]
                whitePixelFound = true;
                break;
            end
        end
        if (whitePixelFound)
            break;
        end
    end
    
    % Right corner point search starting from bottom right
    for j = cols: -1: 1
        whitePixelFound = false;
        for i = rows: -1: 1
            if (image(i,j) ~= 0)
                rightCornerPoint = [j i]; % [x y]
                whitePixelFound = true;
                break;
            end
        end
        if (whitePixelFound)
            break;
        end
    end
    output = [leftCornerPoint;rightCornerPoint];
end


function [output1, output2] = eyebrowsROI(faceImage, eyeRect, eyeMidPoint)
    x = eyeRect(1,1);
    y = eyeRect(1,2);
    widthRect = eyeRect(1,3);
    heightRect = eyeRect(1,4);
    
    d = floor(heightRect - eyeMidPoint(1,2));
    
    eyebrowRect = eyeRect(:,:);
    eyebrowRect(1,1) = x;
    eyebrowRect(1,2) = y - d;
    eyebrowRect(1,3) = widthRect;
    eyebrowRect(1,4) = heightRect;
    
    [height, width] = size(faceImage);
    roiWidth = 0.475 * width;
    roiHeight = 0.175 * height;
    
    eyebrowRect = remapROI(eyebrowRect, roiWidth, roiHeight);
    eyebrowImage = imcrop(faceImage, eyebrowRect);
    
    output1 = eyebrowImage;
    output2 = eyebrowRect;
end


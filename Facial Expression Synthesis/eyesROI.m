function [output1,output2,output3,output4] = eyesROI(faceImage)
    [height, width] = size(faceImage);
    roiWidth = 0.375 * width;
    roiHeight = 0.15 * height;

    eyesdetector = vision.CascadeObjectDetector('EyePairBig', 'MergeThreshold', 10);
    eyes = eyesdetector(faceImage);
    [x, y] = size(eyes);
    %for i = 1:x
        %test = imcrop(faceImage, eyes(i,:));
        %figure, imshow(test);
    %end
    eyesRect = eyes(x,:);   % [x y width height]
    
    % Splitting the pair of eyes region to half to obtain 
    % left and right eye individually
    leftEyeRect = eyesRect(1,:);
    rightEyeRect = eyesRect(1,:);
    width = eyesRect(1,3);
    newWidth = width/2;
    leftEyeRect(1,3) = newWidth;
    rightEyeRect(1,1) = rightEyeRect(1,1) + newWidth;
    rightEyeRect(1,3) = newWidth;
    
    leftEyeRect = remapROI(leftEyeRect, roiWidth, roiHeight);
    rightEyeRect = remapROI(rightEyeRect, roiWidth, roiHeight);
    
    leftEyeImage = imcrop(faceImage, leftEyeRect);
    rightEyeImage = imcrop(faceImage, rightEyeRect);

    output1 = leftEyeImage;
    output2 = rightEyeImage;
    output3 = leftEyeRect;
    output4 = rightEyeRect;

end

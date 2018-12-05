function [output1,output2] = mouthROI(faceImage)
    [height, width] = size(faceImage);
    roiWidth = 0.6 * width;
    roiHeight = 0.3 * height;
    
    mouthdetector = vision.CascadeObjectDetector('Mouth', 'MergeThreshold', 300);
    mouth = mouthdetector(faceImage);
    [x, y] = size(mouth);
    mouthRect = mouth(x,:);
    mouthRect = remapROI(mouthRect, roiWidth, roiHeight);
    
    mouthImage = imcrop(faceImage, mouthRect);

    output1 = mouthImage;
    output2 = mouthRect;
end


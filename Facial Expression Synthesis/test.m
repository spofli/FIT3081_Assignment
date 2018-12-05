imageFiles = dir('*.tiff');
total = floor(length(imageFiles)/2);

% Set the number of rows (height) of the image to be 400, NaN tells
% imresize() to calculate the necessary number of cols to preserve the
% aspect ratio
dimensions = [400 NaN];

totalDispLeftEye = zeros(8,2);
totalDispRightEye = zeros(8,2);
totalDispLeftEyebrow = zeros(8,2);
totalDispRightEyebrow = zeros(8,2);
totalDispMouth = zeros(8,2);

for i = 1:total
    neutral = sprintf('neutral_%d.tiff', i);
    happy = sprintf('happy_%d.tiff', i);
    
    [dispLeftEye, dispRightEye, dispLeftEyebrow, dispRightEyebrow, dispMouth] = getDisplacements(neutral, happy);
    
    totalDispLeftEye = totalDispLeftEye + dispLeftEye;
    totalDispRightEye = totalDispRightEye + dispRightEye;
    totalDispLeftEyebrow = totalDispLeftEyebrow + dispLeftEyebrow;
    totalDispRightEyebrow = totalDispRightEyebrow + dispRightEyebrow;
    totalDispMouth = totalDispMouth + dispMouth;
end

avgDispLeftEye = totalDispLeftEye/total;
avgDispRightEye = totalDispRightEye/total;
avgDispLeftEyebrow = totalDispLeftEyebrow/total;
avgDispRightEyebrow = totalDispRightEyebrow/total;
avgDispMouth = totalDispMouth/total;

for i = 1:total
    neutral = sprintf('neutral_%d.tiff', i);
    happyName = sprintf('happy_%d.tiff', i);
    
    happy = imread(happyName);
    happy = imresize(happy, dimensions);
    
    [leftEyeX, rightEyeX, mouthX, leftEyebrowX, rightEyebrowX, im] = getfeaturePoints(neutral);
    
    leftEyeY = leftEyeX + avgDispLeftEye;
    rightEyeY = rightEyeX + avgDispRightEye;
    leftEyebrowY = leftEyebrowX + avgDispLeftEyebrow;
    rightEyebrowY = rightEyebrowX + avgDispRightEyebrow;
    mouthY = mouthX + avgDispMouth;
    
    result = warper(im,leftEyeX,leftEyeY,leftEyebrowX,leftEyebrowY,rightEyeX,rightEyeY,rightEyebrowX,rightEyebrowY,mouthX,mouthY);
    
    figure;
    subplot(1,2,1), imshow(happy);
    subplot(1,2,2), imshow(result);
end

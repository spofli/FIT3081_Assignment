function [leftEyeFP, rightEyeFP, mouthFP, leftEyebrowFP, rightEyebrowFP, oriFace] = manualfeaturePoints(im)

facedetector = vision.CascadeObjectDetector;

ori_image = imread(im);

if size(ori_image,3) == 3
    image = rgb2gray(ori_image);
else
    image = ori_image;
end

% Set the number of rows (height) of the image to be 400, NaN tells
% imresize() to calculate the necessary number of cols to preserve the
% aspect ratio
dimensions = [400 NaN];
image = imresize(image, dimensions);
ori_image = imresize(ori_image, dimensions);

face = facedetector(image);
faceImage = imcrop(image, face);
oriFace = imcrop(ori_image, face);

%eye split
[leftEyeImage, rightEyeImage, leRect, reRect] = eyesROI(faceImage);
            
%left eye
figure('Name','Left Eye'),imshow(leftEyeImage),title('Input Left Eye Points');
leftEyeFP = ginput(8);
leftEyeFP = sortrows(leftEyeFP,2);
toplefteye = leftEyeFP(1,:);

%left eyebrow
[leftEyebrowImage, lbrowRect] = eyebrowsROI(faceImage, leRect, toplefteye);
figure('Name','Left Eyebrow'),imshow(leftEyebrowImage),title('Input Left Eyebrow Points');
leftEyebrowFP = ginput(8);

%right eye
figure('Name','Right Eye'),imshow(rightEyeImage),title('Input Right Eye Points');
rightEyeFP = ginput(8);
rightEyeFP = sortrows(rightEyeFP,2);
toprighteye = rightEyeFP(1,:);

%right eyebrow
[rightEyebrowImage, rbrowRect] = eyebrowsROI(faceImage, reRect, toprighteye);
figure('Name','Right Eyebrow'),imshow(rightEyebrowImage),title('Input Right Eyebrow Points');
rightEyebrowFP = ginput(8);

%mouth
[mouthImage, mouthRect] = mouthROI(faceImage);
figure('Name','Mouth'),imshow(mouthImage),title('Input Mouth Points');
mouthFP = ginput(8);
close all

leftEyeFP = mapFPs(leRect, leftEyeFP);
rightEyeFP = mapFPs(reRect, rightEyeFP);
mouthFP = mapFPs(mouthRect, mouthFP);
leftEyebrowFP = mapFPs(lbrowRect, leftEyebrowFP);
rightEyebrowFP = mapFPs(rbrowRect, rightEyebrowFP);
%featurePoints = [leftEyeFP; rightEyeFP; mouthFP; leftEyebrowFP; rightEyebrowFP];
%faceImage = insertMarker(faceImage, featurePoints, 'x', 'color', 'red', 'size', 5);
%figure, imshow(faceImage);


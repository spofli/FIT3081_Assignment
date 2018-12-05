function [leftEyeFP, rightEyeFP, mouthFP, leftEyebrowFP, rightEyebrowFP, oriFace] = getfeaturePoints(im)

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

mT = 0.1; %threshold for mouth
mTfp = 0.2;

eT = 0.1; % threshold for eyes 
eTfp = 0.2;

browT = 0.19; % threshold for eyebrows
browTfp = 0.20;

%eye split
[leftEyeImage, rightEyeImage, leRect, reRect] = eyesROI(faceImage);
%figure, imshow(leftEyeImage);
%left eye
leftEyeBinEX = cumhist(leftEyeImage, eT);
%subplot(5,2,1)
%imshow(leftEyeBinEX)
leftEyeEX = featureSearchEX(leftEyeBinEX);
leftEyeBinFP = cumhist(leftEyeImage, eTfp);
%subplot(5,2,2)
%imshow(leftEyeBinFP)
leftEyeFP = featureSearch(leftEyeBinFP,leftEyeEX(1,:),leftEyeEX(2,:));

%left eyebrow
[leftEyebrowImage, lbrowRect] = eyebrowsROI(faceImage, leRect, leftEyeFP(3,:));
n = -1;
leftslider = 0;
%figure
%subplot(1,3,1), imshow(oriFace);
while n == -1
    if leftslider == 19
        break
    end
    leftEyebrowBinEX = cumhist(leftEyebrowImage, browT - (leftslider.*0.01));
    %subplot(5,2,3)
    %imshow(leftEyebrowBinEX)
    leftEyebrowEX = featureSearchEX(leftEyebrowBinEX);
    n = leftEyebrowEX(1);
    leftslider = leftslider + 1;
    %subplot(1,3,2), imshow(leftEyebrowBinEX);
end
leftEyebrowBinFP = cumhist(leftEyebrowImage, browTfp - (leftslider.*0.01));
%subplot(5,2,4)
%imshow(leftEyebrowBinFP)
leftEyebrowFP = featureSearch(leftEyebrowBinFP,leftEyebrowEX(1,:),leftEyebrowEX(2,:));

%right eye
rightEyeBinEX = cumhist(rightEyeImage, eT);
%subplot(5,2,5)
%imshow(rightEyeBinEX)
rightEyeEX = featureSearchEX(rightEyeBinEX);
rightEyeBinFP = cumhist(rightEyeImage, eTfp);
%subplot(5,2,6)
%imshow(rightEyeBinFP)
rightEyeFP = featureSearch(rightEyeBinFP,rightEyeEX(1,:),rightEyeEX(2,:));

%right eyebrow
[rightEyebrowImage, rbrowRect] = eyebrowsROI(faceImage, reRect, rightEyeFP(3,:));
n = -1;
rightslider = 0;
while n == -1
    if rightslider == 19
        break
    end
    rightEyebrowBinEX = cumhist(rightEyebrowImage, browT - (rightslider.*0.01));
    %subplot(5,2,7)
    %imshow(rightEyebrowBinEX)
    rightEyebrowEX = featureSearchEX(rightEyebrowBinEX);
    n = rightEyebrowEX(1);
    rightslider = rightslider + 1;
    %subplot(1,3,3), imshow(rightEyebrowBinEX);
end
rightEyebrowBinFP = cumhist(rightEyebrowImage, browTfp - (rightslider.*0.01));
%subplot(5,2,8)
%imshow(rightEyebrowBinFP)
rightEyebrowFP = featureSearch(rightEyebrowBinFP,rightEyebrowEX(1,:),rightEyebrowEX(2,:));

%mouth
[mouthImage, mouthRect] = mouthROI(faceImage);
mouthBinEX = cumhist(mouthImage, mT);
%subplot(5,2,9)
%imshow(mouthBinEX)
mouthEX = featureSearchEX(mouthBinEX); %feature point search
mouthBinFP = cumhist(mouthImage, mTfp);
%subplot(5,2,9)
%imshow(mouthBinFP)
mouthFP = featureSearch(mouthBinFP,mouthEX(1,:),mouthEX(2,:));

leftEyeFP = mapFPs(leRect, leftEyeFP);
rightEyeFP = mapFPs(reRect, rightEyeFP);
mouthFP = mapFPs(mouthRect, mouthFP);
leftEyebrowFP = mapFPs(lbrowRect, leftEyebrowFP);
rightEyebrowFP = mapFPs(rbrowRect, rightEyebrowFP);


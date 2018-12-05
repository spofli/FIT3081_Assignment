%Demo

imageFiles = dir('*.tiff');
dimensions = [400 NaN];

photo3 = imread('photo3.jpg');
[leftEye, rightEye, mouth, leftEyebrow, rightEyebrow, im] = getfeaturePoints('photo3.jpg');
result = warper(im,leftEye,leftEye,leftEyebrow,leftEyebrow,rightEye,rightEye,rightEyebrow,rightEyebrow,mouth,mouth);
figure;
subplot(1,2,1), imshow(photo3);
subplot(1,2,2), imshow(result);

photo1 = imread('photo1.png');
[leftEye, rightEye, mouth, leftEyebrow, rightEyebrow, im] = getfeaturePoints('photo1.png');
result = warper(im,leftEye,leftEye,leftEyebrow,leftEyebrow,rightEye,rightEye,rightEyebrow,rightEyebrow,mouth,mouth);
figure;
subplot(1,2,1), imshow(photo1);
subplot(1,2,2), imshow(result);


for i = 6:9
    neutral = sprintf('demo_%d.tiff', i);
    happyName = sprintf('dhappy_%d.tiff', i);
    
    happy = imread(happyName);
    happy = imresize(happy, dimensions);
    
    [leftEye, rightEye, mouth, leftEyebrow, rightEyebrow, im] = getfeaturePoints(neutral);
    feature_points = [leftEye; rightEye; mouth; leftEyebrow; rightEyebrow];
    marked_image = insertMarker(im,feature_points, 'o', 'color','red','size',1);
    figure;
    imshow(marked_image);
end

for i = 1:5
    neutral = sprintf('demo_%d.tiff', i);
    happyName = sprintf('dhappy_%d.tiff', i);
    
    happy = imread(happyName);
    happy = imresize(happy, dimensions);
    
    [leftEye, rightEye, mouth, leftEyebrow, rightEyebrow, im] = getfeaturePoints(neutral);
    result = warper(im,leftEye,leftEye,leftEyebrow,leftEyebrow,rightEye,rightEye,rightEyebrow,rightEyebrow,mouth,mouth);
    figure;
    subplot(1,3,1), imshow(neutral);
    subplot(1,3,2), imshow(happy);
    subplot(1,3,3), imshow(result);
end
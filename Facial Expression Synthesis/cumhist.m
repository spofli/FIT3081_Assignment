function output = cumhist(image, thres)
    [rows, cols] = size(image);
    totalPixels = rows * cols;
    counts = imhist(image);
    % Probabilities of occurences for each gray level
    P = counts/totalPixels;
    % Cumulative sum of histogram values for each gray level
    CH = cumsum(P);
    % Assign pixel value of 255 at current image pixel 
    % for cumsum value that is below or meets the threshold
    binImage = image(:,:);
    for i = 1:rows
        for j = 1:cols
            currentPx = image(i,j) + 1;
            currentCH = CH(currentPx);
            if (currentCH <= thres)
                binImage(i,j) = 255;
            else
                binImage(i,j) = 0;
            end
        end
    end
    
    %figure, subplot(1,2,1);
    %imshow(binImage)
    %hold on
    binImage = imclearborder(binImage);
    output = binImage;
    %subplot(1,2,2)
    %imshow(binImage)
    %hold on
    
end


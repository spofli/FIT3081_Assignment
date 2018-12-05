function output = remapROI(originRect, roiWidth, roiHeight)
    % Remap ROI rect with sizes specified by Paul et. al
    roiWidth = floor(roiWidth);
    roiHeight = floor(roiHeight);
    newRect = originRect(1,:);
    originRectwidth = floor(newRect(1,3)/2);
    originRectheight = floor(newRect(1,4)/2);
    
    midx1 = newRect(1,1) + originRectwidth;
    midy1 = newRect(1,2) + originRectheight;
    
    newRect(1,1) = midx1 - floor(roiWidth/2);
    newRect(1,2) = midy1 - floor(roiHeight/2);
    newRect(1,3) = roiWidth;
    newRect(1,4) = roiHeight;
    
    output = newRect;
end


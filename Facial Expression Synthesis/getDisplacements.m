function [dispLeftEye, dispRightEye, dispLeftEyebrow, dispRightEyebrow, dispMouth] = getDisplacements(neutral, happy)
%GETDISPLACEMENTS displacement calculation between feature points of neutral and happy face
%   neutral = filename of neutral image
%   happy = filename of happy image
    %[leftEyeFP, rightEyeFP, mouthFP, leftEyebrowFP, rightEyebrowFP, ~] = manualfeaturePoints(neutral);
    %[leftEyeFP2, rightEyeFP2, mouthFP2, leftEyebrowFP2, rightEyebrowFP2, ~] = manualfeaturePoints(happy);
    [leftEyeFP, rightEyeFP, mouthFP, leftEyebrowFP, rightEyebrowFP, ~] = getfeaturePoints(neutral);
    [leftEyeFP2, rightEyeFP2, mouthFP2, leftEyebrowFP2, rightEyebrowFP2, ~] = getfeaturePoints(happy);
    
    dispLeftEye = displacement(leftEyeFP, leftEyeFP2);
    dispRightEye = displacement(rightEyeFP, rightEyeFP2);
    dispLeftEyebrow = displacement(leftEyebrowFP, leftEyebrowFP2);
    dispRightEyebrow = displacement(rightEyebrowFP, rightEyebrowFP2);
    dispMouth = displacement(mouthFP, mouthFP2);
end


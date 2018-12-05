function outIm = warper(im,leftEyeX,leftEyeY,leftEyebrowX,leftEyebrowY,rightEyeX,rightEyeY,rightEyebrowX,rightEyebrowY,mouthX,mouthY)

%Left (users PoV) eye and eyebrow triangulation and displacement
[LX,LY,LX2,LY2,LTri] = l_eyebrow_eye_triangles(leftEyeX,leftEyeY,leftEyebrowX,leftEyebrowY);

%Right (users PoV) eye and eyebrow triangulation and displacement
[RX,RY,RX2,RY2,RTri] = r_eyebrow_eye_triangles(rightEyeX,rightEyeY,rightEyebrowX,rightEyebrowY);

%Mouth triangulation and displacement
[MX,MY,MX2,MY2,MTri] = mouth_triangles(mouthX,mouthY);

%concatenating all
X = [LX;RX;MX];
Y = [LY;RY;MY];
X2 = [LX2;RX2;MX2];
Y2 = [LY2;RY2;MY2];
RTri = RTri + length(LX);
MTri = MTri + (length(LX) + length(RX));
Tri = [LTri;RTri;MTri];

%figure
%subplot(1,2,1)
%imshow(im);
%hold on
%triplot(Tri,X2,Y2);
%interpolation
outIm = bilinear_baycentric_warp(im,Y,X,Y2,X2,Tri);

%subplot(1,2,1)
%imshow(im);

%subplot(1,2,2)
%imshow(outIm);

            
        

function [out_x,out_y,out_x2,out_y2,out_tri] = r_eyebrow_eye_triangles(x_eye,y_eye,x_eyebrow,y_eyebrow)
%exclusively for 8 feature points
%arrange points for manual triangulation
[x_eye,y_eye] = arrange_points(x_eye,y_eye);
[x_eyebrow,y_eyebrow] = arrange_points(x_eyebrow,y_eyebrow);

%finding outer bounds to triangulate outer area of facial feature
bounds_x = [x_eyebrow(1:5);x_eye(5:8);x_eye(1)];
bounds_y = [y_eyebrow(1:5);y_eye(5:8);y_eye(1)];
center = [mean(bounds_x),mean(bounds_y)];
outer_x = 1.3*bounds_x+(1-1.3)*center(1);
outer_y = 1.7*bounds_y+(1-1.7)*center(2);

%x and y coordinates of feature points and outer bound points
out_x = [x_eyebrow;x_eye;outer_x];
out_y = [y_eyebrow;y_eye;outer_y];

%displacement
out_x2 = out_x;
out_y2 = out_y;
out_y2(1:3) = out_y2(1:3) - 8;
out_y2(7:8) = out_y2(7:8) - 8;
out_y2(4:6) = out_y2(4:6) - 5;
out_y2(14:16) = out_y2(14:16) - 2;
out_y2(13) = out_y2(13) - 1;
out_x2(13) = out_x2(13) - 1;

out_tri = [1,2,8;8,2,3;3,7,8;3,7,6;6,4,3;6,4,5;9,10,16;10,16,11;11,15,16;...
          11,15,14;12,14,11;12,14,13;1,9,8;8,10,9;8,10,7;7,11,10;7,11,12;...
          12,6,7;12,6,13;5,13,6;1,17,18;18,2,1;2,18,19;19,3,2;19,3,4;...
          4,20,19;20,4,5;5,21,20;9,26,16;16,25,26;16,25,15;15,24,25;...
          15,24,23;14,23,15;14,23,22;13,22,14;1,9,26;17,26,1;5,13,22;21,22,5];



function [out_x,out_y,out_x2,out_y2,out_tri] = mouth_triangles(x_mouth,y_mouth)
%exclusively for 8 feature points
%arrange points for manual triangulation
[x_mouth,y_mouth] = arrange_points(x_mouth,y_mouth);

%finding outer bounds to triangulate outer area of facial feature
center = [mean(x_mouth),mean(y_mouth)];
outer_x = 1.6*x_mouth+(1-1.6)*center(1);
outer_y = 1.7*y_mouth+(1-1.7)*center(2);
outer_y(2:4) = outer_y(2:4) - 8;
outer_y(6:8) = outer_y(6:8) + 8;

%x and y coordinates of feature points and outer bound points
out_x = [x_mouth;outer_x];
out_y = [y_mouth;outer_y];

%displacement
out_x2 = out_x;
out_y2 = out_y;
out_y2(1) = out_y2(1) - 8;
out_y2(5) = out_y2(5) - 8;
out_x2(1) = out_x2(1) - 4;
out_x2(5) = out_x2(5) + 4;
out_y2(2:4) = out_y2(2:4) - 2;
out_y2(7) = out_y2(7) + 1;
out_y2(6) = out_y2(6) - 1;
out_y2(8) = out_y2(8) - 1;

out_tri = [1,2,8;8,2,3;3,7,8;3,7,6;6,4,3;6,4,5;10,2,1;10,2,11;11,3,2;...
          11,3,4;12,4,11;12,4,5;13,5,12;13,5,14;14,6,5;14,6,7;15,7,14;...
          15,7,16;16,8,7;16,8,1;9,1,16;9,1,10];

function [boo,px,py] = barycentric_coordinates(x,y,outx,outy,inx,iny,tri)
%x y are x and y coordinates
%outx outy are coordinates of each vertex in output triangle
%inx iny are coordinates of each vertex in input triangle
%boo is logical operator returning true(1) if pixel is inside triangle and false(0) if outside triangle
%px py are coordinates based on input triangle

%calculates w1 and w2 to define position of pixel on output triangle
Ax = outx(tri(1));
Bx = outx(tri(2));
Cx = outx(tri(3));
Ay = outy(tri(1));
By = outy(tri(2));
Cy = outy(tri(3));

w1 =( (Ax.*(Cy-Ay)) + ((y-Ay).*(Cx-Ax)) - (x.*(Cy-Ay)) ) ./ ( ((By-Ay).*(Cx-Ax)) - ((Bx-Ax).*(Cy-Ay)) );
w2 =( y-Ay-(w1.*(By-Ay)) ) ./ (Cy-Ay);


%calculates coordinates based on input triangle
A2x = inx(tri(1));
B2x = inx(tri(2));
C2x = inx(tri(3));
A2y = iny(tri(1));
B2y = iny(tri(2));
C2y = iny(tri(3));

px = A2x + (w1.*(B2x-A2x)) + (w2.*(C2x-A2x));
py = A2y + (w1.*(B2y-A2y)) + (w2.*(C2y-A2y));

if w1 >= 0 && w2 >= 0 && (w1+w2) <= 1
    boo = 1;
else
    boo = 0;
end

end
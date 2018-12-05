function outpix = resamplebilinear(im,px,py)
%resample uses bilinear interpolation concept to calculate location to sample pixel value
%im is the source image
%px py are the coordinates of the pixel in original image

%Let r = floor(rf) and c = floor(cf)
sx = floor(px);
sy = floor(py);

%bilinear interpolation concept
%delta_r = rf - r and delta_c = cf - c
delta_x = px - sx;
delta_y = py - sy;

%J(r',c') = I(r,c).(1-delta_r).(1-delta_c) + I(r+1,c).(delta_r).(1-delta_c)+ I(r,c+1).(1-delta_r).(delta_c) + I(r+1,c+1).(delta_r).(delta_c)
outpix = (im(sx,sy).*(1-delta_x).*(1-delta_y)) + (im(sx+1,sy).*delta_x.*(1-delta_y)) + (im(sx,sy+1).*(1-delta_x).*delta_y) + (im(sx+1,sy+1).*delta_x.*delta_y);
end





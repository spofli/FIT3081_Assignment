function wim = bilinear_baycentric_warp(im,inx,iny,outx,outy,tri)
%im is original image
%inx iny is original image feature points
%outx outx is new image feature points
%tri is triangulation of original image feature points

wim = im;

for i = 1: size(wim,1)
    for j = 1:size(wim,2)
        for k = 1:length(tri)
            %barycentric_coordinates to check if pixel is in triangle and find positions
            [inside,px,py] = barycentric_coordinates(i,j,outx,outy,inx,iny,tri(k,:));
            for d = 1:size(wim,3)
                if inside == 1
                    outpix = resamplebilinear(im(:,:,d),px,py);
                    wim(i,j,d) = outpix;
                end
            end
        end
    end
end
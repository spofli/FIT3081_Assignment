function output = displacement(A,B)
%DISPLACEMENT calculates the displacement between ROI feature points A and ROI feature points B
%   A = 8x2 matrix of feature points
%   B = 8x2 matrix of feature points
%   output = 8x2 matrix of feature points displacements
    [rows, cols] = size(A);
    dispVect = A(:,:);
    for i = 1:rows
        for j = 1:cols
            dispVect(i,j) = A(i,j) - B(i,j);
        end
    end
    output = dispVect;
end


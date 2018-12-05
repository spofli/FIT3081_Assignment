function [x_out,y_out] = arrange_points(x,y)
%arranges points to match feature point diagram

x_out = zeros(length(x),1);
y_out = zeros(length(y),1);

xy = [x,y];

%sort based on x values
sorted_xy = sortrows(xy);

x_out(1) = sorted_xy(1,1);
y_out(1) = sorted_xy(1,2);

top = 2;
bottom = length(x);

for i = 2:2:length(x)-2
    if sorted_xy(i,2) <= sorted_xy(i+1,2)
        x_out(top) = sorted_xy(i,1);
        y_out(top) = sorted_xy(i,2);
        x_out(bottom) = sorted_xy(i+1,1);
        y_out(bottom) = sorted_xy(i+1,2);
    else
        x_out(top) = sorted_xy(i+1,1);
        y_out(top) = sorted_xy(i+1,2);
        x_out(bottom) = sorted_xy(i,1);
        y_out(bottom) = sorted_xy(i,2);
    end
    top = top + 1;
    bottom = bottom - 1;
end

x_out(top) = sorted_xy(length(x),1);
y_out(top) = sorted_xy(length(x),2);

end



function [x,y] = splitpoints(p)
x = zeros(length(p),1);
y = zeros(length(p),1);

for i = 1:length(p)
    x(i) = p(i,1);
    y(i) = p(i,2);
end
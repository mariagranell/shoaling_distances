function y = dista (xy)
xy = [1,2;3,4;4,5;5,6;2,3;4,5;6,7;7,8;3,4];
y = pdist(xy);
end

Y = splitapply(@pdist,xy,G)
G = findgroups(g)
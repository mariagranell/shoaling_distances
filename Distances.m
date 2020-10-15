%MATLAB
%upload the data in vectors
	%x = x
	%y = y
	%g = number of the frame

xy = [x,y] %create a matrix of coordinates

G = findgroups(g) %change the number of the frames to 1,2,3...

Y = splitapply(@pdist,xy,G)%for groups of 7 fish-21 collums

labeledImage = bwlabel(bw);
blobMeasurements = regionprops(labeledImage, 'Centroid');
% We can get the centroids of ALL the blobs into 2 arrays,
% one for the centroid x values and one for the centroid y values.
allBlobCentroids = [blobMeasurements.Centroid];
centroidsX = allBlobCentroids(1:2:end-1);
centroidsY = allBlobCentroids(2:2:end);
% Put the labels on the rgb labeled image also.
for k = 1 : numberOfBlobs           % Loop through all blobs.
      plot(centroidsX(k), centroidsY(k), 'b*', 'MarkerSize', 15);
      if k == 1
          hold on;
      end
      text(centroidsX(k) + 10, centroidsY(k),...
           num2str(k), 'FontSize', fontSize, 'FontWeight', 'Bold');
end

I = imread('3.jpg');
BW = imbinarize(I);

unique(d) %gives you the number that are in the matrix

if all(A < 1) %~= not equal
    disp('True')
else
    disp('False')
end

subplot(1,2,1);plot(t,x);y1=ylim        %gets current limits
subplot(1,2,2);plot(t2,x2);ylim(y1)       %sets limits to that of first subplot
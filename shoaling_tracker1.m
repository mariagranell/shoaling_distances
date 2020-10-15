b='1.avi';
vidObj=VideoReader(b);%intialize video object and save info
framerate=floor(vidObj.FrameRate);
totalframes=floor(vidObj.NumberOfFrames);
for i=2:totalframes
vid=read(vidObj,1);%%load frame
%ref=rgb2gray(vid); %% convert to gray %% adjust contrast
level=graythresh(vid); %% calculate threshold
vid=im2bw(vid,level);

end

b='1.avi';
vidObj=VideoReader(b);
thresholdValue = 100;
binaryImage = originalImage > thresholdValue;
vidObj = bwlabel(bw);
blobMeasurements = regionprops(vidObj, 'Centroid');
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

%THIS ONE MAKES IMAGES OF ALL THE FRAMES
b='1.avi';
vidObj=VideoReader(b);%intialize video object and save info
for img = 1:vidObj.NumberOfFrames; %takes form frame 1 to the total number of frames
    filename = strcat('frame',num2str(img), '.jpg');
    a= read (vidObj, img);
    imwrite(a,filename);
    
end

%WITH THIS ONE YOU CAN DECIDE WICH FRAMES
b='1.avi';
vidObj=VideoReader(b);%intialize video object and save info
VidInfo=get(vidObj);
     numberOfFrames = vidObj.NumberOfFrames
     vidHeight = vidObj.Height;
     vidWidth = vidObj.Width;

 % determine which frames are going to be read
 framesToRead = 1:700:numberOfFrames;
 % initialize a matrix for all frames to be read
 allFrames = zeros(vidHeight, vidWidth, 3, length(framesToRead));
 % read in the frames
 for k=1:length(framesToRead)
   frameIdx = framesToRead(k);
   currentFrame   = read(vidObj,frameIdx);
   combinedString = sprintf('%d.jpg',k-1);
   imwrite(currentFrame,combinedString);
   if k==1
       % cast the all frames matrix appropriately
       allFrames = cast(allFrames, class(currentFrame));
   end
 end
 
 
 
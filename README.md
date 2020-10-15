# APPROACHES FOR TRACKING SHOALING BEHAVIOUR

Data analysis during an internship at Ampatzis Lab, Karolinska Institute during August 2019 - October 2019.
This repository contains different approaches for analyzing the data we collected.

Shoaling behaviour presents a great challenge when analyzing the data. In this case we were 
interested understanding the role of the cerebellum in social behaviour, specifically in shoaling in zebrafish. 
For that we tested seven individuals in an open-field test from two different groups, the control and transgenic fishes. 
The transgenic lines presented damages in the Purkinge cells, since encodes Botulinum toxin (BoTx) in all 
Purkinje cells (Tg(aldoca:BoTx-GFP)). 

The data analysis were run in **Matlab**

## Laboratory
Department of Neuroscience, Karolinska Institute, Sweden.

## PROTOCOL

OPEN TANK EXPERIMENT

Seven fish from the same treatment, i.e. control or BoTx were tested. The tank had black walls and contained 500ml of water. 
The fishes were filmed from above for 10 minutes (equal to 14400 frames). The video was trimmed from the frame when 
fish all start moving (not freezing) up to 5 minutes.

### ImageJ
VIDEO TRIMMING

 - Trime to 5 min (from minute 1 to minute 6) 
 - transform in avi
 - upload in ImageJ with 1700 frames _(do not use virtual stack)_
 - crop the very bottom of the tank
 - resize to 796 pixels*

VIDEO PREPARATION

Firstly, is necessary to remove the background. For it I added the following code in *ImageJ*  to create a macro.

In ImageJ, click on:

``` {r setup, include=T}
Dev--> Record--->copy/paste*--->Create--*new window'-->Run
```
And paste THIS CODE:
``` {r setup, include=T}
avi = getImageID;
run("32-bit");
run("Z Project...", "projection=Median"); 
median = getImageID;
imageCalculator("Subtract stack", avi, median);
run("8-bit");run("script:Macro.ijm.ijm");
selectWindow("MED_AB2.avi");
selectWindow("AB2.avi");
selectWindow("MED_AB2.avi");
close();
selectWindow("AB2.avi");
close();
```
Secondly, I determined the contrast, threshold and image inversion to detekt the fish as white:
``` {r setup, include=T}
Click on Image--> Adjust--> Brightness/contrast--> set the contrast very very low (apply all), even when you can not see it.
Click on Image--> Adjust--> Threshold--> set the threshold it again pretty low, in all images BUT DONT ALLOW TO "calculate the threshold for each frame".
Click on edit and invert the image.---> save as .avi
```
Thirdly, I set up the coordinates by asking for the centroid and I runned the particles:
``` {r setup, include=T}
Click in Analyze--> Measure--> click on the open window--> Results-> set measurements--> centroid + Display label + invert y coordinate. 
Analyze--> Analyze particles. Put between 10-100 the size of the blobs, to show Elipses. Display results + clear results + exclude on edges + Include holes.
```
This procedure gave as an input a matrix of coordinates, I transferred them to excell (copy-paste). 

### Excell
In the excell file I removed all collumns but the name of the frame and x and y coordinates. 
Then I putted the column of the label with just the number of seconds by using replace (thing you want to replace) and nothing. 
Last but not least I changed the . into a ,

Afterwards, I uploaded them in **Matlab** as column vectors. 
I called: the second of the frame, g; x coordinate, x and y coordinate, y. 
Afterwards I opened the document Distances.m and run it. 
You will have your data in the Summary matrix (with a mean row and a median row).


For extra help in how to remove the background in ImageJ please check:
 - http://www.petercollingridge.co.uk/blog/removing-background-avi-using-imagej/
 - https://www.youtube.com/watch?v=1oVdARMAH74

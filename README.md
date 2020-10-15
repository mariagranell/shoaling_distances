# THE ROLE OF TELENCEPHALON SIZE IN COGNITION IN THE GUPPY _(Poecilia reticulata)_

Data analysis of my Master thesis project, done at Stockholm University  during Autumn 2019 - Autumn 2020.
Statistical analyses of five different cognitive test:
 - problem-solving
 - reversal learning
 - spatial learning
 - short-term memory
 - long-term memory

All analyses were performed with software R (v.3.6.1)

## ABSTRACT

The dramatic expansion of telencephalon in large-brained species has caused great attention as the neural substrate of cognitive evolution. Previously, lesion studies have linked the telencephalon with highly demanding behaviours, and comparative studies have associated telencephalon size or telencephalon structures with cognitive abilities. While there is a great number of studies using comparative and lesion approaches examining this matter, both practices have limitations. Thus, here I used artificially selected female guppies for relative telencephalon size to experimentally test the evolutionary effect of telencephalon size on cognition. The females were tested for three different experiments, problem-solving in a detour-task, colour-cued reversal learning and spatial learning. The effect of relative telencephalon size was only detected for problem-solving and spatial learning, suggesting a lesser involvement of the telencephalon in cued reversal learning tasks. Unexpectedly, fish with smaller telencephalon out-performed fish with larger telencephalon for all the significant differences found. Possible explanations for these findings are discussed. This study implies a more complex relationship between telencephalon size variation and cognitive abilities than previously suggested. Future experiments should focus on fine-scale structural differences with holistic approaches of the brain to fully understand the differences in cognitive abilities between the telencephalon selection lines.

## Laboratory
Zoology department, Stockholm University, Sweden.

## PROTOCOL

OPEN TANK EXPERIMENT

Seven fish from the same treatment, i.e. control or BoTx were tested. The tank had black walls and contained 500ml of water. 
The fishes were filmed from above for 10 minutes (equal to 14400 frames). The video was trimmed from the frame when 
fish all start moving (not freezing) up to 5 minutes.

###ImageJ
VIDEO TRIMMING

 - Trime to 5 min (from minute 1 to minute 6) 
 - transform in avi
 - upload in ImageJ with 1700 frames _(do not use virtual stack)_
 - crop the very bottom of the tank
 - resize to 796 pixels*

VIDEO PREPARATION

Firstly, is necessary to remove the background. For it I added the following code in _ImageJ_  to create a macro.

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

###Excell
In the excell file I removed all collumns but the name of the frame and x and y coordinates. 
Then I putted the column of the label with just the number of seconds by using replace (thing you want to replace) and nothing. 
Last but not least I changed the . into a ,

Afterwards, I uploaded them in _Matlab_ as column vectors. 
I called: the second of the frame, g; x coordinate, x and y coordinate, y. 
Afterwards I opened the document Distances.m and run it. 
You will have your data in the Summary matrix. (and in mean row and median row).


For extra help in how to remove the background in ImageJ please check:
 - http://www.petercollingridge.co.uk/blog/removing-background-avi-using-imagej/
 - https://www.youtube.com/watch?v=1oVdARMAH74

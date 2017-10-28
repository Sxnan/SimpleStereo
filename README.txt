SimpleStereo

There are four main routines that can run individually. All of them take input dataset from ./imgs. 
For example, motorcycle dataset will be in ./imgs/motorcycle.
Make sure you have im0.png im1.png im1E.png im1L.png calib.txt disp0.pfm for each dataset at its subfolder.
And save the result at ./result.

NCC_main.m - compute disparity using ncc patch matching
SSD_main.m - compute disparity using ssd patch matching
corr_main.m - compute disparity using raw cross corrletaion patch matching
DP_main.m - compute disparity using dynamic programing

To do quantitative evaluation, run quantitative_evaluation.m
It will take the result in the result folder and compute the root mean square to the groud true.

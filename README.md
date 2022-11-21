# WuLabScripts


This repository is a central hub for sharing bioinformatic scripts developed by [Sihan Wu lab](https://github.com/sihanwusean/sihanwulab). 

# Table of contents


### :point_right: [splitRGBtiff/split_RGB_channels_and_save_as_greyscale_tiff.R](https://github.com/sihanwusean/WuLabScripts/tree/main/splitRGBtiff)


An R script to split RGB channels of tif/tiff images in a folder and save each channel into greyscale tif/tiff with LZW compression.


<img src="https://github.com/sihanwusean/WuLabScripts/blob/main/splitRGBtiff/example.png" width="70%">


### :point_right: [processImageJcolocal/process_ImageJ_colocalization.R](https://github.com/sihanwusean/WuLabScripts/tree/main/processImageJcolocal)


An R script to analyze pixel colocalization downstream of ImageJ surface plot output. To perform pixel colocalization analysis, an RGB image is converted into single-channel, greyscale (8-bit) images. Then in ImageJ, draw an ROI and run surface plot analysis to get pixel coordinates and corresponding pixel intensity for each channel (2 channels) and save as txt files. Finally, this script will automatically process these txt files to generate density plot in PDF and report Pearson correlation coefficient and P-value. Please read example file for detailed tutorial. 


<img src="https://github.com/sihanwusean/WuLabScripts/blob/main/processImageJcolocal/example.png" width="70%">
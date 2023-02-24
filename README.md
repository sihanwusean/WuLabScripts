# WuLabScripts


This repository is a central hub for sharing bioinformatic scripts developed by [Sihan Wu lab](https://github.com/sihanwusean/sihanwulab). 

# Table of contents

## Data processing, analysis, and visualization

### :point_right: [MultiwellMapper/multiwell_mapper.R](https://github.com/sihanwusean/WuLabScripts/tree/main/MultiwellMapper)


Oftentimes in multi-well experiment, such as cell viability reading in compound screening assay, we obtain data from a micro-plate reader displayed in an Excel sheet organizing data points as in a multi-well plate layout. However, for downstream data analysis, we need to know the sample information of each well. This R script can quickly map data points to corresponding sample information and generate a data analysis-friendly table, which is useful for high-throughput experiment (compound screening, RNAi array screening, etc.). 


<img src="https://github.com/sihanwusean/WuLabScripts/blob/main/MultiwellMapper/example.png" width="80%">


## Image processing and analysis

### :point_right: [splitRGBtiff/split_RGB_channels_and_save_as_greyscale_tiff.R](https://github.com/sihanwusean/WuLabScripts/tree/main/splitRGBtiff)


An R script to split RGB channels of tif/tiff images in a folder and save each channel into greyscale tif/tiff with LZW compression.


<img src="https://github.com/sihanwusean/WuLabScripts/blob/main/splitRGBtiff/example.png" width="80%">


### :point_right: [processImageJcolocal/process_ImageJ_colocalization.R](https://github.com/sihanwusean/WuLabScripts/tree/main/processImageJcolocal)


An R script to analyze pixel colocalization downstream of ImageJ surface plot output. To perform pixel colocalization analysis, an RGB image is converted into single-channel, greyscale (8-bit) images. Then in ImageJ, draw an ROI and run surface plot analysis to get pixel coordinates and corresponding pixel intensity for each channel (2 channels) and save as txt files. Finally, this script will automatically process these txt files to generate density plot in PDF and report Pearson correlation coefficient and P-value. Please read example file for detailed tutorial. 


<img src="https://github.com/sihanwusean/WuLabScripts/blob/main/processImageJcolocal/example.png" width="80%">


## NGS related scripts

### :point_right: [tx2genesFromGTF/make_tx2genes_from_gtf.txt](https://github.com/sihanwusean/WuLabScripts/tree/main/tx2genesFromGTF)


Simple command lines to make a transcripts-to-genes (tx2genes.csv) mapping file for downstream analysis from a GTF file. This mapping file is usually required for many RNA-seq related analyses, such as in the "tximport" step in the DESeq2 pipeline. This repo contains a pre-made [tx2genes_gencode.v42.csv](https://github.com/sihanwusean/WuLabScripts/tree/main/tx2geneFromGTF/tx2genes_gencode.v42.csv) generated from a human gencode.v42 GTF.
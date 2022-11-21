# Developed by Sihan Wu lab https://github.com/sihanwusean/sihanwulab, https://github.com/sihanwusean/WuLabScripts
# Last update: 20221121

# This script splits RGB channels of tif/tiff images in a folder and save each channel into greyscale tif/tiff with LZW compression.
# Please install "imager" and "raster" R packages.
# Please install ImageMagick to support tiff processing https://imagemagick.org/script/download.php
# Please install dependent R Package "spatstat.geom" and "terra"

library(imager)
library(raster)

ls = list.files(pattern = "*.\\.tif.*$")

for (i in 1:length(ls)) {
  img = load.image(ls[i])
  
  # Split channels
  channel = imsplit(img, "c")
  red = channel$`c = 1`
  green = channel$`c = 2`
  blue = channel$`c = 3`
  
  # Turn cimg to object then raster
  red = raster(cimg2im(red))
  green = raster(cimg2im(green))
  blue = raster(cimg2im(blue))
  
  # Save each channels into greyscale tiff with LZW compression
  basename = tools::file_path_sans_ext(ls[i])
  ext = tools::file_ext(ls[i])
  writeRaster(red, paste0(basename, "_red.", ext), options = "COMPRESS=LZW")
  writeRaster(green, paste0(basename, "_green.", ext), options = "COMPRESS=LZW")
  writeRaster(blue, paste0(basename, "_blue.", ext), options = "COMPRESS=LZW")
}

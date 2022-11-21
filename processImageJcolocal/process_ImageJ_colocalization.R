# Developed by Sihan Wu lab https://github.com/sihanwusean/sihanwulab, https://github.com/sihanwusean/WuLabScripts
# Last update: 20221121

# This script can read a list files from ImageJ surface plot output, which contain XY coordinates and pixel intensity, and perform Pearson correlation test for two channels to quantify signal colocalization. A density plot output as PDF will be generated for each sample, and a summary table will aggregate all sample's Pearson stats.
# Please install "data.table", "dplyr", "stingr", "ggplot2", and "cowplot" R packages.

library(data.table)
library(dplyr)
library(stringr)
library(ggplot2)
library(cowplot)

# Read txt files with XY coordinates and pixel intensity
ls <- list.files(pattern = "\\.txt$")

# Initiate a data frame to record stats from each sample
report = data.frame(sample_name = character(), pearson_coefficent = numeric(), pearson_p_value = numeric(), stringsAsFactors = F)

for (i in seq(1, length(ls), 2)) {
  # Get sample name and channel names
  sample.name = str_extract(ls[i], ".+?(?=_)")
  channel1.name = str_extract(ls[i], "(?<=_).+(?=\\.txt)")
  channel2.name = str_extract(ls[i+1], "(?<=_).+(?=\\.txt)")
  channel1 = fread(ls[i])
  channel2 = fread(ls[i+1])
  # Use x,y as unique IDs for inner_join
  channel1$coord = paste(channel1$V1, channel1$V2, sep = ",")
  channel2$coord = paste(channel2$V1, channel2$V2, sep = ",")
  channel1 = select(channel1, 3:4)
  channel2 = select(channel2, 3:4)
  colnames(channel1)[1] = channel1.name
  colnames(channel2)[1] = channel2.name
  join = inner_join(channel1, channel2)
  join = filter(join, if_all(c(1, 3), ~ . > 0))
  # Pearson test and plot density plot
  # Assuming input images are 8-bit with a greyscale of [0, 255]
  pearson = cor.test(unlist(join[,1]), unlist(join[,3]))
  label = substitute(paste("r = ", estimate, ", P = ", pvalue), list(estimate = signif(pearson$estimate, 2), pvalue = format(pearson$p.value, digits = 2), scientific = T))
  join %>% ggplot(aes(x = .[[1]], y = .[[3]])) +
    stat_density_2d(aes(fill = after_stat(level)), geom = "polygon", n = 100) +
    scale_fill_distiller(palette="OrRd", direction = 1) +
    scale_x_continuous(limits = c(0,255), expand = c(0,0)) +
    scale_y_continuous(limits = c(0,255), expand = c(0,0)) +
    draw_label(label, x = 190, y = 15, fontface = "bold", size = 20) +
    labs(x = channel1.name, y= channel2.name, title = sample.name) +
    guides(fill = "none") +
    theme_cowplot()
  ggsave2(paste0(sample.name, "_", channel1.name, "_", channel2.name, "_pearson.pdf"), device = "pdf")
  # Append stats to report table
  output = c(sample.name, pearson$estimate, pearson$p.value)
  report[nrow(report)+1, ] = output
  fwrite(report, paste0(channel1.name, "_", channel2.name, "_aggregated_pearson.tsv"), sep = "\t")
}
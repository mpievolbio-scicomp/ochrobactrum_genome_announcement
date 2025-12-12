# Load libraries
library('ggcorrheatmap')
library('reshape2')
library('ggplot2')

# Read data
data <- read.csv("FastANI_Results_clean.csv", stringsAsFactors = FALSE)

# Reshape into square matrix
data_matrix <- dcast(data, QUERY ~ REFERENCE, value.var = "ANI_ESTIMATE")

# Remove the QUERY column which is now row names 
heatmap_data <- as.matrix(data_matrix[, -1])  

# Set QUERY as row names
rownames(heatmap_data) <- data_matrix$QUERY

# Scale to 0 < ANI < 1.
heatmap_data <- heatmap_data * 0.01

# Plot heatmap
gghm(heatmap_data,
     layout='topleft',
     col_scale='YlGnBu',
     bins=5,
     na_remove=TRUE,
     cell_labels=TRUE,
     cluster_rows=TRUE,
     cluster_cols=TRUE,
     show_dend_rows=FALSE,
     show_dend_cols=FALSE,
     cell_label_digits=3,
     dend_height=0.0,
     legend_order=NA,
     cell_label_size=6,
     ) + theme(axis.text.x = element_text(size=18), axis.text.y = element_text(size=18))
ggsave('ani_heatmap.pdf', dpi=600)
ggsave('ani_heatmap.png', dpi=150)

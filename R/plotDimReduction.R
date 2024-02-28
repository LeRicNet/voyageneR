plotDimReduction <- function(
    reduction = 'umap',
    color_by = 'celltypes'
    ) {
  dim_reduction <- data.frame(
    'Dim1' = as.data.frame(acp_sn_umap)$UMAP_1,
    'Dim2' = as.data.frame(acp_sn_umap)$UMAP_2,
    'category' = acp_sn_meta[,color_by],
    'color' = .buildColorRamp(color_by)
  )
  return(
    dim_reduction
  )
}

.buildColorRamp <- function(color_by) {
  original_colors <- c("red", "blue")
  color_palet <- colorRampPalette(original_colors)
  color_index <- as.integer(as.factor(acp_sn_meta[,color_by]))
  colors <- color_palet(max(color_index))
  return(colors[color_index])
}

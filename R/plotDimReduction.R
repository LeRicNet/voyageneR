plotDimReduction <- function() {

  # Make Color Ramp
  original_colors <- c("red", "blue")
  color_palet <- colorRampPalette(original_colors)
  color_index <- as.integer(as.factor(acp_sn_meta$celltypes))
  colors <- color_palet(max(color_index))

  dim_reduction <- data.frame(
    'UMAP1' = as.data.frame(acp_sn_umap)$UMAP_1,
    'UMAP2' = as.data.frame(acp_sn_umap)$UMAP_2,
    'category' = acp_sn_meta$celltypes,
    'color' = colors[color_index]
  )
  return(
    dim_reduction
  )
}

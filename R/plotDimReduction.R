plotDimReduction <- function() {
  dim_reduction <- data.frame(
    'UMAP1' = as.data.frame(acp_sn_umap)$UMAP_1,
    'UMAP2' = as.data.frame(acp_sn_umap)$UMAP_2
  )
  return(
    dim_reduction
  )
}

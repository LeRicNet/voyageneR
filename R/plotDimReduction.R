plotDimReduction <- function() {
  acp_sn_umap <- data('acp_sn_umap')
  dim_reduction <- data.frame(
    'UMAP1' = as.numeric(acp_sn_umap[,1]),
    'UMAP2' = as.numeric(acp_sn_umap[,2])
  )
  return(
    dim_reduction
  )
}

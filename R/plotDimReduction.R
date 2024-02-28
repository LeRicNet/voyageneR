plotDimReduction <- function() {
  dim_reduction <- data.frame(
    'UMAP1' = c(1,2,3),
    'UMAP2' = c(2,4,6)
  )
  return(
    jsonlite::toJSON(
      dim_reduction
    )
  )
}

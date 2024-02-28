#' Plot Dimension Reduction
#'
#' This function creates a data frame for plotting dimension reduction methods
#' such as UMAP or t-SNE.
#'
#' @param reduction A character string specifying the type of dimension reduction
#'  to plot. Default is 'umap'.
#' @param color_by A character string specifying the variable in the metadata
#' to color cells by. Default is 'celltypes'.
#'
#' @return A data frame with columns 'Dim1', 'Dim2', 'category', and 'color'.
#'  'Dim1' and 'Dim2' correspond to the two dimensions of the UMAP plot.
#'   'category' corresponds to the cell type or other category specified
#'   by 'color_by'. 'color' is determined by the .buildColorRamp function.
#'
#' @examples
#' plotDimReduction(reduction = 'umap', color_by = 'celltypes')
#'
#' @export
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

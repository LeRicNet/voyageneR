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
  # choose the right category
  if (color_by %in% colnames(acp_sn_meta)) {
    category = acp_sn_meta[,color_by]
  } else if (color_by %in% available_genes) {
    category = expression_matrix[color_by,]
  }

  dim_reduction <- data.frame(
    'Dim1' = as.data.frame(acp_sn_umap)$UMAP_1,
    'Dim2' = as.data.frame(acp_sn_umap)$UMAP_2,
    'category' = category,
    'color' = .buildColorRamp(color_by)
  )
  return(
    dim_reduction
  )
}

# .buildColorRamp <- function(color_by) {
#   if (color_by %in% available_genes) {
#     original_colors <- c("red", "blue")
#     color_palet <- colorRampPalette(original_colors)
#     color_index <- as.integer(as.factor(expression_matrix[color_by,]))
#     colors <- color_palet(max(color_index))
#     return(colors[color_index])
#   } else if (color_by %in% colnames(acp_sn_meta)) {
#     original_colors <- c("green", "orange")
#     color_palet <- colorRampPalette(original_colors)
#     color_index <- as.integer(as.factor(acp_sn_meta[,color_by]))
#     colors <- color_palet(max(color_index))
#     return(colors[color_index])
#   }
# }

plotViolin <- function(
    split_by = 'celltypes',
    color_by = 'SPP1'
) {
  value = expression_matrix[color_by,]

  plot_data <- data.frame(
    'x' = acp_sn_meta[,split_by],
    'y' = value,
    'color' = .buildColorRamp(color_by)
  )
  return(
    plot_data
  )
}

.buildColorRamp <- function(color_by) {
  if (color_by %in% available_genes) {
    # Use a more visually appealing color scheme from RColorBrewer
    original_colors <- RColorBrewer::brewer.pal(9, "YlOrRd")  # Yellow-Orange-Red palette
    color_palet <- colorRampPalette(original_colors)
    color_index <- as.integer(as.factor(expression_matrix[color_by,]))
    colors <- color_palet(max(color_index))
    return(colors[color_index])
  } else if (color_by %in% colnames(acp_sn_meta)) {
    # Use categorical colors from RColorBrewer
    original_colors <- RColorBrewer::brewer.pal(8, "Set1")  # Set1 palette for distinct categories
    color_index <- as.integer(as.factor(acp_sn_meta[, color_by]))
    colors <- original_colors[color_index]
    return(colors)
  }
}

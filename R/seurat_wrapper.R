library(R6)
library(Seurat)

# Define a global environment to store the Seurat object
if (!exists("seurat_env", envir = .GlobalEnv)) {
  .GlobalEnv$seurat_env <- new.env()
}


# Define the SeuratClass
SeuratClass <- R6Class("SeuratClass",
                       public = list(
                         seurat_object = NULL,

                         initialize = function(seurat_object) {
                           if (!inherits(seurat_object, "Seurat")) {
                             stop("The provided object is not a Seurat object.")
                           }
                           self$seurat_object <- seurat_object
                         },

                         getIdentities = function() {
                           if (is.null(self$seurat_object)) {
                             stop("Seurat object is not initialized.")
                           }
                           return(Idents(self$seurat_object))
                         }
                       )
)

# Function to create an instance and store it in the persistent environment
initialize_seurat <- function() {
  seurat_obj <- loadSeuratObject()
  seurat_instance <- SeuratClass$new(seurat_obj)
  assign("seurat_instance", seurat_instance, envir = .GlobalEnv$seurat_env)
  return("Session initialized")
}

# Function to get identities using the persistent session
get_seurat_identities <- function() {
  if (!exists("seurat_instance", envir = .GlobalEnv$seurat_env)) {
    stop("Seurat instance not found. Initialize the session first.")
  }
  seurat_instance <- get("seurat_instance", envir = .GlobalEnv$seurat_env)
  return(seurat_instance$getIdentities())
}

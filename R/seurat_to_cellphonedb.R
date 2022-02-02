#' Add together two numbers
#' @export
#' @param x A number.
#' @param y A number.
#' @return The sum of \code{x} and \code{y}.
#' @examples
#' add(1, 1)
#' add(10, 1)

# Seurat object to CellPhoneDB
seurat_to_cellphonedb<-function(data_object){
  # take raw data and normalise it
  count_raw <- data_object@raw.data[,data_object@cell.names]
  count_norm <- apply(count_raw, 2, function(x) (x/sum(x))*10000)
  write.table(count_norm, 'counts.txt', sep='\t', quote=F)
  
  #=========================================================
  # generating meta file
  meta_data <- cbind(rownames(data_object@meta.data), data_object@meta.data[,'cluster', drop=F])   #####  cluster is the user’s specific cluster column
  write.table(meta_data, 'meta.txt', sep='\t', quote=F, row.names=F)
  return(meta_data)
  
}


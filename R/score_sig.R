
#' Add together two numbers
#' 
#' @param x A number.
#' @param y A number.
#' @return The sum of \code{x} and \code{y}.
#' @examples
#' add(1, 1)
#' add(10, 1)
score_sig<-function(seurat){
  #===========================================================
  DefaultAssay(seurat)<-"RNA"
  seurat<-NormalizeData(seurat)
  seurat<-ScaleData(seurat)#,vars.to.regress = "Patient")
  ex<-as.matrix(GetAssayData(object = seurat,assay = "RNA"))
  sampInfo<-data.frame(seurat@meta.data)
  genes<-rownames(seurat)
  featInfo<-data.frame(SYMBOLS=genes)
  dataset <- list(ex = ex,
                  featInfo = featInfo,
                  sampInfo = sampInfo
  )
  #rm(ex)
  #===========================================================
  expression <- as.matrix(dataset$ex)
  dataset$featInfo$gene_short_name<-(dataset$featInfo$SYMBOLS)
  genes <- dataset$featInfo
  samples <- (dataset$sampInfo)
  remove("dataset")
  samples$note <- " "
  for(i in names(gene_lists)){
    this_gene_list <- gene_lists[[i]]
    if(class(this_gene_list) %in% "data.frame"){
      tmp.symbols <- this_gene_list[,1]
      tmp.type <- as.character(this_gene_list[,2])
    }else{
      tmp.symbols <- this_gene_list
      tmp.type = rep(x = i,times = length(this_gene_list))
    }
    tmp.indexes <- match(table = genes$gene_short_name , x = tmp.symbols)
    tmp.symbols <- subset(tmp.symbols,!is.na(tmp.indexes))
    tmp.type <- subset(tmp.type,!is.na(tmp.indexes))
    tmp.indexes <- subset(tmp.indexes,!is.na(tmp.indexes))
    samples[i] <- colMeans((expression[tmp.indexes,,drop=FALSE]),na.rm = TRUE)
    genes[i] <- ""
    genes[tmp.indexes,i] <- tmp.type
    genes[i] <- as.factor(genes[[i]])
  }
  rm("this_gene_list","i","tmp.symbols","tmp.type","tmp.indexes","ex","data")
  samplesToPlot <- which((!samples$note %in% "OK"))
  
  df<-seurat
  dim(df)
  print(dim(df))
  meta1<-seurat@meta.data
  print(dim(meta1))
  
  meta2<-samples[,(dim(meta1)[2]):dim(samples)[2]]
  df@meta.data<-cbind(df@meta.data,meta2)
  DefaultAssay(seurat)<-"SCT"
  
  rm("meta1","meta2")
  return(df)
}


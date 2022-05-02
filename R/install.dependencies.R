message("Ensuring appropriate install of all dependencies from both CRAN and BioConductor")
if (!require("data.table")) {
  install.packages("data.table",repos="http://cran.rstudio.com/")
}
if (!require("Seurat")) {
  install.packages("Seurat")
}
if (!require("BiocManager")) {
  install.packages("BiocManager",repos="http://cran.rstudio.com/")
}
if (!require("EnrichmentBrowser")) {
  BiocManager::install("EnrichmentBrowser")
}
message("scOh dependency install complete")

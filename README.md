## Single Cell Atlas - PDAC 
### Integrated Analysis of the Tumor Microenvironment (TME)
Supplementary repository of data, analysis and code.  

Abstract: Bulk analyses of pancreatic ductal adenocarcinoma (PDAC) samples are complicated by the tumor microenvironment (TME), i.e. signals from fibroblasts, endocrine, exocrine, and immune cells. Despite this, we and others have established tumor and stroma subtypes with prognostic significance. However, understanding of underlying signals driving distinct immune and stromal landscapes is still incomplete. Here we integrate 92 single cell RNA-seq samples from seven independent studies to build a reproducible PDAC atlas with a focus on tumor-TME interdependence. Patients with activated stroma are synonymous with higher myofibroblastic and immunogenic fibroblasts, and furthermore show increased M2-like macrophages and regulatory T-cells. Contrastingly, patients with ‘normal’ stroma show M1-like recruitment, elevated effector and exhausted T-cells. To aid interoperability of future studies, we provide a pretrained cell type classifier and an atlas of subtype-based signaling factors that we also validate in mouse data. Ultimately, this work leverages the heterogeneity among single-cell studies to create a comprehensive view of the orchestra of signaling interactions governing PDAC.

Published Manuscript: https://www.nature.com/articles/s41467-023-40895-6

***
### 1). **PDAC Atlas Data**   
    * Seurat Objects [Cell Type 1] (.rds)
      - Stroma (PSC/CAF) (4.1 Gb)
            wget http://pdacR.bmi.stonybrook.edu/scRNA/Stroma_Subset2021.rds
      - Myeloid (2.8 Gb)
            wget http://pdacR.bmi.stonybrook.edu/scRNA/Myeloid_Subset2021.rds
      - Lymphocytes (6 Gb)
            wget http://pdacR.bmi.stonybrook.edu/scRNA/Lymphocytes_Subset2021.rds
      - Epithelium (5.6 Gb)
            wget http://pdacR.bmi.stonybrook.edu/scRNA/Epi_Subset2021.rds
      - Endothelium (1.4 Gb)
            wget http://pdacR.bmi.stonybrook.edu/scRNA/Endo_Subset2021.rds
***     
### 2). **Supplementary Tables**
    * Table 1: Subpopulation DEG Output 
    * Table 2: Pan-TME DEG Output
    * Table 3: Expanded gene signature table
    * Table 4: Dataset Metadata
***
### 3). **Single Cell Classifier**
    * Trained RandomForest Classifier (.rds)    
    * Vignette 
***   

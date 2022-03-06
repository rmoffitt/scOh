
library(EnrichmentBrowser)

# Expand gene list (manually curated)
#------------------------------------------------------------------------------
wiki <- getGenesets(org = "hsa", db = "msigdb",cat="C2",sub="WIKIPATHWAYS" , gene.id.type = "SYMBOL")
names(wiki)
go.gs <- getGenesets(org = "hsa", db = "go", onto = "BP", mode = "GO.db",gene.id.type = "SYMBOL")
hall.gs <- getGenesets(org = "hsa", db = "msigdb", cat = "H",gene.id.type = "SYMBOL")
kegg.gs <- getGenesets(org = "hsa", db = "kegg",gene.id.type = "SYMBOL")
react<- getGenesets(org = "hsa", db = "msigdb", cat = "C2",sub="REACTOME",gene.id.type = "SYMBOL")
#------------------------------------------------------------------------------
gene_lists$TILbc<-c("FPR1", "CIITA", "KLRC1", "TNFRSF6B", "WFIKKN1")#from bladder cancer https://www.nature.com/articles/s41598-021-96373-w?proof=t+target%3D
gene_lists$TILcc<-c("CEBPB", "CXCL9", "IRF8", "ITGB1","LAG3","MCFD2","PSMD11","RNASE7","SPARC","TAP2") # https://doi.org/10.3389/fimmu.2020.01678
gene_lists$TILPred<-c("HLF","CXCL13","SULT1E1","GBP1")#10.1093/annonc/mdx691
#more TIL after chemo = Good, signature Predicts if patient will have > TIL
gene_lists$WNT.Signaling<-kegg.gs[160]$hsa04310_Wnt_signaling_pathway
gene_lists$TGFB.Signaling<-kegg.gs[163]$`hsa04350_TGF-beta_signaling_pathway`
gene_lists$Notch.Signaling<-kegg.gs[161]$hsa04330_Notch_signaling_pathway
gene_lists$HH.Signaling<-kegg.gs[162]$hsa04340_Hedgehog_signaling_pathway
gene_lists$PD1.Signaling<-kegg.gs[330]$`hsa05235_PD-L1_expression_and_PD-1_checkpoint_pathway_in_cancer`
gene_lists$Est.Signaling<-kegg.gs[223]$hsa04915_Estrogen_signaling_pathway
gene_lists$VEGF.Signaling<-kegg.gs[165]$hsa04370_VEGF_signaling_pathway
gene_lists$TNF.Signaling<-kegg.gs[197]$hsa04668_TNF_signaling_pathway
gene_lists$Est.Signaling<-kegg.gs[223]$hsa04915_Estrogen_signaling_pathway
gene_lists$Oxy.Signaling<-kegg.gs[229]$hsa04921_Oxytocin_signaling_pathway
gene_lists$JakStat.Signaling<-kegg.gs[187]$`hsa04630_JAK-STAT_signaling_pathway`
gene_lists$APP<-kegg.gs[179]$hsa04612_Antigen_processing_and_presentation
gene_lists$IL17.Signaling<-kegg.gs[190]$`hsa04657_IL-17_signaling_pathway`
gene_lists$Th17diff<-kegg.gs[192]$hsa04659_Th17_cell_differentiation
gene_lists$TEM<-kegg.gs[198]$hsa04670_Leukocyte_transendothelial_migration
gene_lists$DAP12<-react[419]$M27171_REACTOME_DAP12_SIGNALING
gene_lists$IFNG_Response<-hall.gs[19]$M5913_HALLMARK_INTERFERON_GAMMA_RESPONSE
gene_lists$Sphingo<-kegg.gs[59]$hsa00600_Sphingolipid_metabolism
gene_lists$SphingoSig<-kegg.gs[130]$hsa04071_Sphingolipid_signaling_pathway
gene_lists$PI3K_Akt<-kegg.gs[148]$`hsa04151_PI3K-Akt_signaling_pathway`
gene_lists$Senescence<-kegg.gs[156]$hsa04218_Cellular_senescence
gene_lists$ErbB<-kegg.gs[117]$hsa04012_ErbB_signaling_pathway
gene_lists$MAPK<-wiki$M39594_WP_MAPK_CASCADE
gene_lists$crossPres<-react[217]$M26926_REACTOME_CROSS_PRESENTATION_OF_PARTICULATE_EXOGENOUS_ANTIGENS_PHAGOSOMES
gene_lists$Ras<-kegg.gs[118]$hsa04014_Ras_signaling_pathway
gene_lists$p53<-kegg.gs[135]$hsa04115_p53_signaling_pathway
gene_lists$NfkbSig<-kegg.gs[126]$`hsa04064_NF-kappa_B_signaling_pathway`
gene_lists$PPAR<-kegg.gs[109]$hsa03320_PPAR_signaling_pathway
gene_lists$HIF1<-kegg.gs[127]$`hsa04066_HIF-1_signaling_pathway`
gene_lists$NKCytotoxic<-kegg.gs[189]$hsa04650_Natural_killer_cell_mediated_cytotoxicity
gene_lists$p53<-kegg.gs[135]$hsa04115_p53_signaling_pathway
gene_lists$MMP<-react[257]$M26976_REACTOME_ACTIVATION_OF_MATRIX_METALLOPROTEINASES
gene_lists$IL4Sig<-wiki[397]$M39720_WP_IL4_SIGNALING_PATHWAY
gene_lists$IL3Sig<-wiki[399]$M39722_WP_IL3_SIGNALING_PATHWAY
gene_lists$IL2Sig<-wiki[213]$M39536_WP_IL2_SIGNALING_PATHWAY
gene_lists$IL1Sig<-wiki$M39346_WP_IL1_SIGNALING_PATHWAY
gene_lists$IL6Sig<-wiki$M39656_WP_IL6_SIGNALING_PATHWAY
gene_lists$IL10AntiInflam<-wiki$M39796_WP_IL10_ANTIINFLAMMATORY_SIGNALING_PATHWAY
gene_lists$IL15Sig<-react$M27858_REACTOME_INTERLEUKIN_15_SIGNALING
gene_lists$oxphos<-wiki[114]$M39436_WP_OXIDATIVE_PHOSPHORYLATION
gene_lists$ppp<-kegg.gs$hsa00030_Pentose_phosphate_pathway
gene_lists$comp<-kegg.gs$hsa04610_Complement_and_coagulation_cascades
gene_lists$tlr<-kegg.gs$`hsa04620_Toll-like_receptor_signaling_pathway`
gene_lists$ret<-kegg.gs$hsa00830_Retinol_metabolism
gene_lists$mmRepair<-kegg.gs$hsa03430_Mismatch_repair
gene_lists$beRepair<-kegg.gs$hsa03410_Base_excision_repair
gene_lists$neRepair<-kegg.gs$hsa03420_Nucleotide_excision_repair
gene_lists$lipid<-wiki$M39762_WP_LIPID_METABOLISM_PATHWAY
gene_lists$cholesterol<-wiki$M39608_WP_CHOLESTEROL_BIOSYNTHESIS_PATHWAY
gene_lists$pd1_block<-wiki$M39843_WP_CANCER_IMMUNOTHERAPY_BY_PD1_BLOCKADE
gene_lists$ctla4Block<-wiki$M39840_WP_CANCER_IMMUNOTHERAPY_BY_CTLA4_BLOCKADE
gene_lists$parathryoid<-kegg.gs$`hsa04928_Parathyroid_hormone_synthesis_secretion_and_action`
gene_lists$splice<-kegg.gs$hsa03040_Spliceosome
gene_lists$ubi<-kegg.gs$hsa04120_Ubiquitin_mediated_proteolysis
gene_lists$TCR<-kegg.gs$hsa04660_T_cell_receptor_signaling_pathway
gene_lists$proteosome<-kegg.gs$hsa03050_Proteasome
gene_lists$TSLPSig<-wiki$M39380_WP_THYMIC_STROMAL_LYMPHOPOIETIN_TSLP_SIGNALING_PATHWAY
gene_lists$endothelin<-wiki$M39651_WP_ENDOTHELIN_PATHWAYS
gene_lists$insulinSig<-wiki$M39482_WP_INSULIN_SIGNALING
gene_lists$EGFRSig<-wiki$M39334_WP_EGFEGFR_SIGNALING_PATHWAY
gene_lists$IL23Sig<-react$M27896_REACTOME_INTERLEUKIN_23_SIGNALING
gene_lists$IL18Sig<-react$M27878_REACTOME_INTERLEUKIN_18_SIGNALING
gene_lists$IL20Sig<-react$M27750_REACTOME_INTERLEUKIN_20_FAMILY_SIGNALING
rm(wiki,hall.gs,react,kegg.gs,ICP)
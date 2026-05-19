#if (!requireNamespace("BiocManager", quietly = TRUE))
#  install.packages("BiocManager")

#BiocManager::install("DESeq2")
#BiocManager::install("EnhancedVolcano")

# --------------------------------------------------

library(DESeq2)
library(EnhancedVolcano)

# --------------------------------------------------

# Read data
data_BH <- read.table("../7_feature_counting/Features_BH.txt")
data_serum <- read.table("../7_feature_counting/Features_Serum.txt")

# Combine data
data_combined <- cbind(data_BH[, 2:4], data_serum[, 2:4])
colnames(data_combined) <- c("BH72", "BH73", "BH74", "Serum69", "Serum70", "Serum71")

# Create the metadata dataframe
metadata <- data.frame(
  state = factor(c(rep("BH", 3), rep("Serum", 3))))
rownames(metadata) <- colnames(data_combined)
metadata$state <- relevel(metadata$state, ref = "BH")

# Perform DE analysis
dds <- DESeqDataSetFromMatrix(data_combined, metadata, design = ~ state)
dds <- DESeq(dds)

# Save results
res <- results(dds, contrast=c("state", "Serum", "BH"))
rownames(res) <- data_BH[, 1]

res_ordered <- res[order(res$padj), ]
head(res_ordered, 100)
write.csv(as.data.frame(res_ordered), file="deseq2_results_ordered.csv")

# Variance stabilizing transformation (removes variance bias in low counts)
vsd <- vst(dds, blind=FALSE)

# Plot the PCA
plotPCA(vsd, intgroup="state")

EnhancedVolcano(res,
                lab = rownames(res),
                x = 'log2FoldChange',
                y = 'padj',
                pCutoff = 1e-05,
                labSize = 3,
                title = 'State 1 vs State 2 Differential Expression')
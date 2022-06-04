# NeRiT
NeRiT (Network regression method in TWAS) is a package for detecting the association between a given network and phenotypes of interest. It builds upon the two-stage analysis framework that is commonly used in TWAS, first adopts the distribution-robust nonparametric Bayesian Dirichlet process regression (DPR) model in the eQTL study to obtain the SNP effect size estimate on each gene within the network, given that DPR method is essentially nonparametric and is more robust against the mis-specified distribution of SNP effect size. In addition, we parallelized with Bayesian sparse linear mixed model (BSLMM) model for sensitive analysis. Then, NeRiT adopts PMI to represent the between-node correlation and performs the association analysis with both the node of predicted gene expression and the edge of their correlation among these predicted values to be included in the model. In this case, it can effectively take the network structure into account, and simultaneously identify the trait-related nodes (e.g., genes) as well as the trait-related edges (e.g., gene-gene co-association).  

# Installation
It is easy to install the development version of NeRiT package using the 'devtools' package.  
```R
#install.packages("devtools")  
library(devtools)  
install_github("XiuyuanJin/NeRiT")  
```

# Usage
The main function in the package is NeRiT, you can find the instructions by '?NeRiT'.  
```R
library(NeRiT)  
?NeRiT  
```

# Example
One simple example to use the package can be found at https://github.com/XiuyuanJin/example  

# Development
This R package is developed by Xiuyuan Jin.  

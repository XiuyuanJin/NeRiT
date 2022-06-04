library(data.table)
network_hsa04924 <- read.csv("network_hsa04924.csv",header = FALSE)
save(network_hsa04924,file="network_hsa04924.rda",compress="xz")

data2 <- fread("DPR_hsa04924.txt",header=TRUE)
DPR_hsa04924 <- as.data.frame(data2)
save(DPR_hsa04924,file="DPR_hsa04924.rda",compress="xz")
cat("network_hsa04924","DPR_hsa04924",sep="\n",file="datalist")

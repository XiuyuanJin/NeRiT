library(data.table)
library(NeRiT)
library(KernSmooth)
library(akima)
data1 <- read.csv('network_hsa04924.csv',header = FALSE)
data2 <- fread('DPR_hsa04924.txt',header=TRUE)
data2 <- as.data.frame(data2)
n1 <- dim(data1)[1]
formula = y~X1+X2+X3+X4+X5+X6+X7+X8+X9+X10+X11+X12+X13+V1_2+V2_3+V2_4+V4_5+V5_6+V3_7+V9_10+V5_13
outcome_PMI <- NeRiT(data1,data2,n1,formula)

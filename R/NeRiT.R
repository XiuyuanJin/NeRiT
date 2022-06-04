#' NeRiT
#'
#' @param data1 is the relationship among nodes:if one node links another, the relationship between them is 1, otherwise is 0.
#' @param data2 includes all variables needed in formula.
#' @param n1 is the number of nodes.
#' @param formula is outcome regression on nodes,edges and covariate with 'glm'.
#'
#' @export
#' @return A data.frame.
#'
#' @examples
#' library(NeRiT)
#' library(KernSmooth)
#' library(akima)
#' n1 <- nrow(network_hsa04924)
#' formula = y~X1+X2+X3+X4+X5+X6+X7+X8+X9+X10+X11+X12+X13+V1_2+V2_3+V2_4+V4_5+V5_6+V3_7+V9_10+V5_13
#' outcome_PMI <- NeRiT(network_hsa04924,DPR_hsa04924,n1,formula)
#'

NeRiT <- function(data1, data2, n1, formula) {
    library(data.table)
    #-------------EDGE-------------#
    b <- unlist(data1)  #data1 is the relationship among nodes:if one node links another, the relationship between them is 1, otherwise is 0
    sigma <- matrix(b, nrow = n1)  #n1 is the number of nodes
    sigma0 <- sigma
    sigma0[lower.tri(sigma0, diag = T)] <- 0
    EDGE <- which(sigma0 != 0, arr.ind = T)
    #-------------PMI--------------#
    DenPreData <- apply(EDGE, 1, denPre2D, DataPre = data2)  #data2 includes all variables needed in formula
    colname <- apply(EDGE, 1, RENAME, varname = "V")
    colnames(DenPreData) <- colname
    KDEFitData <- cbind(data2, DenPreData)
    #----------Regression------------#
    KDEfit <- glm(formula, data = KDEFitData, control = list(maxit = 100))
    KDEtemp <- summary(KDEfit)
    KDEtem <- KDEtemp$coefficients
    KDEtem <- data.frame(round(KDEtem, 5))

    return(KDEtem)
}

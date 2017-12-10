#=========================================================================
#Assignment 3
#
#Simple Perceptron
#===============================================================================
# Package to Implement perceptron on a two-class set of lienarly separable data. 
#===============================================================================

##############Perceptron solution evaluation function returning with class labels####################

classify <- function(S,z){
  n <- nrow(S[[1]])
  y <- matrix(ncol = n, nrow = 1)
  for (i in 1:n){
    x <- S[[1]][i,]
    if(t(z) %*% x >0){
      y[i] <- 1
    }else{
      y[i] <- -1
    }
  }
  y <- c(y)
  return(y)
}


###############################Perceptron algorithm####################################

#Implement the Batch Perceptron with learning rate 1/k where k is the
# number of the current iteration.

perceptrain <- function(S, y){
  n <- nrow(S[[1]])
  m <- ncol(S[[1]])
  z <- rnorm(m)
  Z_hist <- rbind(matrix(ncol = m, nrow = 0), z)
  for (k in 1: 1e+05){
    Cp <- 0
    gdtCp <- 0
    for (i in 1:n){
      x <- S[[1]][i,]
      if (sign(y[i]) != sign(z %*% x)){
        Cp <- Cp + abs(z %*% x)
        gdtCp <- gdtCp + (-y[i]) %*% x
      }
    }
    if (Cp == 0){
      Z_hist <- rbind(Z_hist, z)
      return(list(z, Z_hist))
    }else{
      z <- z - (1/k) * gdtCp
      Z_hist <- rbind(Z_hist, z)
    }
  }
}



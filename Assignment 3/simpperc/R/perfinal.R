#=========================================================================
#Assignment 3
#
#Simple Perceptron
#=========================================================================
# Implement perceptron on a two-class set of lienarly separable data. For
# the purpose of testing the algorithm, I will randomly generate both
# training and test datasets. Then, I will implement perceptron algorithm
# with learning rate 1/k into R code.
#=========================================================================

#Inputs
#w:  w[1:d] is the normal vector of a hyperplane,
#    w[d+1] = -c is the negative offset parameter.
#n: sample size

#Outputs
#S: n by (d+1) sample matrix with last col 1
#y: vector of the associated class labels


######################## Data generation#########################################
#Load the created package
library(simpperc)

# Randomly generate two sets of linearly separable datasets with binary
# classes labelled as +1 and -1
fakedata <- function(w, n){
  if(! require(MASS)){
    install.packages("MASS")
  }
  if(! require(mvtnorm)){
    install.packages("mvtnorm")
  }
  require(MASS)
  require(mvtnorm)

  # obtain dimension
  d <- length(w)-1

  # compute the offset vector and a Basis consisting of w and its nullspace
  offset <- -w[length(w)] * w[1:d] / sum(w[1:d]^2)
  Basis <- cbind(Null(w[1:d]), w[1:d])

  # Create samples, correct for offset, and extend
  # rmvnorm(n,mean,sigme) ~ generate n samples from N(0,I) distribution
  S <- rmvnorm(n, mean=rep(0,d),sigma = diag(1,d)) %*%  t(Basis)
  S <- S + matrix(rep(offset,n),n,d,byrow=T)
  S <- cbind(S,1)

  # compute the class assignments
  y <- as.vector(sign(S %*% w)) #p35

  # add corrective factors to points that lie on the hyperplane.????
  S[y==0,1:d] <- S[y==0,1:d] + runif(1,-0.5,0.5)*10^(-4)
  y = as.vector(sign(S %*% w))
  return(list(S=S, y=y))

}


################################Training and testing processes############################
# Generate a 3D random vector z, run functions and train my Perceptron on
# traing and test datasets.

require(mvtnorm)
z <- rnorm(3)
training <- fakedata(z, 100)
test <- fakedata(z, 100)
training.classify<- classify(training, z)
test.classify <- classify(test, z)
perc <- perceptrain(training, training.classify)
perc.test <- perceptrain(test, test.classify)


#################################Plotting 3D datapoints back into 2D plots#######################3

#For training data with a set of lines from the Z history
library(ggplot2)
training.classified <- cbind(training[[1]], training[[2]])
new.training.classified <- as.data.frame(training.classified)
datapoints.plot <- ggplot(data = new.training.classified,
                          aes(x = V1, y =V2, color = V4)) +
  geom_point()+ggtitle("2D Plot of Training Data and Z History")
datapoints.plot

for (i in 1:nrow(perc[[2]])){
  norm.matrix <- 1/(sqrt(perc[[2]][i,1]^2 +
                           perc[[2]][i,2]^2)) * perc[[2]][i,]
  z.homo.coord <- Null(norm.matrix[1:2]) +
    norm.matrix[3] * c(norm.matrix[1], norm.matrix[2])
  if (i < nrow(perc[[2]])){
    b <- (Null(norm.matrix)[2])/(Null(norm.matrix)[1])
    datapoints.plot <- datapoints.plot +
      geom_abline(intercept = -sign(norm.matrix[2]) *
                    norm.matrix[3] * sqrt(b^2+1), slope = b, alpha = 0.3,
                  color = "blue")
  } else{
    datapoints.plot <- datapoints.plot +
      geom_abline(intercept = -sign(norm.matrix[2]) *
                    norm.matrix[3] * sqrt(b^2+1), slope = b,
                  color = "black")
  }
}
datapoints.plot

#For test data with the classifier hyperplane
test.classified <- cbind(test[[1]], test[[2]])
new.test.classified <- as.data.frame(test.classified)

n <- nrow(perc.test[[2]])
norm.matrix2 <- 1/(sqrt(perc.test[[2]][n,1]^2 +
                          perc.test[[2]][n,2]^2)) * perc.test[[2]][n,]
z.homo.coord2 <- Null(norm.matrix2[1:2]) +
  norm.matrix2[3] * c(norm.matrix2[1], norm.matrix2[2])
b <- (Null(norm.matrix2)[2])/(Null(norm.matrix2)[1])
ggplot(data = new.test.classified, aes(x = V1, y =V2, color = V4)) +
  geom_point()+ggtitle("2D Plot of Test Data and
                       the Classifier Hyperplane") +
  geom_abline(intercept = -sign(norm.matrix2[2]) *
                norm.matrix2[3] * sqrt(b^2+1), slope = b,
              color = "red")

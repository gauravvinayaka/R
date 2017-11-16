
#install.packages("hydroGOF")
#install.packages("Amelia")

##################################################### Amelia ############################################################

library(Amelia)
library(hydroGOF)
library()

#load data
data(iris)

#produce 2% missing data 
iris_NA2 <- prodNA(iris, noNA = 0.02)

#run amelia
#m  - Refers to 3 imputed data sets
#noms - keep nominal variables here

amelia_imp <- amelia(iris_NA2, m=3, noms = "Species")

#check imputed outputs
amelia_imp$imputations[[1]]
amelia_imp$imputations[[2]]
amelia_imp$imputations[[3]]


am_imp<-amelia_imp$imputations[[1]] 



#Evaluating performance using RMSE (1st data set)
rmse_amelia2<-rmse(am_imp[,-5],iris[,-5],na.rm = TRUE)

#print RMSE
rmse_amelia2

#Evaluating performance using knn
#normalization

normalize <- function(x) {
  num <- x - min(x)
  denom <- max(x) - min(x)
  return (num/denom)
}

iris_normal <-as.data.frame(lapply(iris[,c(1:4)],normalize))
str(iris_normal)

iris_imp_normal<-as.data.frame(lapply(am_imp[,c(1:4)],normalize))
str(iris_imp_normal)

#create train and testing sets

iris_train <- iris_normal[1:150,]
iris_test <-iris_imp_normal[1:150,]

#target variable (Species)
iris_train_arget<-iris[1:150,5]
iris_test_target<-iris[1:150,5]


require(class)

#knn model
m1<-knn(train = iris_train, test =iris_test, cl= iris_train_arget, k=13 )

#confusion matrix
xtab<-table(iris_test_target,m1)
library(caret) 
confusionMatrix(xtab)


######
#load data
data(iris)

#produce 5% missing data 
iris_NA5 <- prodNA(iris, noNA = 0.05)

#run amelia
#m  - Refers to 3 imputed data sets
#noms - keep nominal variables here

amelia_imp <- amelia(iris_NA5, m=3, noms = "Species")

#check imputed outputs
amelia_imp$imputations[[1]]
amelia_imp$imputations[[2]]
amelia_imp$imputations[[3]]


am_imp<-amelia_imp$imputations[[1]]


#Evaluating performance using RMSE (1st data set)
rmse_amelia5<-rmse(am_imp[,-5],iris[,-5],na.rm = TRUE)

#print RMSE
rmse_amelia5

#Evaluating performance using knn
#normalization

normalize <- function(x) {
  num <- x - min(x)
  denom <- max(x) - min(x)
  return (num/denom)
}

iris_normal <-as.data.frame(lapply(iris[,c(1:4)],normalize))
str(iris_normal)

iris_imp_normal<-as.data.frame(lapply(am_imp[,c(1:4)],normalize))
str(iris_imp_normal)

#create train and testing sets

iris_train <- iris_normal[1:150,]
iris_test <-iris_imp_normal[1:150,]

#target variable (Species)
iris_train_arget<-iris[1:150,5]
iris_test_target<-iris[1:150,5]


require(class)

#knn model
m2<-knn(train = iris_train, test =iris_test, cl= iris_train_arget, k=13 )

#confusion matrix
xtab<-table(iris_test_target,m2)
library(caret) 
confusionMatrix(xtab)



######
#load data
data(iris)

#produce 10% missing data 
iris_NA10 <- prodNA(iris, noNA = 0.1)

#run amelia
#m  - Refers to 3 imputed data sets
#noms - keep nominal variables here

amelia_imp <- amelia(iris_NA10, m=3, noms = "Species")

#check imputed outputs
amelia_imp$imputations[[1]]
amelia_imp$imputations[[2]]
amelia_imp$imputations[[3]]


am_imp<-amelia_imp$imputations[[1]]


#Evaluating performance using RMSE (1st data set)
rmse_amelia10<-rmse(am_imp[,-5],iris[,-5],na.rm = TRUE)

#print RMSE
rmse_amelia10

#Evaluating performance using knn
#normalization

normalize <- function(x) {
  num <- x - min(x)
  denom <- max(x) - min(x)
  return (num/denom)
}

iris_normal <-as.data.frame(lapply(iris[,c(1:4)],normalize))
str(iris_normal)

iris_imp_normal<-as.data.frame(lapply(am_imp[,c(1:4)],normalize))
str(iris_imp_normal)

#create train and testing sets

iris_train <- iris_normal[1:150,]
iris_test <-iris_imp_normal[1:150,]

#target variable (Species)
iris_train_arget<-iris[1:150,5]
iris_test_target<-iris[1:150,5]


require(class)

#knn model
m3<-knn(train = iris_train, test =iris_test, cl= iris_train_arget, k=13 )

#confusion matrix
xtab<-table(iris_test_target,m3)
library(caret) 
confusionMatrix(xtab)

######
#load data
data(iris)

#produce 15% missing data 
iris_NA15 <- prodNA(iris, noNA = 0.15)

#run amelia
#m  - Refers to 3 imputed data sets
#noms - keep nominal variables here

amelia_imp <- amelia(iris_NA15, m=3, noms = "Species")

#check imputed outputs
amelia_imp$imputations[[1]]
amelia_imp$imputations[[2]]
amelia_imp$imputations[[3]]


am_imp<-amelia_imp$imputations[[1]]


#Evaluating performance using RMSE (1st data set)
rmse_amelia15<-rmse(am_imp[,-5],iris[,-5],na.rm = TRUE)

#print RMSE
rmse_amelia15

#Evaluating performance using knn
#normalization

normalize <- function(x) {
  num <- x - min(x)
  denom <- max(x) - min(x)
  return (num/denom)
}

iris_normal <-as.data.frame(lapply(iris[,c(1:4)],normalize))
str(iris_normal)

iris_imp_normal<-as.data.frame(lapply(am_imp[,c(1:4)],normalize))
str(iris_imp_normal)

#create train and testing sets

iris_train <- iris_normal[1:150,]
iris_test <-iris_imp_normal[1:150,]

#target variable (Species)
iris_train_arget<-iris[1:150,5]
iris_test_target<-iris[1:150,5]


require(class)

#knn model
m4<-knn(train = iris_train, test =iris_test, cl= iris_train_arget, k=13 )

#confusion matrix
xtab<-table(iris_test_target,m4)
library(caret) 
confusionMatrix(xtab)

######
#load data
data(iris)

#produce 20% missing data 
iris_NA20 <- prodNA(iris, noNA = 0.20)

#run amelia
#m  - Refers to 3 imputed data sets
#noms - keep nominal variables here

amelia_imp <- amelia(iris_NA20, m=3, noms = "Species")

#check imputed outputs
amelia_imp$imputations[[1]]
amelia_imp$imputations[[2]]
amelia_imp$imputations[[3]]


am_imp<-amelia_imp$imputations[[1]]


#Evaluating performance using RMSE (1st data set)
rmse_amelia20<-rmse(am_imp[,-5],iris[,-5],na.rm = TRUE)

#print RMSE
rmse_amelia20

#Evaluating performance using knn
#normalization

normalize <- function(x) {
  num <- x - min(x)
  denom <- max(x) - min(x)
  return (num/denom)
}

iris_normal <-as.data.frame(lapply(iris[,c(1:4)],normalize))
str(iris_normal)

iris_imp_normal<-as.data.frame(lapply(am_imp[,c(1:4)],normalize))
str(iris_imp_normal)

#create train and testing sets

iris_train <- iris_normal[1:150,]
iris_test <-iris_imp_normal[1:150,]

#target variable (Species)
iris_train_arget<-iris[1:150,5]
iris_test_target<-iris[1:150,5]


require(class)

#knn model
m5<-knn(train = iris_train, test =iris_test, cl= iris_train_arget, k=13 )

#confusion matrix
xtab<-table(iris_test_target,m5)
library(caret) 
confusionMatrix(xtab)

######
#load data
data(iris)

#produce 25% missing data 
iris_NA25 <- prodNA(iris, noNA = 0.25)

#run amelia
#m  - Refers to 3 imputed data sets
#noms - keep nominal variables here

amelia_imp <- amelia(iris_NA25, m=3, noms = "Species")

#check imputed outputs
amelia_imp$imputations[[1]]
amelia_imp$imputations[[2]]
amelia_imp$imputations[[3]]


am_imp<-amelia_imp$imputations[[1]]


#Evaluating performance using RMSE (1st data set)
rmse_amelia25<-rmse(am_imp[,-5],iris[,-5],na.rm = TRUE)

#print RMSE
rmse_amelia25

#Evaluating performance using knn
#normalization

normalize <- function(x) {
  num <- x - min(x)
  denom <- max(x) - min(x)
  return (num/denom)
}

iris_normal <-as.data.frame(lapply(iris[,c(1:4)],normalize))
str(iris_normal)

iris_imp_normal<-as.data.frame(lapply(am_imp[,c(1:4)],normalize))
str(iris_imp_normal)

#create train and testing sets

iris_train <- iris_normal[1:150,]
iris_test <-iris_imp_normal[1:150,]

#target variable (Species)
iris_train_arget<-iris[1:150,5]
iris_test_target<-iris[1:150,5]


require(class)

#knn model
m6<-knn(train = iris_train, test =iris_test, cl= iris_train_arget, k=13 )

#confusion matrix
xtab<-table(iris_test_target,m6)
library(caret) 
confusionMatrix(xtab)




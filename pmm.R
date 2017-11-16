
#install.packages("hydroGOF")
#install.packages("quanteda")
#install.packages("RANN")
#install.packages("mice")
#install.packages("missForest")

###################################### pmm Imputation ################################################
library(missForest)
library(mice)
library(hydroGOF)

#load data
data(iris)

#produce 2% missing data for the first four variables in the iris dataset.
iris_NA2 = prodNA(iris[1:4], noNA = 0.02); 

imputed_Data <- mice(iris_NA2, m=5, maxit = 10, method = 'pmm', seed = 500)

completeData <- complete(imputed_Data,2)

#Evaluating performance using RMSE
rmse_knn2 <- rmse(completeData[,-5],iris[,-5],na.rm = TRUE)

#print rmse
rmse_knn2

#Evaluating performance using knn
#normalization

normalize <- function(x) {
  num <- x - min(x)
  denom <- max(x) - min(x)
  return (num/denom)
}

iris_normal <-as.data.frame(lapply(iris[,c(1:4)],normalize))
str(iris_normal)

iris_imp_normal<-as.data.frame(lapply(completeData[,c(1:4)],normalize))
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

#######
#load data
data(iris)

#produce 5% missing data for the first four variables in the iris dataset.
iris_NA5 = prodNA(iris[1:4], noNA = 0.05); 

imputed_Data <- mice(iris_NA5, m=5, maxit = 10, method = 'pmm', seed = 500)

completeData <- complete(imputed_Data,2)

#Evaluating performance using RMSE
rmse_knn5 <- rmse(completeData[,-5],iris[,-5],na.rm = TRUE)

#print rmse
rmse_knn5

#Evaluating performance using knn
#normalization

normalize <- function(x) {
  num <- x - min(x)
  denom <- max(x) - min(x)
  return (num/denom)
}

iris_normal <-as.data.frame(lapply(iris[,c(1:4)],normalize))
str(iris_normal)

iris_imp_normal<-as.data.frame(lapply(completeData[,c(1:4)],normalize))
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

########

#load data
data(iris)

#produce 10% missing data for the first four variables in the iris dataset.
iris_NA10 = prodNA(iris[1:4], noNA = 0.10); 

imputed_Data <- mice(iris_NA10, m=5, maxit = 10, method = 'pmm', seed = 500)

completeData <- complete(imputed_Data,2)

#Evaluating performance using RMSE
rmse_knn10 <- rmse(completeData[,-5],iris[,-5],na.rm = TRUE)

#print rmse
rmse_knn10

#Evaluating performance using knn
#normalization

normalize <- function(x) {
  num <- x - min(x)
  denom <- max(x) - min(x)
  return (num/denom)
}

iris_normal <-as.data.frame(lapply(iris[,c(1:4)],normalize))
str(iris_normal)

iris_imp_normal<-as.data.frame(lapply(completeData[,c(1:4)],normalize))
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

###############
#load data
data(iris)

#produce 15% missing data for the first four variables in the iris dataset.
iris_NA15 = prodNA(iris[1:4], noNA = 0.15); 

imputed_Data <- mice(iris_NA15, m=5, maxit = 10, method = 'pmm', seed = 500)

completeData <- complete(imputed_Data,2)

#Evaluating performance using RMSE
rmse_knn15 <- rmse(completeData[,-5],iris[,-5],na.rm = TRUE)

#print rmse
rmse_knn15

#Evaluating performance using knn
#normalization

normalize <- function(x) {
  num <- x - min(x)
  denom <- max(x) - min(x)
  return (num/denom)
}

iris_normal <-as.data.frame(lapply(iris[,c(1:4)],normalize))
str(iris_normal)

iris_imp_normal<-as.data.frame(lapply(completeData[,c(1:4)],normalize))
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

####################
#load data
data(iris)

#produce 20% missing data for the first four variables in the iris dataset.
iris_NA20 = prodNA(iris[1:4], noNA = 0.20); 

imputed_Data <- mice(iris_NA20, m=5, maxit = 10, method = 'pmm', seed = 500)

completeData <- complete(imputed_Data,2)

#Evaluating performance using RMSE
rmse_knn20 <- rmse(completeData[,-5],iris[,-5],na.rm = TRUE)

#print rmse
rmse_knn20

#Evaluating performance using knn
#normalization

normalize <- function(x) {
  num <- x - min(x)
  denom <- max(x) - min(x)
  return (num/denom)
}

iris_normal <-as.data.frame(lapply(iris[,c(1:4)],normalize))
str(iris_normal)

iris_imp_normal<-as.data.frame(lapply(completeData[,c(1:4)],normalize))
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

##############

#load data
data(iris)

#produce 25% missing data for the first four variables in the iris dataset.
iris_NA25 = prodNA(iris[1:4], noNA = 0.25); 

imputed_Data <- mice(iris_NA25, m=5, maxit = 10, method = 'pmm', seed = 500)

completeData <- complete(imputed_Data,2)

#Evaluating performance using RMSE
rmse_knn25 <- rmse(completeData[,-5],iris[,-5],na.rm = TRUE)

#print rmse
rmse_knn25

#Evaluating performance using knn
#normalization

normalize <- function(x) {
  num <- x - min(x)
  denom <- max(x) - min(x)
  return (num/denom)
}

iris_normal <-as.data.frame(lapply(iris[,c(1:4)],normalize))
str(iris_normal)

iris_imp_normal<-as.data.frame(lapply(completeData[,c(1:4)],normalize))
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






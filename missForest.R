#install.packages("hydroGOF")
install.packages("caret")
install.packages("ggplot2")
#################################################### missForest #########################################################

library(missForest)
library(hydroGOF)
library(ggplot2)
library(caret)

#load data
data(iris)

##produce 2% missing data 
iris_NA2 <- prodNA(iris, noNA = 0.02)

#impute missing values, using all parameters as default values using missForest
iris_imp <- missForest(iris_NA2)

#check imputed values
#call upon the imputed data matrix
iris_imp$ximp

iris_imp_miss <- iris_imp$ximp

#Evaluating performance using RMSE
rmse_miss2<-rmse(iris_imp_miss[,-5],iris[,-5],na.rm = TRUE)

#print RMSE
rmse_miss2

#Evaluating performance using knn
#normalization

normalize <- function(x) {
  num <- x - min(x)
  denom <- max(x) - min(x)
  return (num/denom)
}

iris_normal <-as.data.frame(lapply(iris[,c(1:4)],normalize))
str(iris_normal)

iris_imp_normal<-as.data.frame(lapply(iris_imp_miss[,c(1:4)],normalize))
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

##########
#load data
data(iris)

##produce 5% missing data 
iris_NA5 <- prodNA(iris, noNA = 0.05)

#impute missing values, using all parameters as default values using missForest
iris_imp <- missForest(iris_NA5)

#check imputed values
#call upon the imputed data matrix
iris_imp$ximp
iris_imp_miss <- iris_imp$ximp

#Evaluating performance using RMSE
rmse_miss5<-rmse(iris_imp_miss [,-5],iris[,-5],na.rm = TRUE)

#print RMSE
rmse_miss5

#Evaluating performance using knn
#normalization

normalize <- function(x) {
  num <- x - min(x)
  denom <- max(x) - min(x)
  return (num/denom)
}

iris_normal <-as.data.frame(lapply(iris[,c(1:4)],normalize))
str(iris_normal)

iris_imp_normal<-as.data.frame(lapply(iris_imp_miss[,c(1:4)],normalize))
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



##########
#load data
data(iris)

##produce 10% missing data 
iris_NA10 <- prodNA(iris, noNA = 0.1)

#impute missing values, using all parameters as default values using missForest
iris_imp <- missForest(iris_NA10)

#check imputed values
#call upon the imputed data matrix
iris_imp$ximp
iris_imp_miss <- iris_imp$ximp

#Evaluating performance using RMSE
rmse_miss10<-rmse(iris_imp_miss[,-5],iris[,-5],na.rm = TRUE)

#print RMSE
rmse_miss10


#Evaluating performance using knn
#normalization

normalize <- function(x) {
  num <- x - min(x)
  denom <- max(x) - min(x)
  return (num/denom)
}

iris_normal <-as.data.frame(lapply(iris[,c(1:4)],normalize))
str(iris_normal)

iris_imp_normal<-as.data.frame(lapply(iris_imp_miss[,c(1:4)],normalize))
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


##########
#load data
data(iris)

##produce 15% missing data 
iris_NA15 <- prodNA(iris, noNA = 0.15)

#impute missing values, using all parameters as default values using missForest
iris_imp <- missForest(iris_NA15)

#check imputed values
#call upon the imputed data matrix
iris_imp$ximp
iris_imp_miss <- iris_imp$ximp

#Evaluating performance using RMSE
rmse_miss15<-rmse(iris_imp_miss[,-5],iris[,-5],na.rm = TRUE)

#print RMSE
rmse_miss15

#Evaluating performance using knn
#normalization

normalize <- function(x) {
  num <- x - min(x)
  denom <- max(x) - min(x)
  return (num/denom)
}

iris_normal <-as.data.frame(lapply(iris[,c(1:4)],normalize))
str(iris_normal)

iris_imp_normal<-as.data.frame(lapply(iris_imp_miss[,c(1:4)],normalize))
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


##########
#load data
data(iris)

##produce 20% missing data 
iris_NA20 <- prodNA(iris, noNA = 0.2)

#impute missing values, using all parameters as default values using missForest
iris_imp <- missForest(iris_NA20)

#check imputed values
#call upon the imputed data matrix
iris_imp$ximp
iris_imp_miss <- iris_imp$ximp

#Evaluating performance using RMSE
rmse_miss20<-rmse(iris_imp_miss[,-5],iris[,-5],na.rm = TRUE)

#print RMSE
rmse_miss20

#Evaluating performance using knn
#normalization

normalize <- function(x) {
  num <- x - min(x)
  denom <- max(x) - min(x)
  return (num/denom)
}

iris_normal <-as.data.frame(lapply(iris[,c(1:4)],normalize))
str(iris_normal)

iris_imp_normal<-as.data.frame(lapply(iris_imp_miss[,c(1:4)],normalize))
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



##########
#load data
data(iris)

##produce 25% missing data 
iris_NA25 <- prodNA(iris, noNA = 0.25)

#impute missing values, using all parameters as default values using missForest
iris_imp <- missForest(iris_NA25)

#check imputed values
#call upon the imputed data matrix
iris_imp$ximp
iris_imp_miss <- iris_imp$ximp

#Evaluating performance using RMSE
rmse_miss25<-rmse(iris_imp_miss[,-5],iris[,-5],na.rm = TRUE)

#print RMSE
rmse_miss25

#Evaluating performance using knn
#normalization

normalize <- function(x) {
  num <- x - min(x)
  denom <- max(x) - min(x)
  return (num/denom)
}

iris_normal <-as.data.frame(lapply(iris[,c(1:4)],normalize))
str(iris_normal)

iris_imp_normal<-as.data.frame(lapply(iris_imp_miss[,c(1:4)],normalize))
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
xtab<-Table(iris_test_target,m6)
library(caret) 
confusionMatrix(xtab)





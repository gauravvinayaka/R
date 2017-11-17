#Scheme

data("iris")
head(iris)

mean(iris$Sepal.Length)
mean(iris$Sepal.Width)
mean(iris$Petal.Length)
mean(iris$Petal.Width)

median(iris$Sepal.Length)
median(iris$Sepal.Width)
median(iris$Petal.Length)
median(iris$Petal.Width)

# Interquantile range
IQR(iris$Sepal.Length)
IQR(iris$Sepal.Width)
IQR(iris$Petal.Length)
IQR(iris$Petal.Width)

which(iris$Sepal.Length > (median(iris$Sepal.Length) + (1.5*IQR(iris$Sepal.Length))))
which(iris$Sepal.Length < (median(iris$Sepal.Length) - (1.5*IQR(iris$Sepal.Length))))

# Outliers have been marked as NA

iris[which(iris$Sepal.Length > (median(iris$Sepal.Length) + (1.5*IQR(iris$Sepal.Length))) | (iris$Sepal.Length < (median(iris$Sepal.Length) - (1.5*IQR(iris$Sepal.Length))))),'Sepal.Length'] <- NA
iris[which(iris$Sepal.Width > (median(iris$Sepal.Width) + (1.5*IQR(iris$Sepal.Width))) | (iris$Sepal.Width < (median(iris$Sepal.Width) - (1.5*IQR(iris$Sepal.Width))))),'Sepal.Width'] <- NA
iris[which(iris$Petal.Length > (median(iris$Petal.Length) + (1.5*IQR(iris$Petal.Length))) | (iris$Petal.Length < (median(iris$Petal.Length) - (1.5*IQR(iris$Petal.Length))))),'Petal.Length'] <- NA
iris[which(iris$Petal.Length > (median(iris$Petal.Length) + (1.5*IQR(iris$Petal.Length))) | (iris$Petal.Length < (median(iris$Petal.Length) - (1.5*IQR(iris$Petal.Length))))),'Petal.Length'] <- NA

imputed_dataa<-sum(is.na(iris))



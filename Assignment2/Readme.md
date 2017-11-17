# Imputing missing values in R

In this assignment, I have used these techniques : PMM, Mice and Amelia to impute missing values.

-----

# libraries used: 
library(missForest)
library(mice)
library(hydroGOF)
library(Amelia)
liibrary(caret)


--------

# 1. Predictive mean matching



-------------


# 2. Amelia 
Amelia package performs multiple imputation to deal with missing values. 
It makes few assumptions:
1.	Missingness at random.
2.	It uses means and covariances to summarize data and variables have Multivariate Normal Distribution (MVN).


-------

# 3. missForest
 missForest is an implementation of random forest algorithm.  It builds a random forest model for each variable. Then it uses the model to predict missing values in the variable with the help of observed values.

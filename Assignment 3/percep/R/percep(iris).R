#=========================================================================
#Assignment 3
#
#Simple Perceptron
#===============================================================================
# Run the created package on iris dataset
#===============================================================================

library(percep)

train_test_split <- train_test_from_df(df = iris, predict_col_index = 5, train_ratio = 0.7)
training_data <- train_test_split[[1]]
testing_data <- train_test_split[[2]]

in_n <- length(training_data[[1]][[1]])
out_n <- length(training_data[[1]][[-1]])

#calling neuralnetwork to initialise the weight and bias matricies for a given list of sizes.
trained_net <- neuralnetwork(
  c(in_n, 40, out_n),
  training_data=training_data,
  epochs=30, 
  mini_batch_size=10,
  lr=0.5,
  C='ce',
  verbose=TRUE,
  validation_data=testing_data
)


# Trained matricies:
biases <- trained_net[[1]]
weights <- trained_net[[-1]]

# Accuracy (train)
evaluate(training_data, biases, weights)  
# Accuracy (test)
evaluate(testing_data, biases, weights)  
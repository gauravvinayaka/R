library(percep)

head(iris)


train_test_split <- train_test_from_df(df = iris, predict_col_index = 5, train_ratio = 0.7)
training_data <- train_test_split[[1]]
testing_data <- train_test_split[[2]]
``
in_n <- length(training_data[[1]][[1]])
out_n <- length(training_data[[1]][[-1]])

# [4, 40, 3]
trained_net <- neuralnetwork(
  c(in_n, 30, out_n),
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
evaluate(training_data, biases, weights)  #0.971
# Accuracy (test)
evaluate(testing_data, biases, weights)  #0.956

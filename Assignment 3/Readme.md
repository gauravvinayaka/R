# Simple Perceptron

In this assignment, I have created 2 packages : percep and simpperc.

In percep package I implement perceptron on a two-class set of lienarly separable data.
And in simpperc package I have used neural-network functions like :

1. neuralnetwork 
2. SGD   
3. update_mini_batch 
4. backprop

The neuralnetwork function's main job is to initialise the weight and bias matricies given a list of sizes. For example, if we have 10 variables to predict 4 possible classes and we want a hidden-layer with 20 neurons we would pass: c(10,20,4) to this function. It passes these matricies to the SGD function to commence training.

The SGD function splits the training-data into random mini-batches and sends them off to the update_mini_batch function, which calculates the deltas for a batch (using backprop) and then updates the weights and bias matricies. 

The backprop function applies the backpropogation algorithm to calculate the partial derivatives (to update mini-batch).
The forward step, goes through the network layer-by-layer and calculates the output of the activation function to calculate the delta (cost gradient given the prediction). 

The backward step propogates the partial derivative (deltas) across all the neurons so that they get a share proportional to their contribution to the output.

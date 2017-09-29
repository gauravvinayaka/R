library(rbenchmark)
library(ggplot2)

# Preparing Synthetic data
x <- data.frame(patientid = 1:20000,
           age = rnorm(20000, mean = 60, sd = 12),
           treatment = gl(4, 5000,
                          labels = c("A", "B","C","D")))



# Using a for-loop to compute the  mean of age grouped by treatment
y <- function(x){
  for(i in unique(x$treatment)){
    tmp <- mean(x[which(x$treatment == i),"age"])
    print(c(tmp,i))
  }
}


# Performance graph for tapply
performance_tapply <- data.frame(Replications = character(), Elapsed_Time = numeric())
rep <- c(100,500,1000,1500,2000)
for(i in rep){
  tmp <- benchmark(tapply(x$age,x$treatment,mean), replications = i)[3]
  performance_tapply <- rbind(performance_tapply, data.frame(as.character(i), tmp))
}
names(performance_tapply) <- c("replications","elapsed_time")

# Performance graph for loop
performance_for <- data.frame(Replications = character(), Elapsed_Time = numeric())
rep <- c(100,500,1000,1500,2000)
for(i in rep){
  tmp <- benchmark(y(x), replications = i)[3]
  performance_for <- rbind(performance_for, data.frame(as.character(i), tmp))
}
names(performance_for) <- c("replications","elapsed_time_for")

performance_final <- cbind(performance_tapply, performance_for$elapsed_time_for)
names(performance_final)[3] <- "elapsed_time_for"


#plot for the performance comparison
ggplot(performance_final, aes(x = as.integer(replications))) + 
  geom_line(aes(y = elapsed_time, colour = "elapsed_time_tapply")) + 
  geom_line(aes(y = elapsed_time_for, colour = "elapsed_time_for"))

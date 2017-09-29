library(rbenchmark)
library(ggplot2)

#rapply
l1 <- list(c(1:10),c(11:20))
rapply_results<-rapply(l1,log2)

#Equivalent for loop
y <- function(x){
t<-list()
for(i in 1:length(l1)){
  
  for(j in 1:length(l1[[i]])){
  
  y<- c(l1[[i]][j])
  tmp <- log2(y)
  t<- c(t,tmp)
  }
  print(t)
}
}

# Performance graph for rapply
performance_rapply <- data.frame(Replications = character(), Elapsed_Time = numeric())
rep <- c(100,500,1000,1500,2000)
for(i in rep){
  tmp <- benchmark(rapply(l1,log2), replications = i)[3]
  performance_rapply <- rbind(performance_rapply, data.frame(as.character(i), tmp))
}
names(performance_rapply) <- c("replications","elapsed_time")

# Performance graph for loop
performance_for <- data.frame(Replications = character(), Elapsed_Time = numeric())
rep <- c(100,500,1000,1500,2000)
for(i in rep){
  tmp <- benchmark(y(x), replications = i)[3]
  performance_for <- rbind(performance_for, data.frame(as.character(i), tmp))
}
names(performance_for) <- c("replications","elapsed_time_for")

performance_final <- cbind(performance_rapply, performance_for$elapsed_time_for)
names(performance_final)[3] <- "elapsed_time_for"


#plot for the performance comparison
ggplot(performance_final, aes(x = as.integer(replications))) + 
  geom_line(aes(y = elapsed_time, colour = "elapsed_time_rapply")) + 
  geom_line(aes(y = elapsed_time_for, colour = "elapsed_time_for"))

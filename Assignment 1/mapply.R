library(rbenchmark)
library(ggplot2)

#Mapply function
l1 <- list(a=c(1:10),b=c(11:20))
mapply_results<-mapply(sum, l1$a, l1$b)


#Equivalent for loop
y <- function(x){

k<-1
t<-list()
for(j in 1:length(l1[[k]])){
    
    tmp<- l1$a[j] + l1$b[j]
    t<- c(t,tmp)
   }
print(t)
}


# Performance graph for mapply
performance_mapply <- data.frame(Replications = character(), Elapsed_Time = numeric())
rep <- c(100,500,1000,1500,2000)
for(i in rep){
  tmp <- benchmark(mapply(sum, l1$a, l1$b), replications = i)[3]
  performance_mapply <- rbind(performance_mapply, data.frame(as.character(i), tmp))
}
names(performance_mapply) <- c("replications","elapsed_time")

# Performance graph for loop
performance_for <- data.frame(Replications = character(), Elapsed_Time = numeric())
rep <- c(100,500,1000,1500,2000)
for(i in rep){
  tmp <- benchmark(y(x), replications = i)[3]
  performance_for <- rbind(performance_for, data.frame(as.character(i), tmp))
}
names(performance_for) <- c("replications","elapsed_time_for")

performance_final <- cbind(performance_mapply, performance_for$elapsed_time_for)
names(performance_final)[3] <- "elapsed_time_for"


#plot for the performance comparison
ggplot(performance_final, aes(x = as.integer(replications))) + 
  geom_line(aes(y = elapsed_time, colour = "elapsed_time_mapply")) 
  geom_line(aes(y = elapsed_time_for, colour = "elapsed_time_for"))

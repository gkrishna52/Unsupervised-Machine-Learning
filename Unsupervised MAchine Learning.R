#Store the iris data

data <- iris
data

#importing all the package
library(dplyr)
library(ggplot2)

#check the summary of data

summary(data)

#Applying sapply to deliver output in vector or matrix

sapply(data[,-5], var)

#By using ggplot2 library visulaize the data
#plot between sepal length and sepal width

ggplot(iris,aes(x = Sepal.Length, y = Sepal.Width, col= Species)) + geom_point()

#plot between petal length and petal width
ggplot(iris,aes(x = Petal.Length, y = Petal.Width, col= Species)) + geom_point()

#clustering exercise

#The plot of Within cluster sum of squares vs the number of clusters
#show us an elbow point at 3. So,can conlude that 3 is the 
#best value for k to be used to create the final model.

set.seed(200)
k.max <- 10
wss<- sapply(1:k.max,function(k){kmeans(iris[,3:4],k,nstart = 20,iter.max = 20)$tot.withinss})
wss

#plot elbow graph

plot(1:k.max,wss, type= "b", xlab = "Number of clusters(k)", ylab = "Within cluster sum of squares")

#The final model is builtusing kmeans and k = 3.
#he nstartvalue has also been defined as 20 which means that
#R will try 20 different random starting assignments and
#then select the one with the lowest within cluster variation.

icluster <- kmeans(iris[,3:4],3,nstart = 20)
table(icluster$cluster,iris$Species)



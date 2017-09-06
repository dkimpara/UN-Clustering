#helper functions
library(cluster)
library(NbClust)
library(fpc)

#normalize function
normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
}

#30 tests to determine best number of clusters
nbclust <- function(x) {
  test <- NbClust(x, diss=NULL, distance="euclidean", 2, 15, 
                  method = "ward.D2", index="all")
  n <- names(sort(-table(test$Best.nc[seq(1,52,2)])))[1]  # find best number of clusters
}

# silhouette width
swidth <- function(x) {
  asw <- numeric(20)
  for (k in 2:20)
    asw[[k]] <- pam(x, k) $ silinfo $ avg.width
  print("Average silhouette width for optimal clustering")
  print(asw[as.numeric(n)])
}

# elbow criterion (for kmeans)
elbow <- function(x) {
  wss = (nrow(x)-1)*sum(apply(x,2,var))
  for (i in 2:15) wss[i] <- sum(kmeans(x,
                                       centers=i)$withinss)
  plot(1:15, wss, type="b", xlab="Number of isClusters",
       ylab="Within groups sum of squares")
}
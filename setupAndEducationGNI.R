# code was written as guide for non-technical colleagues
# 
# 1. sets up R environment for cluster analysis
# 2. calculates clustering for education and GNI

# step 1: change working directory to folder with data files/code
getwd()  # current directory
# setwd("directory")  change directory

eval(parse("helperFunctions.r"))

df.ed <- read.csv("gni&enrolment.csv")  # read a csv file. in excel save as .csv

# df.ed type is now a 'dataframe': R specific datatype. 
# It's essentially a data table

# make country name the row labels in the dataframe instead of numbers
labels <- df.ed[[1]]
row.names(df.ed) <- labels
df.ed$X <- NULL  # remove column with country name

# Now column 1 is enrolment and col 2 gni

# this is how you create a new dataframe
df.edgni <- data.frame(normalize(df.ed$enrolment),normalize(df.ed$gni.cap))  
row.names(df.edgni) <- labels 

#evaluate clustering
nbclust(df.edgni)

# hierarchical clustering
d <- dist(df.edgni, method = "euclidean")
ed.cluster <- hclust(d, "ward.D2")
clusters <- cutree(ed.cluster, 4)

# plot clustering
palette(value = c('red', 'blue', 'green', 'black', 'yellow'))
plot(df.edgni, col = as.factor(clusters))
text(df.edgni, labels = row.names(df.edgni),cex=0.7, pos=3)  # create labels

#looks like Macao SAR, China is an outlier
df.edClean <- df.ed[-22,]
rm(df.edgni)
#rerun clustering

#normalize data
df.edgni <- data.frame(normalize(df.edClean$enrolment), normalize(df.edClean$gni.cap))  
row.names(df.edgni) <- row.names(df.edClean)

#evaluate clustering
nbclust(df.edgni)

# hierarchical clustering
d <- dist(df.edgni, method = "euclidean")
ed.cluster <- hclust(d, "ward.D2")
clusters <- cutree(ed.cluster, 3)

# plot clustering
palette(value = c('red', 'blue', 'green', 'black', 'yellow'))
plot(df.edgni, col = as.factor(clusters))
text(df.edgni, labels = row.names(df.edgni),cex=0.7, pos=3)  # create labels

title(main = "College Enrolment and National Income Per Capita")


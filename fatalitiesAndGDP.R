eval(parse("helperFunctions.r"))

source <- read.csv("Workers_Fatality_VS_GDP.csv")

labels <- source[[1]]
df.fatal <- data.frame(normalize(sqrt(source$GDP_per_cap)), 
                       normalize(source$Workers_Fatality_per_100000_per_year))
source <- data.frame(source$GDP_per_cap,
                     source$Workers_Fatality_per_100000_per_year) #for exploration
row.names(source) <- labels
row.names(df.fatal) <- labels

# hierarchical clustering
d <- dist(df.fatal, method = "euclidean")
clust <- hclust(d, "ward.D2")
groups <- cutree(clust, 4)

# plot clustering
palette(value = c('red', 'blue', 'green', 'black'))
plot(df.fatal, col = as.factor(groups))
text(df.fatal, labels = row.names(df.fatal),cex=0.7, pos=3)  # create labels

title(main = "GDP per Capita and Worker Fatalities per 100000/year")

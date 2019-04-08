## Exploratory Data Analysis

## Scatterplot with linear regression
data(airquality)
 with(airquality, {
  +         plot(Temp, Ozone)
  +         lines(loess.smooth(Temp, Ozone))
  + })

## Lattice plot - x v y over z
library(lattice)
 state <- data.frame(state.x77, region = state.region)
 xyplot(Life.Exp ~ Income | region, data = state, layout = c(4, 1))
 
## Add title to plot
 title(main = "Old Faithful Geyser data")  
 
## Continuous bar plots (used for numbers and date-times)
 ggplot(data = diamonds) +
   geom_histogram(mapping = aes(x = carat), binwidth = 0.5)
 
## overlay multiple line charts
 ggplot(data = smaller, mapping = aes(x = carat, colour = cut)) +
   geom_freqpoly(binwidth = 0.1)
 
# K-means clustering
 
## Plot the dataset
 set.seed(1234)
  x <- rnorm(12, mean = rep(1:3, each = 4), sd = 0.2)
  y <- rnorm(12, mean = rep(c(1, 2, 1), each = 4), sd = 0.2)
 plot(x, y, col = "blue", pch = 19, cex = 2)
 text(x + 0.05, y + 0.05, labels = as.character(1:12))
 
## Using Stats package
 dataFrame <- data.frame(x, y)
  kmeansObj <- kmeans(dataFrame, centers = 3)
  names(kmeansObj)
      
  kmeansObj$cluster
  
## Plot original and clustered data
  par(mfrow = c(1, 2))
   image(t(dataMatrix)[, nrow(dataMatrix):1], yaxt = "n", main = "Original Data")
   image(t(dataMatrix)[, order(kmeansObj$cluster)], yaxt = "n", main = "Clustered Data")
  
# Hierarchal cluster analysis
   
### Aglomerative clustering
   
   # Dissimilarity matric
   d <- dist(df, method = "euclidean")
   
   # Hierarchal clusteringusing agglomorative method
   hc1 <- hclust(d, method = "complete" )
    # Different methods can be used, such as average, single, ward.D

   #Plot dendogram
   plot(hc1, cex = 0.6, hang = -1)
   
# Using the agnes function
   hc2 <- agnes(df, method = "complete")
    # calculate agglomeratice coefficient
   hc2$ac
   
### Divisive hiearchical clustering
   hc2$ac
   
## Visualtize clusters in a scatterplot
   fviz_cluster(list(data = df, cluster = sub_grp))
   
## Cut agnes tree into 4 groups
   hc_a <- agnes(df, method = "ward")
   cutree(as.hclust(hc_a), k = 4)

## Cut diana tree into 4 groups
   hc_d <- diana(df)
   cutree(as.hclust(hc_d), k = 4)
   
##Compute distance matrix
res.dist <- dist(df, method = "euclidean")

## Compute tanglegram
tanglegram(dend1, dend2)

## Determine optimal clustering using elbow method
fviz_nbclust(df, FUN = hcut, method = "wss")
 
## Determine optimal clustering with silhouette method
fviz_nbclust(df, FUN = hcut, method = "silhouette")

## Optimal clustering using gap statistics method
gap_stat <- clusGap(df, FUN = hcut, nstart = 25, K.max = 10, B = 50)
fviz_gap_stat(gap_stat)

### Principle Component Analysis

## Screeplot to see principal component
pca <- princomp(data)
screeplot(pca)

## Scale data
X_scaled=scale(wine)


## Perform PCA
winePCA <- prcomp(X_scaled)
summary(winePCA)

## drop components under 80%
X_new=winePCA$x[,(1:5)]

## Plot a PCA
library(ggbiplot)

ggbiplot(mtcars.pca)
ggbiplot(mtcars.pca, labels=rownames(mtcars))

## Add an ellipse to the plot
ggbiplot(mtcars.pca,ellipse=TRUE,circle=TRUE, labels=rownames(mtcars), groups=mtcars.country)

## Remove arrows
ggbiplot(mtcars.pca,ellipse=TRUE,obs.scale = 1, var.scale = 1,var.axes=FALSE,   labels=rownames(mtcars), groups=mtcars.country)

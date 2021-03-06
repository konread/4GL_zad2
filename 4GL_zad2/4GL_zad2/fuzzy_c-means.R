WholesaleCustomersData = read.csv("WholesaleCustomersData.csv", header = TRUE)

names(WholesaleCustomersData) = c("Region", "Fresh", "Milk", "Grocery", "Frozen", "Detergents_Paper", "Delicassen")
values = WholesaleCustomersData[, -1]

data <- na.omit(values) # Remove missing values (NA)
data <- scale(data) # Scale variables

library(ggplot2)
library(factoextra)
library(e1071)

cm <- cmeans(data, centers = 6, iter.max = 400, dist = "euclidean", method = "cmeans", m=2)
#plot(data, col = cm$cluster)
fviz_cluster(list(data = data, cluster = cm$cluster),repel = FALSE,
             geom = "point", show.clust.cent = TRUE, ellipse.type = "norm",
             ggtheme = theme_minimal(), 
             main = 'Zbi�r danych zawiera 3 r�ne grupy,centers=6,\n
             iter.max=400,dist="euclidean",m=2', 
             alpha = 0.2)

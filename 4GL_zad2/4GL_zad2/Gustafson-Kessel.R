WholesaleCustomersData = read.csv("WholesaleCustomersData.csv", header = TRUE)

names(WholesaleCustomersData) = c("Region", "Fresh", "Milk", "Grocery", "Frozen", "Detergents_Paper", "Delicassen")
values = WholesaleCustomersData[, -1]

data <- na.omit(values) # Remove missing values (NA)
data <- scale(data) # Scale variables

library(ppclust)
library(ggplot2)
library(factoextra)
library(e1071)

# Initialize the prototype matrix using K-means++
v <- inaparc::kmpp(data, k = 6)$v
# Initialize the memberships degrees matrix 
u <- inaparc::imembrand(nrow(data), k = 6)$u

# Run FCM with the initial prototypes and memberships
gk <- gk(data, centers = v, memberships = u, iter.max=50, m = 2)

fviz_cluster(list(data = data, cluster = gk$cluster),repel = FALSE,
             geom = "point", show.clust.cent = TRUE, ellipse.type = "norm",
             ggtheme = theme_minimal(), 
             main = 'Zbiór danych zawiera 3 ró¿ne grupy,centers=6,iter.max=50,m=2', 
             alpha = 0.2)

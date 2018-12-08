WholesaleCustomersData = read.csv("WholesaleCustomersData.csv", header = TRUE)

names(WholesaleCustomersData) = c("Region", "Fresh", "Milk", "Grocery", "Frozen", "Detergents_Paper", "Delicassen")

values = WholesaleCustomersData[, -1]

data <- na.omit(values) # Remove missing values (NA)
data <- scale(data) # Scale variables

library(cluster)
library(ggplot2)
library(factoextra)
library(e1071)

cm <- cmeans(data, 3, 50, method = "cmeans")
#plot(data, col = cm$cluster)
fviz_cluster(list(data = data, cluster = cm$cluster))

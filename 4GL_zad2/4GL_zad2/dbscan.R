WholesaleCustomersData = read.csv("WholesaleCustomersData.csv", header = TRUE)

names(WholesaleCustomersData) = c("Region", "Fresh", "Milk", "Grocery", "Frozen", "Detergents_Paper", "Delicassen")

wholesale = WholesaleCustomersData[, -1]

data <- na.omit(wholesale) # Remove missing values (NA)
data <- scale(data) # Scale variables

#install dbscan
#install cluster
#install devtools
#install ggplot2
#install factoextra

library(cluster)
library(ggplot2)
library(factoextra)
library(dbscan)

# data:     Macierz danych, ramka danych lub macierz odmienno�ci(obiekt - dist) . Okre�l metod� = "dist", je�li dane maj� by� interpretowane jako macierz lub obiekt odmienno�ci. W przeciwnym razie zostan� u�yte odleg�o�ci euklidesowe.
# eps:      Maksymalna odleg�o�� zasi�gu
# MinPts:   Osi�galna minimalna liczba punkt�w
# scale:    Je�li TRUE, dane zostan� przeskalowane

eps = 1.8
minPts = 5

res.dbscan <- dbscan::dbscan(data, eps = eps, minPts = minPts)

fviz_cluster(object = res.dbscan, data = data, main = paste("DBSCAN / ", "eps = ", eps, " / minPts = ", minPts), geom = "point")# + xlim(-5, 2) + ylim(-5, 2)

#dbscan::kNNdistplot(data, 5)
#abline(h = 1.8)
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

# data:     Macierz danych, ramka danych lub macierz odmiennoœci(obiekt - dist) . Okreœl metodê = "dist", jeœli dane maj¹ byæ interpretowane jako macierz lub obiekt odmiennoœci. W przeciwnym razie zostan¹ u¿yte odleg³oœci euklidesowe.
# eps:      Maksymalna odleg³oœæ zasiêgu
# MinPts:   Osi¹galna minimalna liczba punktów
# scale:    Jeœli TRUE, dane zostan¹ przeskalowane
# method:   Mo¿liwe wartoœci to:
#
#           dist:       Traktuje dane jako macierz odleg³oœci
#           raw:        traktuje dane jako nieprzetworzone dane
#           hybrid:     Oczekuj równie¿ danych surowych, ale oblicza macierze na czêœciow¹ odleg³oœæ

res.dbscan <- dbscan(data, eps = 0.6, minPts = 5, method = "raw")

fviz_cluster(object = res.dbscan, data = data, stand = FALSE, frame.type = "norm")# + xlim(-5, 2) + ylim(-5, 2)
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
# method:   Mo�liwe warto�ci to:
#
#           dist:       Traktuje dane jako macierz odleg�o�ci
#           raw:        traktuje dane jako nieprzetworzone dane
#           hybrid:     Oczekuj r�wnie� danych surowych, ale oblicza macierze na cz�ciow� odleg�o��

res.dbscan <- dbscan(data, eps = 0.6, minPts = 5, method = "raw")

fviz_cluster(object = res.dbscan, data = data, stand = FALSE, frame.type = "norm")# + xlim(-5, 2) + ylim(-5, 2)
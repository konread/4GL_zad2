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

# x:         Mo¿liwe wartoœci to: Numeryczna macierz danych lub ramka danych liczbowych: ka¿dy wiersz odpowiada obserwacji, a ka¿da kolumna odpowiada zmiennej.
# k:         Liczba klastrów
# metric:    Metryki odleg³oœci, które maj¹ byæ u¿ywane. Dostêpne opcje to "euclidean" i "manhattan".
# stand:     Wartoœæ logiczna: jeœli true, zmienne(kolumny) wx s¹ standaryzowane przed obliczeniem odmiennoœci. Ignorowane, gdy x jest macierz¹ odmiennoœci.

res.pam <- pam(data, 3, metric = "euclidean", stand = FALSE)

fviz_cluster(object = res.pam, data = data, stand = FALSE, frame.type = "norm")# + xlim(-0.2, -0.05) + ylim(-0.3, 0.6)
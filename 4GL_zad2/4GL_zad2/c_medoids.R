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

# x:         Mo�liwe warto�ci to: Numeryczna macierz danych lub ramka danych liczbowych: ka�dy wiersz odpowiada obserwacji, a ka�da kolumna odpowiada zmiennej.
# k:         Liczba klastr�w
# metric:    Metryki odleg�o�ci, kt�re maj� by� u�ywane. Dost�pne opcje to "euclidean" i "manhattan".
# stand:     Warto�� logiczna: je�li true, zmienne(kolumny) wx s� standaryzowane przed obliczeniem odmienno�ci. Ignorowane, gdy x jest macierz� odmienno�ci.

k = 3
metric = "manhattan"

res.pam <- pam(data, k, metric = metric, stand = FALSE)

fviz_cluster(object = res.pam, data = data, stand = FALSE, main = paste("C-MEDOIDS / ", "k = ", k, " / metric = " , metric), geom = "point") # + xlim(-0.2, -0.05) + ylim(-0.3, 0.6)
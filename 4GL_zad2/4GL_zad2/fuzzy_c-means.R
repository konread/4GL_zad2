
WholesaleCustomersData = read.csv("WholesaleCustomersData.csv", header = FALSE)
wholesale = WholesaleCustomersData[-1,]
region = WholesaleCustomersData[-1, 1]

names(wholesale) = c("Region", "Fresh", "Milk", "Grocery", "Frozen", "Detergents_Paper", "Delicassen")
View(region)
#values = wholesale[-1,-1]
#View(wholesale_customers_data)

# Compute fuzzy clustering
#library(e1071)
#set.seed(123)

# Load the data
#data("USArrests")
#View(USArrests)

#ss <- sample(1:50, 20)
#df <- scale(USArrests[ss,])

# Compute fuzzy clustering
#library(e1071)
#cm <- cmeans(df, 4)
#cm
# Importar datos de diferentes fuentes
# 07/12/2021

# Importar desde Dropbox --------------------------------------------------
# Utilizar librería repmis

library(repmis)
Datos <- source_data("https://www.dropbox.com/s/hmsf07bbayxv6m3/cuadro1.csv?dl=1")
head(Datos)

# Importar desde Carpeta --------------------------------------------------

Datos_1 <- read.csv("Datos/cuadro1.csv", header = TRUE, stringsAsFactors = TRUE)
str(Datos_1)
summary(Datos_1)

# Estadísticas descriptivas -----------------------------------------------
# Medidas de tendencia central Media, mediana, intercuartiles, rangos

mean(Datos_1$Diametro)
median(Datos_1$Diametro)
fivenum(Datos$Diametro)
range(Datos_1$Diametro)

mean(Datos_1$Altura)

sd(Datos$Altura)
var(Datos_1$Diametro)

# Representación gráfica --------------------------------------------------

hist(Datos_1$Diametro)
boxplot(Datos_1$Diametro)

boxplot(Datos_1$Diametro ~ Datos_1$Especie)
boxplot(Datos_1$Altura ~ Datos_1$Especie)

which(Datos_1$Altura > 20)

# Obtener submuestras -----------------------------------------------------

trees.h <- subset(Datos_1, Especie =="H")
trees.c <- subset(Datos_1, Especie =="C")

# mayor o igual que >=; mayor que >, igual que ==, menor o igual<=, 
# menor que <, no es igual !=

# subconjunto sin incluir la especie H
trees.cf <- subset(Datos_1, Especie != "H")


# Agregar una variable a la BD --------------------------------------------

Datos_1$AB <- 0.7854*(Datos_1$Diametro/100)^2
Datos_1$h2 <- Datos_1$Altura/2

boxplot(Datos_1$Altura ~ Datos_1$Clase)

# resumen gráfico y personalización
# 07/12/2021

Datos <- read.csv("Datos/cuadro1.csv", header = TRUE, stringsAsFactors = TRUE)

# Personalizar un boxplot

boxplot(Datos$Diametro ~ Datos$Especie, col="lightblue",
        xlab = "Especies",
        ylab = "Diámetro (cm)",
        main = "Inventario parcela 1",
        ylim = c(5, 30))

# Generar una malla de 2 x 2 con gráfica

op <- par(mfrow=c(2,2)) # Instrucción para generar un 2x2

# Gráfica 1
boxplot(Datos$Diametro ~ Datos$Especie, col="lightblue",
        xlab = "Especies",
        ylab = "Diámetro (cm)",
        main = "Inventario parcela 1",
        ylim = c(5, 30))

# Gráfica 2
plot(trees.c$Altura ~ trees.c$Diametro, col= "blue",
        xlab = "Especies",
        ylab = "",
        main = "Especie C",
        ylim = c(5, 30))

# Gráfica 3
boxplot(trees.h$Diametro ~ trees.h$Clase, col= "blue",
        xlab = "Especies",
        ylab = "Diámetro (cm)",
        main = "Especie H",
        ylim = c(5, 30))
# Gráfica 4
boxplot(trees.cf$Altura ~ trees.cf$Clase, col= "blue",
        xlab = "Especies",
        ylab = "",
        main = "Especie C y F",
        ylim = c(5, 30))

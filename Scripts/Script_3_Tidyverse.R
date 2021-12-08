# Trabajar con la librería tidyverse

Dat <- read.csv("Datos/cuadro1.csv", header = TRUE, stringsAsFactors = TRUE)
library(tidyverse)


# Operador Pipeline -------------------------------------------------------
# cmd+shift+m Mac = %>% 
# Ctrl+may+m %>% 

# Ejemplo de uso de Pipeline (realizar operaciones en forma secuencial)

x <- c(1,4,6,8)
y <- round(mean(sqrt(log(x))),2)
y
# Forma %>% 

y1 <- x %>% 
  log() %>% 
  sqrt() %>% 
  mean() %>% 
  round(2)
y1 # Observar el valor obtenido de la operación anterior


# Función summarize

res.inv <- summarize(Dat, Media.diam = mean(Diametro),
                     Media.alt = mean(Altura),
                     Sd.diam = sd(Diametro),
                     Sd.alt = sd(Altura))
res.inv


# Función group_by

by.sp <- group_by(Dat, Especie)
summ.sp <- summarize(by.sp, Media.diam = mean(Diametro),
                     Sd.diam = sd(Diametro),
                     Media.alt = mean(Altura),
                     Sd.alt = sd(Altura))
summ.sp

# Guardar los datos en un archivo csv editable en Excel.
write.table(summ.sp, "Datos/resumen_inventario_especie.csv", sep = ",")

# Agrupar por especie y clase: group_by()

# representar la Media y SD para las variables Diámetro y Altura
by.clase <- group_by(Dat, Especie, Clase)
summ.cla.sp <- summarize(by.clase, Media.diam=mean(Diametro),
                         SD.diam=sd(Diametro),
                         Media.alt = mean(Altura),
                         Sd.alt = sd(Altura))
summ.cla.sp
write.table(summ.cla.sp, "Datos/resumen_inv_especie_clase.csv", sep = ",")

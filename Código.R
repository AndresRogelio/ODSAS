# Cargar librerias
library(sf)
library(CoastCR)

#Colocar ruta de archivos en donde se guardará
setwd("C:/Imagenes Satelitales/r2/")

# Shapefile de las intersecciones
shp <- st_read("intersecciones.shp")

# Shapefiles de los transectos
normals <- st_read("transectos.shp")

# Tabla con los valores de fecha e incertidumbre
table <- read.csv("tabla_costas.csv")
colnames(table) <- c("Day", "Uncertainty")
table$Day <- as.Date(table$Day, format = "%d/%m/%Y")

# Definir la posición de la linea base. 
#Fuera de la playa = OFF
#Sobre la playa = ON
#Mezcla = MIX.
position = "OFF"

# Definir nombre de los
#productos
out_points <- "intersecciones_tasas.shp"
out_name <- "transectos_tasas.shp"

#Calcular métricas
coast_var(shp, normals, table, position, out_points, out_name)

resultados <- read.csv("transectos_tasas_summary.csv")
print(resultados)

#Ver tabla de atributos
transectos <- st_read("C:/Imagenes Satelitales/r2/transectos_tasas.shp")
print(transectos)
transectos$Normal <- transectos$Normal + 1

#Grafico LLR
# Definir los rangos y etiquetas para los intervalos
rangos <- c(-Inf, -1.9999, -0.9999, 0, 0.001, Inf)
etiquetas <- c("Erosión muy alta", "Erosión alta", "Erosión moderada", "Estable", "Acreción moderada")

# Crear la columna de categoría basada en los rangos
transectos$Categoria <- cut(transectos$LRR, breaks = rangos, labels = etiquetas)

library(ggplot2)

# Crear el gráfico con leyendas debajo
grafico <- ggplot(transectos, aes(x = Normal, y = LRR, fill = Categoria)) +
  geom_bar(stat = "identity", linewidth = 0.5) +
  labs(x = "No. de transectos", y = "LRR (m/año-1)") +
  scale_fill_manual(values = c("Erosión muy alta" = "red", "Erosión alta" = "orange", "Erosión moderada" = "yellow", "Estable" = "green", "Acreción moderada" = "blue")) +
  theme_minimal() +
  theme(axis.title = element_text(size = 12),
        plot.title = element_text(size = 16, face = "bold", hjust = 0.5)) +
  coord_flip() + scale_x_reverse()

# Mostrar el gráfico
print(grafico)

# Graficar NSM
grafico2 <- ggplot(data = transectos, aes(x = Normal, y = NSM)) +
  geom_line(color = "red", linewidth = 1.5) +
  geom_hline(yintercept = 0, linetype = "dashed") +
  labs(x = "No. de transectos", y = "NSM (m)") +
  ggtitle("Evolución de la línea costera - NSM") +
  theme_minimal() +  # Estilo minimalista
  theme(panel.grid.major = element_line(color = "lightgray", linetype = "dashed"),  # Líneas guía en gris claro y discontinuas
        axis.line = element_line(size = 1, color = "black"),  # Líneas de los ejes más gruesas y negras
        axis.text = element_text(color = "black"),  # Color del texto de los ejes
        axis.title = element_text(color = "black"), plot.title = element_text(hjust = 0.5))
print(grafico2)

# Tabla
library(sf)
transectos <- st_read("C:/Imagenes Satelitales/r2/transectos_tasas.shp")
print(transectos)
("C:/Imagenes Satelitales/r2/")
resultados <- read.csv("transectos_tasas_summary.csv")
print(resultados)

# Calcular el porcentaje de valores negativos en la columna NSM, LRR y EPR
porcentaje_negativos <- mean(transectos$LRR < 0) * 100

# Imprimir el resultado
print(porcentaje_negativos)

# Filtrar los valores negativos en la columna NSM
valores_negativos <- transectos$NSM[transectos$NSM < 0]

# Calcular el promedio de los valores negativos
promedio_negativos <- mean(valores_negativos)

# Imprimir el resultado
print(promedio_negativos)

#porcentaje de todos los transectos que tienen una distancia positiva
porcentaje_positivos <- mean(transectos$EPR > 2)*100
print(porcentaje_positivos)

#promedio de todas las distancias positivas
promedio_positivos <- transectos$EPR[transectos$EPR > 0]
promedio_positivos <- mean(promedio_positivos)
print(promedio_positivos)

# Crear el nuevo DataFrame con las columnas deseadas
df_nuevo <- transectos[, c("Normal", "Categoria")]
print(df_nuevo)

library(dplyr)

# Agrupar por la clasificación y calcular el porcentaje para cada Normal
resultados <- df_nuevo %>%
  group_by(Categoria) %>%
  summarize(
    Porcentaje = n()/nrow(df_nuevo) * 100
  ) %>%
  arrange(Categoria)  # Opcional: Ordenar los resultados por categoría

# Mostrar los resultados
print(resultados)

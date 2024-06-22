# Determinando cambios en la línea costera en una playa del Pacífico panameño utilizando herramientas de código abierto

Este proyecto fue divulgado en el IX Congreso Internacional de Ingeniería, Ciencias y Tecnología - IESTEC - de la Universidad Tecnológica de Panamá (2024).

## Resumen

La línea costera, siendo la frontera entre el mar y la tierra, es afectada por factores naturales, antropogénicos y el cambio climático. La erosión de esta línea reduce la zona de playa y aumenta la vulnerabilidad de los asentamientos humanos frente a eventos extremos. Este estudio utilizó imágenes satelitales Sentinel-2 y una metodología de código abierto para determinar los cambios en la línea costera de Puerto Caimito, Panamá, durante el período 2016-2024. La delimitación de la línea costera se realizó manualmente utilizando el índice NDWI en QGIS, seguido por el análisis de transectos e intersecciones en SAGA GIS y el cálculo de parámetros con el paquete CoastCR de RStudio. Los resultados mostraron una tendencia erosiva con una tasa promedio de -1.47 m/año y una distancia media de -14.125 m erosionada, siendo más significativa en los extremos noreste y sureste de la playa. Se sugiere que variaciones climáticas, estrés hídrico en los manglares y la dinámica natural de las olas podrían estar contribuyendo a este proceso, mientras que la acreción podría relacionarse con la desembocadura de cuerpos de agua y la hidrodinámica de las olas. Esta metodología de código abierto ofrece una alternativa económica a las licencias comerciales como ArcGIS, facilitando su aplicación en proyectos gubernamentales e investigaciones y optimizando el uso de recursos públicos.

## Contenido del Repositorio

- **`README.md`**: Este archivo que proporciona una visión general del proyecto.
- **`Codigo.R`**: Carpeta que contiene los códigos para crear, manipular y graficar los datos.

### Requisitos
- SAGA GIS
- RStudio con el paquete CoastCR y sf instalado

### Citación
(Proximamente).

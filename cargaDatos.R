# -----------------------------------------------------------------
# Importar datos de archivos CSV
# -----------------------------------------------------------------
library(data.table)
library(DataExplorer)

setwd('C:/Users/Rojo/Desktop/iData/iData')
results <- read.csv('results.csv')
results2 <- NaN
class(results)
str(results)
head(results[,c('Algorithm','Dataset','Accuracy')])
create_report(results, output_file = "report.html")

# -----------------------------------------------------------------
# Importar datos Excel
# -----------------------------------------------------------------
if(!is.installed('XLConnect'))
  install.packages('XLConnect')
library('XLConnect')

ebay <- readWorksheetFromFile('eBayAuctions.xls',sheet=1)
class(ebay)
str(ebay)
tail(ebay)

# -----------------------------------------------------------------
# Escribir y leer datos de Excel
# -----------------------------------------------------------------
if(!is.installed("writexl"))
  install.packages("writexl")
library("writexl")

# write_xlsx(results, "C:/Users/Usuario/OneDrive - Idata/CURSO_DIGITALSCHOOL/results.xlsx")

# write_xlsx(results2,"C:/Users/Usuario/OneDrive - Idata/CURSO_DIGITALSCHOOL/results.xlsx", sep= ",")

# ebay <- read.xlsx('data/eBayAuctions.xls', sheetIndex=1)

write_xlsx(results, "C:/Users/Rojo/Desktop/iData/iData/results.xlsx")

write_xlsx(results2,"C:/Users/Rojo/Desktop/iData/iData/results.xlsx", sep= ",")

ebay <- read.xlsx('eBayAuctions.xls', sheetIndex=1)
class(ebay)
str(ebay)
tail(ebay)


# -----------------------------------------------------------------
# Importar datos en formato ARFF
# -----------------------------------------------------------------
if(!is.installed('foreign'))
  install.packages('foreign')
library('foreign')


if(!is.installed('RWeka'))
  install.packages('RWeka')
library('RWeka')

#### CARGANDO ARCHIVOS QUE FUERON GUARDADOS EN FORMATO DBF CON LA LIBRERIA FOREIGN 
x <- read.dbf(system.file("files/sids.dbf", package="foreign")[1])
str(x)
summary(x)

#### CARGANDO ARCHIVOS QUE FUERON GUARDADOS EN FORMATO SPSS CON LA LIBRERIA FOREIGN 

#### ---- CARGA EL ARCHIVO COMO UNA LISTA DE SPSS ---- ####
dat <- read.spss(system.file("files", "electric.sav", package = "foreign"))
str(dat)

##### ---- CARGA EL ARCHIVO COMO UN DATA.FRAME ---- ####
data <- read.spss(system.file("files", "electric.sav", package = "foreign"), to.data.frame = T)
str(data)

# -----------------------------------------------------------------
# Copiar información a y desde el portapapeles
# -----------------------------------------------------------------
write.table(results[1:100,], 'clipboard', sep='\t')
partial.results <- read.delim('clipboard')

# -----------------------------------------------------------------
# Obtener datos a partir de una URL
# -----------------------------------------------------------------
# if(!is.installed('RCurl'))
#   install.packages('RCurl')
# library('RCurl')
# 
# url <- getURL('Escribir URL',ssl.verifypeer = FALSE)
# results2 <- read.csv(textConnection(url))
# str(results2)

# -----------------------------------------------------------------
# Datasets integrados
# -----------------------------------------------------------------
library(datasets)
data()
str(iris)
head(iris)

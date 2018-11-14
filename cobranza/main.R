library(data.table)
library(DataExplorer)

setwd("c:/users/rojo/desktop/idata/idata")

data <- fread("BaseCobranzas.csv")

create_report(data)
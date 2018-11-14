library(data.table)
library(DataExplorer)

setwd("c:/users/rojo/desktop/idata/idata/cobranza")
data <- fread("BaseCobranzas.csv")
create_report(data)



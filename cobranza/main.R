library(data.table)
library(DataExplorer)

setwd("c:/users/rojo/desktop/idata/idata/cobranza")
data <- fread("BaseCobranzas.csv")

create_report(data) 
### unique(data$Cupos)

sum(is.na(data$`MORAMAX 18 meses`))

tmp <- data[`Mora Inicial` <= "30",]

summary(data$`Mora Inicial`)

data <- data[,resencia:= MORA_ACTUAL - `Mora Inicial`]

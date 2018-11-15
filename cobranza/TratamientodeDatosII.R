#install.packages("anytime")  ### INSTALAR LIBRERIA
library(data.table) ### CARGA LIBERIA 
library(DataExplorer)
library(dplyr)
library(anytime)
setwd("c:/users/rojo/desktop/idata/idata/cobranza")

data <- fread("BaseCobranzas.csv")

colnames(data) <- c("N_SOLICITUD_EXP","F_ESTUDIO_EXP", "SUBPRODUCTO_EXP", "NUMERO_TARJERTAS", 
                    "CUPOS", "INGRESOS","EDAD_EXP","TIPO_VIVIENDA_VIVE_EXP","N_HIJOS_EXP",
                    "VIVIENDA_NUEVA_EXP","CANAL_EXP","GENERO_ACT_","ESTADO_CIVIL_ACT_","TIPO_VIVIENDA_ACT_", 
                    "NIVEL_ACADEM_ACT_", "OCUPACION_ACT_","ANOS_ANTIGUEDAD_EMPLEADO","ANOS_RELACION_BANCO",
                    "MORAMAX_18_MESES", "MORA_INICIAL","MORA_ACTUAL", "RODO")


### --- CONVIRTIENDO EN MAYUSCUAL LOS VALORES DEL CAMPO SUBPRODUCTO_EXP Y CANAL_EXP --- ###
data[,SUBPRODUCTO_EXP:=toupper(SUBPRODUCTO_EXP)]
# data[,CANAL_EXP:= tolower(CANAL_EXP)]
data[,CANAL_EXP:=toupper(CANAL_EXP)]

data[OCUPACION_ACT_ == "SOCIO EMPLEADO - SOCIO",OCUPACION_ACT_:=substring(OCUPACION_ACT_,1,5)]
# data[OCUPACION_ACT_ %in% c("", "", "", "") ,OCUPACION_ACT_:=substring(OCUPACION_ACT_,1,5)]

### ELIMINACIO DE ESPACIOS EN LOS VALORES DE OCUPACION_ACT
data[,OCUPACION_ACT_:=gsub(" ", "", OCUPACION_ACT_,)]


### --- CONVIRTIENDO EN FECHA EL CAMPO F_ESTUDIO_EXP --- ###
data[,F_ESTUDIO_EXP:=anydate(F_ESTUDIO_EXP, "%Y-%m")]

### --- HACIENDO UN SUBSTRING DE LOS DATOS --- ###
# data <- data[,F_ESTUDIO_EXP:=substr(F_ESTUDIO_EXP,1,7)]
# data[,F_ESTUDIO_EXP:=as.Date.character(F_ESTUDIO_EXP, "%Y-%m")]

data[TIPO_VIVIENDA_VIVE_EXP == "" & VIVIENDA_NUEVA_EXP == "SI", TIPO_VIVIENDA_VIVE_EXP:="PROPIA"]
data[TIPO_VIVIENDA_VIVE_EXP == "" ,TIPO_VIVIENDA_VIVE_EXP:="OTRAS"]

data[ N_HIJOS_EXP == "" ,N_HIJOS_EXP:="0"]

tmp <- data[VIVIENDA_NUEVA_EXP== "",]

data[is.na(OCUPACION_ACT_)| trimws(OCUPACION_ACT_)=="",OCUPACION_ACT_:="NO_DATA"]

# GenerateReport(data) ### Funcion para version de R 3.4.3
# create_report(data) ### Funcion para version de R 3.5.1
unique(data$Cupos)


tmp <- data[`Mora Inicial` <= "30",]
data <- data[,resencia:= MORA_ACTUAL - `Mora Inicial`]
data[OCUPACION_ACT_== "", OCUPACION_ACT_:= "OTRA"]
sum(is.na(data$OCUPACION_ACT_))

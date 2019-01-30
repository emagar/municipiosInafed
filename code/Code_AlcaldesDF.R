-*- coding: utf-8-unix;-*-
  
  library("rvest")
library(xml2)
library(XML)

pathCamila <- "~/Documents/CPI/Magar/"                 
pathEric <- "/home/eric/Desktop/MXelsCalendGovt/"
# elegir uno u otro
path <- pathCamila

dat.vot<- if (path==pathCamila){
  read.csv(paste0(path, "elecRetrns/data/aymu1977-present.csv"), stringsAsFactors = FALSE, encoding = "UTF-8")
} else {
  read.csv(paste0(path, "elecReturns/data/aymu1977-present.csv"), stringsAsFactors = FALSE)
}

dat.vot[1,]

# selecciona qué estado procesará el código
edon <- 9
estado <- c("aguascalientes", "bajacalifornia", "bajacaliforniasur", "campeche", "coahuila", "colima", "chiapas", "chihuahua", "DF", "durango", "guanajuato", "guerrero", "hidalgo", "jalisco", "mexico", "michoacan", "morelos", "nayarit", "nuevoleon", "oaxaca", "puebla", "queretaro", "quintanaroo", "sanluispotosi", "sinaloa", "sonora", "tabasco", "tamaulipas", "tlaxcala", "veracruz", "yucatan", "zacatecas")[edon]
edo <- c("ags", "bc", "bcs", "cam", "coa", "col", "cps", "cua", "DF", "dgo", "gua", "gue", "hgo", "jal", "mex", "mic", "mor", "nay", "nl", "oax", "pue", "que", "qui", "san", "sin", "son", "tab", "tam", "tla", "ver", "yuc", "zac")[edon]

setwd(paste0(path, "municipiosInafed/codigoFuente/", edo)) # ruta para guardar los datos

tmp <- dat.vot[which(dat.vot$edon==edon), c("inegi", "mun")]
tmp <- tmp[duplicated(tmp$inegi)==FALSE,]
head(tmp)

inegi <- tmp$inegi
munn <- inegi - edon*1000
mun  <- tmp$mun
rm(tmp)
inegi
webpaths <- if (edon<10){
  paste0('http://www.inafed.gob.mx/work/enciclopedia/EMM0', edon, estado, "/delegaciones/0", inegi, "a.html")
} else {
  paste0('http://www.inafed.gob.mx/work/enciclopedia/EMM' , edon, estado, "/delegaciones/" , inegi, "a.html")
}

webpaths
length(webpaths)


path2<- paste0(path, "/municipiosInafed/alcaldes/",edo)
setwd(path2)

for(i in 1:length(webpaths)) {
  filename <- as.character(edon*1000 + munn[i])
  tbls_xml<- readHTMLTable(webpaths[i])
  lgth.temp<- length(tbls_xml)
  emp_ls<- readHTMLTable(url, which = c(8), header = TRUE)
  write.csv(emp_ls, paste0(filename) , row.names = FALSE)
}


rm(filename, url.temp, txt.temp) # limpieza

rm(list=ls())

setwd("~/Desktop/Magar/municipiosInafed/codigoFuente/ags/")
ssData<- readLines("1001.html", encoding = "UTF-8")
ssData
text<- grep(x= ssData, pattern = "img", perl = TRUE, value = TRUE)
text
img<- gsub(x= text, pattern = ".*img[ ]src[=].*[\"\"](.*[.](jpg|png)).*", perl = TRUE, replacement = " \\1")

names<-gsub

link<-"http://www.inafed.gob.mx/work/enciclopedia/EMM01aguascalientes/municipios/img[i]"
download.file(link, destfile = "escudo.jpg")

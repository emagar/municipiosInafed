rm(list=ls())
edon <- 17
estado <- c("aguascalientes", "bajacalifornia", "bajacaliforniasur", "campeche", "coahuila", "colima", "chiapas", "chihuahua", "DF", "durango", "guanajuato", "guerrero", "hidalgo", "jalisco", "mexico", "michoacan", "morelos", "nayarit", "nuevoleon", "oaxaca", "puebla", "queretaro", "quintanaroo", "sanluispotosi", "sinaloa", "sonora", "tabasco", "tamaulipas", "tlaxcala", "veracruz", "yucatan", "zacatecas")[edon]
edo <- c("ags", "bc", "bcs", "cam", "coa", "col", "cps", "cua", "df", "dgo", "gua", "gue", "hgo", "jal", "mex", "mic", "mor", "nay", "nl", "oax", "pue", "que", "qui", "san", "sin", "son", "tab", "tam", "tla", "ver", "yuc", "zac")[edon]

setwd("~/Documents/CPI/Magar/municipiosInafed/codigoFuente/mor/")
files<- list.files()
ssData<- readLines(files[33], encoding = "UTF-8")
text<- grep(x= ssData, pattern = "img", perl = TRUE, value = TRUE)
img<- gsub(x= text, pattern = ".*img[ ].*[=].*[\"\"](.*[.](jpg|png)).*", perl = TRUE, replacement = "\\1")


setwd("~/Documents/CPI/Magar/municipiosInafed/pics/mor/17033/")
path<- paste0("http://www.inafed.gob.mx/work/enciclopedia/EMM",edon,estado)
for(i in 1:length(img)){
  url<- paste0(path,"/municipios/",img)
}

destinations<- paste0(c(1:length(url)),".jpg")

for(i in seq_along(url)){
  download.file(url[i], destinations[i], mode="wb")
}

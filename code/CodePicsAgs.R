rm(list=ls())

setwd("~/Documents/CPI/Magar/municipiosInafed/codigoFuente/ags/")
ssData<- readLines("1010.html", encoding = "UTF-8")
ssData
text<- grep(x= ssData, pattern = "img", perl = TRUE, value = TRUE)
img<- gsub(x= text, pattern = ".*img[ ]src[=].*[\"\"](.*[.](jpg|png)).*", perl = TRUE, replacement = "\\1")
img

setwd("~/Documents/CPI/Magar/municipiosInafed/pics/ags/1010/")
for(i in 1:length(img)){
  url<- paste0("http://www.inafed.gob.mx/work/enciclopedia/EMM01aguascalientes/municipios/",img)
}
length(url)

destinations<- paste0(c(1:length(url)),".jpg")
destinations

for(i in seq_along(url)){
  download.file(url[i], destinations[i], mode="wb")
}

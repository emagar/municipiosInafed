rm(list=ls())

setwd("~/Documents/CPI/Magar/municipiosInafed/codigoFuente/bc/")
ssData<- readLines("2005.html", encoding = "UTF-8")
ssData
text<- grep(x= readLines("2005.html", encoding = "UTF-8"), pattern = "img", perl = TRUE, value = TRUE)
img<- gsub(x= text, pattern = ".*img[ ]src[=].*[\"\"](.*[.](jpg|png)).*", perl = TRUE, replacement = "\\1")

setwd("~/Documents/CPI/Magar/municipiosInafed/pics/bc/2005/")
for(i in 1:length(img)){
  url<- paste0("http://www.inafed.gob.mx/work/enciclopedia/EMM02bajacalifornia/municipios/",img)
}
url
length(url)

destinations<- paste0(c(1:length(url)),".jpg")
destinations

for(i in seq_along(url)){
  download.file(url[i], destinations[i], mode="wb")
}

rm(list=ls())

setwd("~/Documents/CPI/Magar/municipiosInafed/codigoFuente/cps/")
files<- list.files()
files
length(list.files())
ssData<- readLines(files[119], encoding = "UTF-8")
text<- grep(x= ssData, pattern = "img", perl = TRUE, value = TRUE)
img<- gsub(x= text, pattern = ".*img[ ]src[=].*[\"\"](.*[.](jpg|png)).*", perl = TRUE, replacement = "\\1")


setwd("~/Documents/CPI/Magar/municipiosInafed/pics/cps/7119/")
for(i in 1:length(img)){
  url<- paste0("http://www.inafed.gob.mx/work/enciclopedia/EMM07chiapas/municipios/",img)
}

destinations<- paste0(c(1:length(url)),".jpg")

for(i in seq_along(url)){
  download.file(url[i], destinations[i], mode="wb")
}

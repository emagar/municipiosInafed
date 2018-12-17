rm(list=ls())

setwd("~/Documents/CPI/Magar/municipiosInafed/codigoFuente/ags/")
files<- list.files()
length(list.files())
ssData<- readLines(files[81], encoding = "UTF-8")
ssData
text<- grep(x= ssData, pattern = "img", perl = TRUE, value = TRUE)
img<- gsub(x= text, pattern = ".*src[=].*[\"\"](.*[.](jpg|png)).*", perl = TRUE, replacement = "\\1")
img

setwd("~/Documents/CPI/Magar/municipiosInafed/pics/gue/12081/")
for(i in 1:length(img)){
  url<- paste0("http://www.inafed.gob.mx/work/enciclopedia/EMM12guerrero/municipios/",img)
}

destinations<- paste0(c(1:length(url)),".jpg")

for(i in seq_along(url)){
  download.file(url[i], destinations[i], mode="wb")
}

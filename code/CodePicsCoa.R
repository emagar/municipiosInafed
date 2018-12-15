rm(list=ls())

setwd("~/Documents/CPI/Magar/municipiosInafed/codigoFuente/coa/")
files<- list.files()
files
length(list.files())
ssData<- readLines("4011.html", encoding = "UTF-8")
text<- grep(x= ssData, pattern = "img", perl = TRUE, value = TRUE)
img<- gsub(x= text, pattern = ".*img[ ]src[=].*[\"\"](.*[.](jpg|png)).*", perl = TRUE, replacement = "\\1")


setwd("~/Documents/CPI/Magar/municipiosInafed/pics/coa/")
for(i in 1:length(img)){
  url<- paste0("http://www.inafed.gob.mx/work/enciclopedia/EMM04campeche/municipios/",img)
}

destinations<- paste0(c(1:length(url)),".jpg")

for(i in seq_along(url)){
  download.file(url[i], destinations[i], mode="wb")
}

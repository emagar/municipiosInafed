dat.vot<- read.csv("~/Documents/CPI/Magar/elecRetrns/data/aymu1977-present.csv")
dat.vot[1,]

# selecciona qué estado procesará el código
edon <- 13
estado <- c("aguascalientes", "bajacalifornia", "bajacaliforniasur", "campeche", "coahuila", "colima", "chiapas", "chihuahua", "DF", "durango", "guanajuato", "guerrero", "hidalgo", "jalisco", "mexico", "michoacan", "morelos", "nayarit", "nuevoleon", "oaxaca", "puebla", "queretaro", "quintanaroo", "sanluispotosi", "sinaloa", "sonora", "tabasco", "tamaulipas", "tlaxcala", "veracruz", "yucatan", "zacatecas")[edon]
edo <- c("ags", "bc", "bcs", "cam", "coa", "col", "cps", "cua", "df", "dgo", "gua", "gue", "hgo", "jal", "mex", "mic", "mor", "nay", "nl", "oax", "pue", "que", "qui", "san", "sin", "son", "tab", "tam", "tla", "ver", "yuc", "zac")[edon]
estado

path<- "~/Documents/CPI/Magar/"
setwd(paste0(path, "municipiosInafed/codigoFuente/", edo)) # ruta para guardar los datos
dat.vot<- read.csv("~/Documents/CPI/Magar/elecRetrns/data/aymu1977-present.csv")
dat.vot[1,]
tmp <- dat.vot[which(dat.vot$edon==edon), c("inegi", "mun")]
tmp <- tmp[duplicated(tmp$inegi)==FALSE,]
head(tmp)

inegi <- tmp$inegi
munn <- inegi - edon*1000
mun  <- tmp$mun
rm(tmp)
inegi

## Crear las carpetas de los municipios en cada Estado
for(i in 1:length(inegi)){
  dir.create(paste0("~/Documents/CPI/Magar/municipiosInafed/pics/jal/",inegi[i]))
}


setwd(paste0(path, "municipiosInafed/codigoFuente/", edo)) # ruta para descargar los datos



for(i in 1:length(inegi)){
  files<- list.files()
  ssData<- readLines(paste0(inegi[i],".html"), encoding = "UTF-8")
  text<- grep(x= ssData, pattern = "img", perl = TRUE, value = TRUE)
  img<- gsub(x= text, pattern = ".*img[ ]src[=].*[\"\"](.*[.](jpg|png)).*", perl = TRUE, replacement = "\\1")
  }
  destinations<- paste0(c(1:length(url)),".jpg")
  for(i in seq_along(url)){
    download.file(url[i], destinations[i], mode="wb")
  }

final.path<- paste0("~/Documents/CPI/Magar/municipiosInafed/pics/cps/", inegi)
setwd(final.path)




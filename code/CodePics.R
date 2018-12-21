dat.vot<- read.csv("~/Documents/CPI/Magar/elecRetrns/data/aymu1977-present.csv")
dat.vot[1,]

# selecciona qué estado procesará el código
edon <- 1
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
  dir.create(paste0("~/Documents/CPI/Magar/municipiosInafed/pics/zac/",inegi[i]))
}

path<- paste0("~/Documents/CPI/Magar/municipiosInafed/codigoFuente/",edo)
path2<- paste0("http://www.inafed.gob.mx/work/enciclopedia/EMM0",edon,estado,"/municipios/")


for(i in 1:length(inegi)){
  setwd(path)
  ssData.temp<- readLines(paste0(inegi[i],".html"))
  text<- grep(x= ssData, pattern = "img", perl = TRUE, value = TRUE)
  img<- gsub(x= text, pattern = ".*src[=].*[\"\"](.*[.](jpg|png)).*", perl = TRUE, replacement = "\\1")
  urls<- paste0(path2,img)
  filename<- paste0(c(1:length(url)),".jpg")
  download.file(urls, destfile = paste0(img, "jpg"))
}
urls

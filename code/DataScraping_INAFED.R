-*- coding: utf-8-unix;-*-

pathCamila <- "~/Desktop/Magar/"                 
pathEric <- "/home/eric/Desktop/MXelsCalendGovt/"
# elegir uno u otro
path <- pathCamila

dat.vot<- if (path==pathCamila){
              read.csv(paste0(path, "elecRetrns/data/aymu1977-present.csv"), stringsAsFactors = FALSE, encoding = "UTF-8")
          } else {
              read.csv(paste0(path, "elecReturns/data/aymu1977-present.csv"), stringsAsFactors = FALSE)
          }

View(dat.vot)
dat.vot[1,]

# selecciona qué estado procesará el código
edon <- 1
estado <- c("aguascalientes", "bajacalifornia", "bajacaliforniasur", "campeche", "coahuila", "colima", "chiapas", "chihuahua", "DF", "durango", "guanajuato", "guerrero", "hidalgo", "jalisco", "mexico", "michoacan", "morelos", "nayarit", "nuevoleon", "oaxaca", "puebla", "queretaro", "quintanaroo", "sanluispotosi", "sinaloa", "sonora", "tabasco", "tamaulipas", "tlaxcala", "veracruz", "yucatan", "zacatecas")[edon]
edo <- c("ags", "bc", "bcs", "cam", "coa", "col", "cps", "cua", "df", "dgo", "gua", "gue", "hgo", "jal", "mex", "mic", "mor", "nay", "nl", "oax", "pue", "que", "qui", "san", "sin", "son", "tab", "tam", "tla", "ver", "yuc", "zac")[edon]

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
           paste0('http://www.inafed.gob.mx/work/enciclopedia/EMM0', edon, estado, "/municipios/0", inegi, "a.html")
       } else {
           paste0('http://www.inafed.gob.mx/work/enciclopedia/EMM' , edon, estado, "/municipios/" , inegi, "a.html")
       }

webpaths
length(webpaths)

for(i in 1:length(webpaths)) {
    filename <- as.character(edon*1000 + munn[i])
    url.temp <- file(webpaths[i], encoding = "UTF-8")
    txt.temp <-  readLines(url.temp, encoding = "UTF-8")
    write.csv(txt.temp, paste0(filename, ".html") , row.names = FALSE)
    close(url.temp)
}

rm(filename, url.temp, txt.temp) # limpieza

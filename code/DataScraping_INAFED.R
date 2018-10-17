dat.vot<- read.csv('~/Desktop/Magar/elecRetrns/data/aymu1977-present.csv', stringsAsFactors = FALSE, encoding = "UTF-8", local= TRUE)
View(dat.vot)
edon<-1
estado <- c("aguascalientes", "bajacalifornia", "bajacaliforniasur", "campeche","coahuila","colima","chiapas","chihuahua","DF","durango","guanajuato","guerrero","hidalgo","jalisco","mexico","michoacan","morelos","nayarit","nuevoleon","oaxaca","puebla","queretaro","quintanaroo", "sanluispotosi","sinaloa","sonora","tabasco","tamaulipas","tlaxcala","veracruz","yucatan","zacatecas")[edon]
edo <- c("ags", "bc", "bcs", "cam", "coa", "col", "cps", "cua", "df", "dgo", "gua", "gue", "hgo", "jal", "mex", "mic", "mor", "nay", "nl", "oax", "pue", "que", "qui", "san", "sin", "son", "tab", "tam", "tla", "ver", "yuc", "zac")[edon]

setwd(paste0("municipiosInafed/codigoFuente/",edo)) # adapta a la ruta de tu máquina

munn <- dat.vot$inegi[which(dat.vot$edon==edon)]
mun <- dat.vot$mun[which(dat.vot$edon==edon)]

web<- if (edon<10){
  paste0('http://www.inafed.gob.mx/work/enciclopedia/EMM0', edon, estado, "/municipios/0", munn, "a.html")
} else {
  paste0('http://www.inafed.gob.mx/work/enciclopedia/EMM', edon, estado, "/municipios/", munn, "a.html")
}

webpaths<- unique(web)
webpaths
length(webpaths)

for(i in 1:length(webpaths)) {
  url.temp<-file(webpaths[i], encoding = "UTF-8")
  txt.temp<- readLines(url.temp, encoding = "UTF-8")
  write.csv(txt.temp, paste0(estado," ",i), row.names = FALSE)
  close(url.temp)
  
}

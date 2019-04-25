# merge incumbent alcaldes from inafed data
edos <- c("ags", "bc", "bcs", "cam", "coa", "col", "cps", "cua", "df", "dgo", "gua", "gue", "hgo", "jal", "mex", "mic", "mor", "nay", "nl", "oax", "pue", "que", "qui", "san", "sin", "son", "tab", "tam", "tla", "ver", "yuc", "zac")

# from https://stackoverflow.com/questions/17227294/removing-html-tags-from-a-string-in-r
cleanFun <- function(htmlString) {
  return(gsub("<.*?>", "", htmlString))
}

edon <- edon + 1
edo <- edos[edon]
#
# will receive state's alcalde list for the state
alc <- c("Un-htmlized alcaldes from inafed",
         "Used R and Python's BeatifulSoup sequentially",
         "EMM 14/4/2019",
         "",
         paste(edon, edo),
         "")
#
# get state's filenames
pth <- paste("/home/eric/Desktop/MXelsCalendGovt/municipiosInafed/codigoFuente", edo, sep = "/")
targets <- dir(pth)
#
for (i in 1:length(targets)){ # loop over municipios
    #i <- 15 # debug
    tmp <- readLines(paste(pth, targets[i], sep = "/")) # get source code
    ## #
    tmp <- gsub("&(.)acute;", "\\1", tmp) # drop acentos
    tmp <- gsub("&ntilde;", "ñ", tmp) # change ñ
    tmp <- gsub("&ugrave;", "ü", tmp) # change ü
    tmp <- gsub("<U[+]00E1>", "a", tmp) # change á
    tmp <- gsub("<U[+]00C1>", "A", tmp) # change Á
    tmp <- gsub("<U[+]00E9>", "e", tmp) # change é
    tmp <- gsub("<U[+]00C9>", "E", tmp) # change É
    tmp <- gsub("<U[+]00ED>", "i", tmp) # change í
    tmp <- gsub("<U[+]00CD>", "I", tmp) # change Í
    tmp <- gsub("<U[+]00F3>", "o", tmp) # change ó
    tmp <- gsub("<U[+]00D3>", "O", tmp) # change Ó
    tmp <- gsub("<U[+]00FA>", "u", tmp) # change ú
    tmp <- gsub("<U[+]00DA>", "U", tmp) # change Ú
    tmp <- gsub("<U[+]00F1>", "ñ", tmp) # change ñ
    tmp <- gsub("<U[+]00D1>", "Ñ", tmp) # change Ñ
    tmp <- gsub("<U[+]00FC>", "u", tmp) # change ü
    tmp <- gsub("<U[+]00DC>", "U", tmp) # change Ü
    ## # municipio name
    sel <- grep("<title>.*</title>", tmp, ignore.case = TRUE)
    tit <- c(targets[i],
             sub(".*<title>(.*)</title>.*","\\1", tmp[sel[1]], ignore.case = TRUE)
             )
    ## # extract alcaldes table
    sel <- grep("Cronologia de los Presidentes Municipales", tmp)
    if (length(sel)==0) sel <- grep("Presidentes", tmp) # less restrictive in case no match
    tmp <- tmp[-c(1:sel[1])] # crop all above table
    sel <- grep("</table>", tmp, ignore.case = TRUE) # end
    tmp <- tmp[1:sel[1]] # crop below first table
    ## #
    ## ## tmp <- cleanFun(tmp) # remove html tags
    ## ## #tmp <- gsub("<U[+]00A0>", "", tmp) # drop special character
    ## ## tmp <- sub("[0-9]+[.][-]","",tmp) # drop numbering (confuses clean numbers below)
    ## ## tmp <- gsub("^[^0-9]+([0-9]+[-]?[0-9]*).*$", "\\1", tmp, perl = TRUE) # clean years
    ## ## tmp <- sub("^\\\"\\s+", "", tmp) # drop heading spaces
    ## ## tmp <- sub("\\b\\W+$", "", tmp) # drop all after last word
    ## ## sel <- grep("^$", tmp); tmp <- tmp[-sel] # drop empty lines
    ## ## sel <- grep("^Nombre del", tmp); tmp <- tmp[-sel] # useless line
    ## ## sel <- grep("^Periodo", tmp); tmp <- tmp[-sel] # useless lines
    ## ## #
    tmp <- c(tit,"",tmp) # add title
    ## #
    alc <- c(alc, "", tmp) # paste municipio's data
}
#

pth <- paste("/home/eric/Desktop/MXelsCalendGovt/municipiosInafed/alcaldes", paste(edo, ".txt", sep = ""), sep = "/")
write(alc, file = pth)
    
head(alc, 40)


#


tmp <- data.frame(ord = 1:length(tmp), text = tmp)
tmp <- tmp[order(tmp$text)]



tmp <- c(tit, tmp) # add title




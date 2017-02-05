library(stringr)
datIn <- readLines("Oscars_All_.txt")

anio <- 0
j <- 0
os_end <- data.frame( year = 0,  categ = 0, year = 0)
for( i in 1:length(datIn)) {
# for( i in 1:10) {
  print(i)
  if( str_detect(datIn[i], "\\(*st\\)|\\(*nd\\)|\\(*rd\\)|\\(*th\\)" ) == TRUE & word(datIn[i], 1) != "SCIENTIFIC" ) {
    anio <- anio + 1
    yea_tmp <- datIn[i]
  } else {
    if( str_detect(datIn[i], "NOTE") == TRUE ) { 
      next
    } else {
        if( str_detect(word(datIn[i],1),"[[:upper:]]+$" ) == TRUE) {
           cat_tmp <- datIn[i]
        } else { 
           j <- j + 1
           os_end[j, 1] <- yea_tmp
           os_end[j, 2] <- cat_tmp
           os_end[j, 3] <- datIn[i]
        }
      }
  }
  
}
write.table(os_end, file = "cat_year_win.txt", sep = "|", row.names = FALSE)

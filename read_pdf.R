library(tm)
library(pdftools)
# library(tabulizer)
library(dplyr)

filename = 'WARN-Report-for-7-1-2017-to-06-30-2018.pdf'
Rpdf <- readPDF(control = list(text = "-layout"))
mycorp = VCorpus(URISource(filename), 
                 readerControl = list(reader = Rpdf))

# readcontrol = list(reader=Rpdf)
df = as.data.frame(content(content(mycorp)[[1]]))
# this df is 14 observations (same as number of pages) and 1 variable.

# Option 1: The saved text file looks like a table, which should be readin again to produce a proper df.
# write.csv(df,'table.csv', row.names = F)
# read.csv('table.csv', skip = 3, stringsAsFactors = F)

# Option 2: convert the column to table directly

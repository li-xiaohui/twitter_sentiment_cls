library(stringr)

#Showcasing regex using reading addr table

# Read string data and split into data frame
dat = readLines("addr.txt")

# {n,m}
# The preceding item is matched at least n times, but not more than m times.

dat = as.data.frame(do.call(rbind, strsplit(dat, split=" {2,10}")), stringsAsFactors=FALSE)
names(dat) = c("LastName", "FirstName", "address", "city", "state", "zip")

# Separate address into number and street (if streetno isn't always numeric,
# () remembers matched pattern which can be recalled by \1
# or if you don't want it to be numeric, then just remove the as.numeric wrapper).
dat$streetno = as.numeric(gsub("([0-9]{1,4}).*","\\1",  dat$address))
dat$streetname = gsub("[0-9]{1,4} (.*)","\\1",  dat$address)

# Clean up zip by replacing O and 0
dat$zip = gsub("O","0", dat$zip)
dat$zip = str_trim(dat$zip)




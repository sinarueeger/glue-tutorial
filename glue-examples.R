## Teaching glue
## --------------

## install.packages("glue")

library(glue)
library(dplyr) ## for data

apropos("glue")


## glue two scalars
## ---------------------
animals <- "Elephants"
number <- 3
glue("There were {animals}")
glue("There were {number} {animals}")

## collapse vector
## ---------------
## > paste(,... )
genes <- c("FTO", "PSCK3", "DTN3", "sadlfkjsdlfjsldfjlsdjf")
glue_collapse(genes, sep = ", ", last = " and ")

## same as paste(genes, collapse = ", ")

## with pipe > df output
## -----------------------
starwars %>% select(name, homeworld) %>% mutate(name_homeworld = glue("{name} ({homeworld})"))
## same as 
## starwars %>% select(name, homeworld) %>% mutate(hame_homeworld = paste(name, " (", homeworld, ")", sep = ""))

## with pipe > vector output
## -----------------------
starwars %>% glue_data("{name} ({homeworld})", .na = "unknown")
## same as paste(starwars$name, " (", starwars$homeworld, ")", sep = "")

## store file
## -----------------------
dat <- starwars %>% select(name, homeworld) 
dir <- "/Users/rueger/Projects/" 
filename <- "table_1.txt"

write_tsv(dat, path = glue("{dir}{filename}"))

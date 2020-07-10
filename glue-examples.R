## Glue numbers and letters in R
## Slides: https://sinarueeger.github.io/glue-tutorial/slides/slides#1
## ////////////////////////////////////////////////////////////////////////////

## install.packages("glue")
library(glue)
library(dplyr)

## glue two scalars ---------------------

animals <- "Elephants"
number <- 3
glue("There were {animals}")

glue("There were {number} {animals}")

glue("There were {number} {animals}", number = 2, animals = "Giraffe")


## Exercise -----------------------------

## Tweak the following R command so that it returns:
## Yesterdays average temperature was 20.2 celsius.

metric <- "celsius"
temperature <- 20.2
glue("Yesterdays average temperature was [metric] [temperature].")

## collapse vector -----------------------

genes <- c("FTO", "PSCK3", "DTN3", "NRT")
glue_collapse(genes)
glue_collapse(genes, sep = " + ")

## Exercise ------------------------------

## Predict the output of the following R code and choose solution 1, 2 or 3 below.

trees <- c("pine", "fir", "cedar", "spruce", "hemlock")
glue_collapse(trees, sep = ",", last = "and")

# 1. `pine, fir, cedar, spruce and hemlock`
# 2. `pine,fir,cedar,spruceandhemlock`
# 3. `pine, fir, cedar, spruceandhemlock`


## create new column with pipe -----------

starwars %>% select(name, homeworld) %>% mutate(name_homeworld = glue("{name} ({homeworld})"))


## create new vector with pipe -----------

starwars %>% glue_data("{name} ({homeworld})", .na = "unknown")

## Exercise ------------------------------

## Given the data below, create an extra column id, 
## which is a combination of element and measure, 
## separated with an underscore (e.g. "1_A")

dat <- data.frame(element = c(1, 1, 2, 2), 
                  measure = c("A", "B", "A", "B"))

## store file ---------------------------

dat <- starwars %>% select(name, homeworld) 
dir <- "/Users/rueger/Projects/" 
filename <- "table_1.txt"

write_tsv(dat, path = glue("{dir}{filename}"))


## find out more about glue ---------------

apropos("glue")

# - https://glue.tidyverse.org/index.html
# - glue also appears in the `stringr` cheatsheet:
#   https://raw.githubusercontent.com/rstudio/cheatsheets/master/strings.pdf


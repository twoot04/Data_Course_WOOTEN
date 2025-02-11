# SETUP ####

## load packages ####
# install.packages("tidyverse") # if no already installed 
library(tidyverse)

## load data #### 
read_delim("./Data/DatasaurusDozen.tsv")
dat <- read.delim("./Data/DatasaurusDozen.tsv")
unique(dat$dataset)

star <- dat[dat$dataset == "star",] #practice subsetting 

plot(star$x,star$y)

filter(dat,dataset == "star")
iris
library(tidyverse)

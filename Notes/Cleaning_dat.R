library(tidyverse)
library(janitor)
library(skimr)
library(readxl)

dat <- read_csv("Data/Utah_Religions_by_County.csv")


names(dat)
skim(dat)

#to be an aesthetic on the plot, it has to have it's own column 


order <-
dat %>%
  clean_names() %>%
  pivot_longer(-c(county,pop_2010,religious), 
               names_to= "religion", 
               values_to = "proportion") %>%
  group_by(religion) %>%
  summarise(sum = sum(proportion)) %>%
  arrange(desc(sum))


  dat %>%
  clean_names() %>%
  pivot_longer(-c(county,pop_2010,religious), 
               names_to= "religion", 
               values_to = "proportion") %>%
  mutate(religion = factor(religion, levels = order$religion)) %>%
    ggplot(aes(x=religion, 
               y=proportion)) +
    geom_col() +
    facet_wrap(~county)
  
  

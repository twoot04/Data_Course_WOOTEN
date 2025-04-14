library(tidyverse)
install.packages("skimr")
library(skimr)
install.packages("janitor")
library(janitor)


dat <- read_csv("./Data/Bird_Measurements.csv") %>% clean_names()
skim(dat)

#what's wrong 
# - some columns have multiple variables in them 
# - need a column for sex 
# - get rid of _N columns 
# - extra dumb columns liek species number / mating system 


#split into m,f,u dfs 
#pivot longer 
#clean up names
#merge back together 

male<- dat %>% 
  select(-ends_with("_n")) %>%
  select(family,species_name,english_name,clutch_size,egg_mass,mating_system, 
         starts_with("m_")) %>%
  mutate(sex = "male") 
names(male)<- names(male) %>% str_remove("^m_")



female<-   
  dat %>%
  select(-ends_with("_N")) %>% 
  select(family,species_name,english_name,clutch_size,egg_mass,mating_system, 
         starts_with("f_"))  %>%
  mutate(sex = "female")
names(female)<- names(female) %>% str_remove("^f_")




unsexed<- 
  dat%>%
  select(-ends_with("_N")) %>%
  select(family,species_name,english_name,clutch_size,egg_mass,mating_system, 
         starts_with("unsexed_"))  %>%
  mutate(sex = "unsexed")
names(unsexed)<- names(unsexed) %>% str_remove("^unsexed_")



dat <-
  male %>%
  full_join(female)%>%
  full_join(unsexed)

dat %>%
  ggplot(aes(x = tarsus, 
             y = mass, 
             colour = sex)) +
  geom_point() + 
  geom_smooth()



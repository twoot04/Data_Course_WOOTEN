library(palmerpenguins)
library(tidyverse)
install.packages("ggimage")
install.packages("gganimate")
library(ggimage)
library(gganimate)
install.packages("GGally")
library(GGally)


penguins %>% 
  ggplot(aes(x = bill_length))


dat <- penguins


#str_ will use all the time


p<-
penguins %>%
  filter(!is.na(body_mass_g), !is.na(sex)) %>%
  mutate(sex = recode(sex, 'female' = 'Female', 'male' = 'Male')) %>%
  #could do mutate(sex=sex %>% str_to_sentence()) %>%
  ggplot(aes(x = flipper_length_mm, 
             y = body_mass_g, 
             colour = species)) + 
  geom_point() +
  theme_bw() +
  stat_ellipse() +
  facet_wrap(~ sex) + 
  labs(x = "Flipper Length (mm)", 
       y = "Body Mass (g)", 
       color= "Species") 

  p + gganimate::transition_states(species) + gganimate::ease_aes()

  scale_color_brewer()
  
  
  
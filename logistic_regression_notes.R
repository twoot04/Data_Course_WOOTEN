library(tidyverse)
library(easystats)
library(palmerpenguins)


#model penguins 
# response = "sex"

dat <- 
  penguins %>%
  dplyr::filter(!is.na(sex)) %>% 
  #mutate(male = sex=="male") %>%
  mutate(male = case_when(sex == "male" ~ TRUE, 
                          TRUE ~ FALSE))

names(dat)

mod1 <- 
  glm(data = dat %>% select(-sex), 
      formula = male ~ ., 
      family = 'binomial')

summary(mod1)


dat <-
  dat %>% 
  mutate(pred = predict(mod1, dat, type = "response"))

dat %>%
  ggplot(aes(x = body_mass_g, 
             y = pred, 
             color = sex )) + 
  geom_point() 


dat <-
dat %>% 
  mutate(error = pred > .5) %>% 
  mutate(success = male == error) 

dat$success %>% summary  
  


x <-read_csv("./Data/GradSchool_Admissions.csv")

mod2 <- 
  glm(data = x, formula = admit ~ (gre + gpa) * factor(rank), 
      family = 'binomial')

  x %>% 
  mutate(pred = predict(mod2, x, type = 'response')) %>%
    ggplot(aes(x = gpa, 
              y = pred, 
              color = factor(rank))) + 
           geom_point() +
           geom_smooth() +
           theme_dark()

report(mod2)

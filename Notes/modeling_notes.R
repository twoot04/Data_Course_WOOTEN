library(tidyverse)
install.packages("easystats")
library(easystats)

iris

#lets predict sepal length
#using only species 

mod1<- 
  iris %>% glm(data = ., 
               formula = Sepal.Length ~ Species) #predict sepal.length as
# a function of sp: categorial predictor 

mod1 %>% summary()

iris %>% group_by(Species) %>%
  summarise(sl = mean(Sepal.Length))

mod2 <- 
  iris%>%glm(data = ., 
             formula = Sepal.Length~ Species + Sepal.Width)
mod2 %>% summary()

mod3 <- 
  iris%>% glm(data = ., 
              formula = Sepal.Length ~ Species * Sepal.Width) 
#* is an interactive term, learn the interaction between the two


summary(mod3)


compare_models(mod1, mod2, mod3) %>% plot()
compare_performance(mod1, mod2, mod3) %>% plot()
#mod2 is the best because it has the biggest area. best in all measurements
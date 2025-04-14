library(tidyverse)
library(easystats)
library(MASS)
library(caret)
install.packages("caret")


dplyr::select 
#make 2 vectors of random numbers drawn from normal/gaussinan distribution 
x <- rnorm(100,100) # 100 numbers, mean of 100
y <- rnorm(100,99.9) #100 numbers, mean of 99

t.test(x,y) #do a t-test to see if means are statistically different

#plot distributions 
data.frame(x,y) %>% 
  pivot_longer(everything()) %>% 
  ggplot(aes(x=value,fill=name)) + 
  geom_density(alpha=.5)

#run a linear regression (instead of a t-test) 
data.frame(x,y) %>% 
  pivot_longer(everything()) %>%
  glm(data=., 
      formula = value ~name) %>%
  summary()




library(palmerpenguins)
#make 3 models predicting body_mass_g 
penguins %>% glimpse

mod1 <- 
  penguins %>% 
  glm(data = ., 
      formula = body_mass_g ~ species)

mod1 %>% summary()

mod2 <- 
  penguins %>% 
  glm(data = ., 
      formula = body_mass_g ~ island)

mod2 %>% summary()

mod3 <- 
  penguins %>%
  glm(data = ., 
      formula = body_mass_g ~ sex)

mod3 %>% summary()

compare_models(mod1, mod2, mod3) %>% plot()
compare_performance(mod1, mod2, mod3) %>% plot()

mod4<-  
  glm(data = penguins, 
      formula = body_mass_g ~ .^2)

step <- stepAIC(object = mod4)
step$formula
mod5 <- 
  glm(data = penguins, 
      formula = step$formula)

compare_performance(mod1, mod2, mod3, mod4, mod5) %>% plot()
new_penguin <- 
  data.frame(species="Adelie", 
             island="Torgersen", 
             bill_length_mm=40, 
             bill_depth_mm=20, 
             flipper_length_mm=500, 
             sex="female", 
             year=2007)
predict(object = mod5, newdata = new_penguin)
penguins$preds <- predict(mod5,penguins)


ggplot(penguins, aes(x=body_mass_g, 
                     y = preds)) +
  geom_point() +
  geom_smooth(method = 'lm')
#cross-validation 
dat <- penguins[complete.cases(penguins),]
train_rows <- caret::createDataPartition(y = dat$body_mass_g, 
                           p = .5, )
train <- dat[train_rows$Resample1,]
test <- dat[-train_rows$Resample1,]


mod_xval <- 
  glm(data = train, 
      formula = step$formula)
xval_preds<- predict(mod_xval, newdata = test)

test %>% 
  mutate(xval_preds=xval_preds) %>%
  ggplot(aes(x = body_mass_g, 
             y=xval_preds)) +
  geom_point() +
  geom_smooth(method = 'lm') 
model_performance(mod_xval)
model_performance(mod5)
check_model(mod_xval)
report(mod_xval)

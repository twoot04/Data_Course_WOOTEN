library(tidyverse)
library(easystats)
library(janitor)
library(modelr)
library(caret)
library(MASS)

#1 1. Read in the unicef data (10 pts) 

dat <- read_csv("unicef-u5mr.csv")

#2. Get it into tidy format (10 pts) 3. 
#Plot each country’s U5MR over time (20 points)

dat_cleaner <-
dat %>% 
  clean_names() %>%
  pivot_longer(col=starts_with("u5mr"), 
               names_to = "year", 
               values_to = "u5mr",
               values_drop_na = TRUE) %>%
  mutate(year=as.numeric(gsub("u5mr_", "", year))) 

#plot 1
dat_cleaner %>%
 ggplot(aes(x=year, 
             y = u5mr, 
            group = country_name)) + 
  geom_line() + 
  facet_wrap(~continent) + 
  labs(x = "Year", 
       y = "U5MR")

#save of plot 3
plot_1 <- dat_cleaner %>%
  ggplot(aes(x=year, 
             y = u5mr, 
             group = country_name)) + 
  geom_line() + 
  facet_wrap(~continent) + 
  labs(x = "Year", 
       y = "U5MR")

#4 save plot
ggsave(filename = "WOOTEN_Plot_1.png", plot = plot_1, dpi = 300)

#5 plot that shows mean for all countries

mean_data <- dat_cleaner %>%
  group_by(continent, year) %>%
  summarise(mean_u5mr = mean(u5mr, na.rm = TRUE)) %>%
  ungroup()

#plot of 2
mean_data %>%
  ggplot(aes(x = year, 
             y = mean_u5mr, 
             colour = continent)) +
  geom_line(linewidth = 1) + 
  labs(x = "Year", 
       y = "Mean_U5MR")

#save of plot2 
plot_2<- mean_data %>%
  ggplot(aes(x = year, 
             y = mean_u5mr, 
             colour = continent)) +
  geom_line(linewidth = 1) + 
  labs(x = "Year", 
       y = "Mean_U5MR")


#6 save plot 

ggsave(filename = "WOOTEN_Plot_2.png", plot = plot_2, dpi = 300)

#7 create 3 models 
#mod1 should account for only Year
#mod2 should account for Year and Continent
#mod3 should account for Year, Continent, and their interaction term

mod1 <- dat_cleaner %>%
  glm(data = ., 
      formula = u5mr ~ year)

mod2 <- dat_cleaner %>%
  glm(data = ., 
      formula = u5mr ~ year + continent)

mod3 <- dat_cleaner %>%
  glm(data = ., 
      formula = u5mr ~ year * continent)

#8. Compare the three models with respect to their performance

compare_models(mod1,mod2,mod3)

compare_performance(mod1,mod2,mod3) 

compare_performance(mod1,mod2,mod3) %>% plot()
#I believe mod3 will be the most accurate using the death rate as a function of 
#year and the continent and their interaction 


#9. Plot the 3 models’ predictions like so: (10 pts)

df <- gather_predictions(dat_cleaner, mod1, mod2, mod3)

#plot of 3 
  df %>% 
  ggplot(aes(x = year, 
             y = pred, 
             color = continent)) + 
  geom_line(linewidth=1) +
  labs(x = "Year", 
       y = "Predicted U5MR", 
       title = "Model predictions") + 
  facet_wrap(~model)

#saving plot 3
plot_3<- 
  df %>% 
  ggplot(aes(x = year, 
             y = pred, 
             color = continent)) + 
  geom_line(linewidth=1) +
  labs(x = "Year", 
       y = "Predicted U5MR", 
       title = "Model predictions") + 
  facet_wrap(~model)

ggsave(filename = "WOOTEN_plot_3.png", plot = plot_3, dpi = 300)

#10 BONUS - Using your preferred model, predict what the U5MR would be for 
#Ecuador in the year 2020. The real value for Ecuador for 2020 was 13 under-5 
#deaths per 1000 live births. How far off was your model prediction???
  
ecuador_2020 <- 
  data.frame(continent = "Americas", 
             country_name= "Ecuador", 
             year=2020)
ecuador_2020$pred <- predict(object = mod3, newdata = ecuador_2020)
ecuador_2020$acutal <- 13

ecuador_2020$error <- abs(ecuador_2020$pred - ecuador_2020$acutal)

mod4 <- glm(u5mr ~ year * continent, family = gaussian(link = "log"), 
            data = df)



ecuador_2020$revised_predict <- predict(mod4, newdata = ecuador_2020, 
                                        type = "response")

print(ecuador_2020)

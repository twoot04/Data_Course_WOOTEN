library(tidyverse)
install.packages("dplyr")
library(dplyr)

#I. 
read.csv("Exams/Exam_1/data/cleaned_covid_data.csv")
cleaned_covid_data.csv
dat<- read.csv("Exams/Exam_1/data/cleaned_covid_data.csv")

#II. 
A_states <- dat[grepl("^A", dat$Province_State),]
A_states

# III. 
A_states %>%
  mutate(Last_Update = as.Date(Last_Update)) %>%
ggplot(aes(x = Last_Update, 
             y = Deaths)) + 
  geom_point() +
  geom_smooth(method = "loess", se = FALSE, colour = "blue")+
  facet_wrap(~ Province_State, scales = "free_y") +
  theme_minimal() + 
  labs(title = "A States with Confirmed Deaths Over Time", 
       x = "Date", 
       y = "Deaths")
  
#IV. 
state_max_fatality_rate <- dat$Province_State %>%
  max(dat$Case_Fatality_Ratio, na.rm = TRUE)
state_max_fatality_rate

states<- dat$Province_State

states<- dat %>% 
  group_by(Province_State) %>% 
  summarise(all_fatality_rates = list(Case_Fatality_Ratio), 
    .groups = "drop") %>%

state_max_fatality_rate <- states%>% 
  mutate(Maximum_Fatality_Ratio = sapply(all_fatality_rates, 
                                    max, 
                                    na.rm = TRUE))


state_max_fatality_rate<- state_max_fatality_rate %>% 
  arrange(desc(Maximum_Fatality_Ratio)) %>% 
  select(Province_State, Maximum_Fatality_Ratio) %>% 
  na.omit()

# V. plot
state_max_fatality_rate %>% 
  filter(!is.na(Maximum_Fatality_Ratio)) %>% 
  mutate(Province_State = reorder(Province_State,
                                  -Maximum_Fatality_Ratio)) %>%
  ggplot(aes(x = Province_State, 
             y = Maximum_Fatality_Ratio)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  theme_minimal() +
  labs(title = "Maximum Fatality Ratio Per State", 
       x = "State", 
       y = "Maximum Fatality Ratio (%)") + 
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))

library(tidyverse)

dat <- read.csv("FacultySalaries_1995.csv")

# task 1 laod and clean data # 

# pull out tier, salary and rank 

dat1 <- dat %>%  
  filter(Tier %in% c("I", "IIA", "IIB")) %>%
  select("Tier", 
         Full="AvgFullProfSalary", 
         Assoc="AvgAssocProfSalary", 
         Assist="AvgAssistProfSalary", 
         "State"
  ) %>%
  pivot_longer(cols = c("Full", "Assoc", "Assist"), 
               names_to = "Rank", 
               values_to = "Salary")

dat1 %>% 
  ggplot(aes(x = Rank, 
             y = Salary, 
             fill = Rank)) + 
  geom_boxplot() + 
  facet_wrap(~Tier) + 
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45))


#Task 2 

anova_model <- aov(Salary ~ State + Tier + Rank, data = dat1)
summary(anova_model)

# Task 3 

juniper <- read_csv("Juniper_Oils.csv")
# List of compounds
compounds <- c("alpha-pinene","para-cymene","alpha-terpineol","cedr-9-ene","alpha-cedrene",
               "beta-cedrene","cis-thujopsene","alpha-himachalene","beta-chamigrene",
               "cuparene","compound 1","alpha-chamigrene","widdrol","cedrol","beta-acorenol",
               "alpha-acorenol","gamma-eudesmol","beta-eudesmol","alpha-eudesmol",
               "cedr-8-en-13-ol","cedr-8-en-15-ol","compound 2","thujopsenal")
# Tidy data
juniper_long <- juniper %>%
  select(YearsSinceBurn, all_of(compounds)) %>%
  pivot_longer(cols = -YearsSinceBurn, 
               names_to = "ChemicalID", 
               values_to = "Concentration")


#Task4
juniper_long %>%
  ggplot(aes(x = YearsSinceBurn, 
             y = Concentration)) + 
  geom_smooth(method = "loess", se = TRUE, color = "blue") +
  facet_wrap(~ ChemicalID, scales = "free_y") + 
  theme_minimal() + 
  labs(x = "YearsSinceBurn", y = "Concentration")



#Task 5
glm_results <- juniper_long %>%
  group_by(ChemicalID) %>%
  nest() %>%
  mutate(
    model = map(data, ~ lm(Concentration ~ YearsSinceBurn, data = na.omit(.x))),
    tidied = map(model, tidy)
  ) %>%
  unnest(tidied) %>%
  filter(term == "YearsSinceBurn", p.value < 0.05) %>%  # Relaxed threshold
  select(ChemicalID, estimate, std.error, statistic, p.value) %>%
  rename(term = ChemicalID)

glm_results







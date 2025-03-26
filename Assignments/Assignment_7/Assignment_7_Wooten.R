library(tidyverse)
df <- read.csv("../../Data/Utah_Religions_by_County.csv", stringsAsFactors = FALSE)


df <- df %>%
  select(-Religious)  

glimpse(df)

df_tidy <- df %>%
  pivot_longer(cols = -c(County, Pop_2010),  
               names_to = "Religion",
               values_to = "Proportion")

df_tidy <- df_tidy %>%
  rename(county = County, population = Pop_2010, religion = Religion, proportion = Proportion) %>%
  mutate(religion = str_replace_all(religion, "_", " "))


glimpse(df_tidy)


ggplot(df_tidy, aes(x = proportion)) +
  geom_histogram(bins = 30, fill = "steelblue", color = "black") +
  labs(title = "Distribution of Religious Proportions Across Counties",
       x = "Proportion of Adherents", y = "Count")

top_religions <- df_tidy %>%
  group_by(religion) %>%
  summarise(mean_proportion = mean(proportion, na.rm = TRUE)) %>%
  arrange(desc(mean_proportion)) %>%
  top_n(10)

ggplot(top_religions, aes(x = reorder(religion, mean_proportion), y = mean_proportion)) +
  geom_col(fill = "darkgreen") +
  coord_flip() +
  labs(title = "Top 10 Religions by Average Proportion in Utah Counties",
       x = "Religion", y = "Average Proportion")


ggplot(df_tidy, aes(x = proportion, y = reorder(religion, proportion, median, na.rm = TRUE))) +
  geom_boxplot(outlier.size = 1, fill = "purple", alpha = 0.6) +
  labs(title = "Spread of Religious Proportions Across Counties",
       x = "Proportion of Adherents", y = "Religion")


ggplot(df_tidy, aes(x = county, y = proportion, fill = religion)) +
  geom_bar(stat = "identity") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  labs(title = "Religious Diversity Across Counties",
       x = "County", y = "Proportion of Adherents")

df_selected <- df_tidy %>%
  filter(religion %in% c("LDS", "Catholic")) %>%
  spread(religion, proportion)  # Reshaping data for scatter plot

ggplot(df_selected, aes(x = LDS, y = Catholic)) +
  geom_point(color = "blue", alpha = 0.6) +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(title = "Scatter Plot: LDS vs. Catholic Proportion by County",
       x = "LDS Proportion", y = "Catholic Proportion")

write.csv(df_tidy, "Utah_Religions_Tidy.csv", row.names = FALSE)

correlation_population <- df_tidy %>%
  group_by(religion) %>%
  summarise(correlation = cor(population, proportion, use = "complete.obs"))

ggplot(correlation_population, aes(x = reorder(religion, correlation), y = correlation)) +
  geom_bar(stat = "identity", fill = "blue") +
  coord_flip() +
  labs(title = "Correlation: County Population vs. Religious Group Proportion",
       x = "Religious Group", y = "Correlation Coefficient")


religions <- read_csv("Utah_Religions_Tidy.csv")

religion_wide <- religions %>%
  select(county, religion, proportion) %>%
  pivot_wider(names_from = religion, values_from = proportion, values_fill = 0)

cor_results <- religion_wide %>%
  select(-county) %>%
  cor(use = "pairwise.complete.obs")


non_rel_corr <- cor_results["Non.Religious", ] %>% sort()

print(non_rel_corr)


model <- lm(Non.Religious ~ LDS, data = religion_wide)

summary(model)

ggplot(religion_wide, aes(x = LDS, y = Non.Religious)) +
  geom_point(color = "darkred") +
  geom_smooth(method = "lm", se = TRUE, color = "black") +
  labs(
    title = "LDS Proportion vs Non-Religious Proportion",
    x = "LDS Proportion",
    y = "Non-Religious Proportion"
  ) +
  theme_minimal()



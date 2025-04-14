library(tidyverse)
dir.create("./figures")


p1<-
iris %>% 
  ggplot(aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point()
ggsave(filename = "./figures/basic_plot.png",
       width = 6, 
       height = 6, 
       dpi = 300)


# Clean Data 

# Every row is a single observation 
# Every column is a single variable 
# That's it 

iris %>% View()
table1
table2
table3
table4a
table4b
table5



table3 %>% 
  separate(rate, into =c("cases", "population"), convert = TRUE)

table5 %>%
  separate(rate, into =c("cases", "population"), convert = TRUE) %>%
  mutate(year = paste0(century,year) %>% as.numeric) %>%
  select(- century)


table2%>%
  pivot_wider(names_from = type, values_from = count)


table4a %>%
  pivot_longer(cols = c("1999","2000"), 
               names_to = "year", 
               values_to = "cases", 
               names_transform = as.numeric) %>%
  full_join(
    
    table4b %>%
      pivot_longer(cols = c("1999","2000"), 
                   names_to = "year", 
                   values_to = "population", 
                   names_transform = as.numeric)
    
  )


full_join(table4c, table4d)




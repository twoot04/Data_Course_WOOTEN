library(tidyverse)
install.packages("palmerpenguins")
library(palmerpenguins)
install.packages("RColorBrewer")
library(RColorBrewer)
display.brewer.all()

#filter for not having point in 
#filter(!is.na()) %>% 
#sex, bill_length_mm, flipper_length_mm, species

sex <- NA.omit(na)
dat<- penguins
sex<- penguins$sex
bill_length <- penguins$bill_length_mm

penguins %>% 
  filter(!is.na(sex)) %>%
  ggplot(aes(x=bill_length_mm,
             y=flipper_length_mm,
             color = sex)) +
  geom_point()+
  facet_wrap(~species)


# plot of male penguins only 
# show body mass for each species 


grad <- RColorBrewer::brewer.pal(name = "PuRd", n=3)

penguins %>% 
  filter(penguins$sex == "male")%>%
  ggplot(aes(x = species, 
             y = body_mass_g, 
             fill = species)) +
  geom_boxplot(color = 'grey40') +
  geom_jitter(width = 0.1, 
              color= 'black',
              alpha = .2,
              size = 10,
              aes(shape = species)) +
  labs( title = "Body Mass vs. Male",
        x = "Species",
        y = "Body Mass(g)") +
  theme_minimal() + 
  theme(panel.grid.major = element_line(color="black"), 
        panel.grid.minor = element_line(color="grey50")) +
  scale_fill_viridis_d(option = "inferno",end =0.8,begin=0.3) + 
  scale_shape_manual(values = c(8,11,23)) +
  theme(plot.background = element_rect(fill="yellow"), 
        legend.title = element_text(face= 'bold',
                                    angle=71,
                                    hjust = .5,
                                    color = "orange", 
                                    size=26), 
        axis.title = element_text(color="#f705cb", size=22), 
        legend.text = element_text(angle = 180)) 
  
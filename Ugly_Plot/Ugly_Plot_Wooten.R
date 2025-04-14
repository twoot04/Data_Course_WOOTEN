library(tidyverse)
dat <- iris


ugly_plot<- 
dat %>%
  ggplot(aes(x = Petal.Width, 
             y = Petal.Length)) + 
  geom_point(color = "red", size = 12, shape = 5) + 
  theme(panel.background = element_rect(fill = "#FFFF00"),
        axis.title.x = element_text(size = 2, 
                                    angle = 75,
                                    vjust = .3, 
                                    colour = "green"), 
        axis.text.x = element_text(color = "lightblue", 
                                   size = 4, 
                                   angle = 83,), 
        axis.title.y = element_text(size = 25, 
                                    color = "turquoise", 
                                    angle = -45), 
        axis.text.y = element_text(color = "white", 
                                   size = 4, 
                                   angle = 2), 
        plot.background = element_rect(fill = "green"), 
        panel.grid.major = element_line(color = "blue", 
                                        linetype = "dashed", 
                                        size = 10), 
        panel.grid.minor = element_line(size = 8, 
                                        color = "orange", 
                                        linetype = "twodash"))
ggsave("ugly_plot.png", width = 6, height = 4, dpi = 300)        



library(tidyverse)
dat <- data("mtcars")
library(RColorBrewer)
brewer.pal.info
install.packages("jpeg")
library(jpeg)
library(grid)


mtcars %>% 
  filter(!is.na(mpg)) %>% 
  ggplot(aes(x = mpg, 
             y = cyl)) +
  annotation_custom(img_raster, xmin = -Inf, 
                    xmax = Inf, 
                    ymin = -Inf, 
                    ymax = Inf)
  geom_point(aes(colour = hp)) + 
  labs(title = "MPG vs. type of car", 
       x = "mpg", 
       y = "Cyl") +
  theme(plot.background = element_rect(fill = "yellow"),
    axis.ticks.r = element_line(size = 10, 
                                    colour = "steelblue"),
    axis.title.x = element_text(size = 8, 
                                    colour= "yellow", 
                                    hjust = .3, 
                                    vjust = .4, 
                                    angle = 90),
    title = element_text(colour = "yellow", 
                         hjust = .5, 
                         vjust = .5),
    plot.title = element_text(colour = "green", 
                              hjust = .3, 
                              vjust = .2, 
                              angle = 87),
    rect = element_rect("red") 
        )
img <- readJPEG(source = "~/Library/Mobile Documents/com~apple~CloudDocs/Downloads/DSC09701-Enhanced-NR.jpg")

img_raster <- rasterGrob(img, width = unit(1, "npc"), 
                         height = unit(1, "npc"))


ggplot(mtcars, aes(x = mpg, y = cyl)) +
  annotation_custom(img_raster, xmin = -Inf, xmax = Inf, ymin = -Inf, ymax = Inf) +  # Add background
  geom_point(aes(colour = hp)) + 
  labs(title = "MPG vs. Type of Car", x = "MPG", y = "Cyl") +
  theme(
    plot.background = element_rect(fill = "yellow"),
    axis.ticks.y = element_line(size = 1, colour = "steelblue"),
    axis.title.x = element_text(size = 8, colour = "yellow", hjust = .3, vjust = .4, angle = 90),
    title = element_text(colour = "yellow", hjust = .5, vjust = .5),
    plot.title = element_text(colour = "green", hjust = .3, vjust = .2, angle = 87)
  )


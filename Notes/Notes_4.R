library(tidyverse)
ggplot(data = faithful, 
       mapping = aes(x = eruptions, 
                     y = waiting)) + 
  geom_point()
ggplot(faithful) + 
  geom_point(aes(x = eruptions, 
                 y = waiting), 
                 colour = "steelblue")
ggplot(faithful) + 
  geom_histogram(aes(x = eruptions))

ggplot(faithful, aes(x = eruptions, y = waiting)) + 
  geom_density_2d() +
  geom_point()

ggplot(faithful) + 
  geom_point(aes(x = eruptions, y = waiting), 
             shape = 'square', 
             alpha = 0.3)

ggplot(faithful) + 
geom_histogram(aes(x = eruptions, 
               fill = eruptions < 3.1))

ggplot(faithful) + 
  geom_histogram(aes(x = eruptions, 
                     fill = waiting < 60), 
                 position = "dodge", alpha = 0.3)

ggplot(faithful) + 
  geom_point(aes(x = eruptions, y = waiting)) +
  geom_abline(slope = -40, intercept = 200)

data(mtcars)
dat <- mtcars

ggplot(mpg) + 
  geom_bar(aes(x = class))

mpg_counted <- mpg %>% 
  count(class, name = 'count')


ggplot(mpg_counted) + 
  geom_bar(aes(x = class, y = count), 
           stat = 'identity')

ggplot(mpg) + 
  geom_bar(
    aes(
      x = class, 
      y = after_stat(100 * count / sum(count))
    )
  )
    )
  )


ggplot(mpg) + 
  geom_point(aes(x = displ, 
                 y = hwy,
                 colour = class)) + 
  scale_color_brewer(type = 'qual')

ggplot(mpg) + 
  geom_point(aes(x = displ, 
                 y = hwy, 
                 colour = class, 
                 size = cyl)) +
  scale_color_brewer(type = 'qual') + 
  scale_size_area(breaks = c(4, 5, 6, 8))


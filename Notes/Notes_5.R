data(iris)

dat<- iris

petal_length <- iris$Petal.Length
petal_width <- iris$Petal.Width


ggplot(iris) +
  geom_point(aes(x = petal_width, y = Petal.Length), 
             color = "violet", alpha = 0.5) +
  theme_minimal()+
  theme(axis.text = element_text(color = "black", size = 8))





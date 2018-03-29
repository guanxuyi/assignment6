#install.packages('ggmap')
library(ggmap)
library(tidyverse)

bude <- geocode("Bude, England") 
beach1 <- geocode("Summerleaze Beach") #blue
beach2 <- geocode("Crooklets Beach") #green
club <- geocode("Bude Social Club") #red
pub <- geocode("The Carriers Inn") #purple

roadmap <- get_map('Bude', zoom = 14)
ggmap(roadmap) +
  geom_point(
    aes(x = -4.551312 , y = 50.83074),
    color = "blue", size = 2) +
  geom_point(
    aes(x = -4.553962 , y = 50.83587),
    color = "green", size = 2) +
  geom_point(
    aes(x = -4.545369, y = 50.82959),
    color = "red", size = 2) +
  geom_point(
    aes(x = -2.669208, y =53.24418),
    color = "purple", size = 2)


watermap <- get_map('Bude', zoom = 14, maptype = 'watercolor')
ggmap(watermap) +
  geom_point(
    aes(x = -4.551312 , y = 50.83074),
    color = "blue", size = 2) +
  geom_point(
    aes(x = -4.553962 , y = 50.83587),
    color = "green", size = 2) +
  geom_point(
    aes(x = -4.545369, y = 50.82959),
    color = "red", size = 2) +
  geom_point(
    aes(x = -2.669208, y =53.24418),
    color = "purple", size = 2)
 


#### Route from cricket grounds to pub
from <- "Bude Social Club"
to <- "The Carriers Inn"
r <- route(from, to, structure = "route")
ggmap(roadmap) + 
  geom_path(aes(x = lon, y = lat), color = "blue", size = 1, data = r, lineend = "round")
ggmap(watermap) + 
  geom_path(aes(x = lon, y = lat), color = "red", size = 1, data = r, lineend = "round")


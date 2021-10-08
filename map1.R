
library(ggplot2)
library(maps)
library(dplyr)


MainStates <- map_data("state")

StatePopulation <- read.csv("https://raw.githubusercontent.com/ds4stats/r-tutorials/master/intro-maps/data/StatePopulation.csv", as.is=TRUE)
str(MainStates)
str(StatePopulation)


ggplot() + geom_polygon(data=MainStates, aes(x=long, y=lat, group=group), color="black", fill="lightblue")


MergedStates <- inner_join(MainStates, StatePopulation, by="region")


p <- ggplot()

p <- p + geom_polygon(data=MergedStates, aes(x=long, y=lat, group=group, fill = population/1000000), color="white", size = 0.2)



p


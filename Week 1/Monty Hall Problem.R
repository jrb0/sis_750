library(tidyverse)
library(knitr)
setwd("/Users/jrbachrach/Documents/sis_750")

#simulation
#create the doors

doors <- c('A', 'B', 'C')

# create our scorecard
results <- tibble(
  trial = 1:10000,
  winner = NA
)

car <- sample(doors, 1) 
choice <- sample(doors, 1) 
reveal <- sample(doors[doors != car & doors != choice], 1)
switch <- sample(doors[doors != reveal & doors != choice], 1)

results[1, 'winner'] <- if_else(car == switch, 'Marilyn', 'Paul')

for(i in 1:10000){
  car <- sample(doors, 1)
  choice <- sample(doors, 1) 
  reveal <- sample(doors[doors != car & doors != choice], 1)
  switch <- sample(doors[doors != reveal & doors != choice], 1)
  
  results[i, 'winner'] <- if_else(car == switch, 'Marilyn', 'Paul')
}

results %>%
  count(winner) #equivalent to count(results, winner)
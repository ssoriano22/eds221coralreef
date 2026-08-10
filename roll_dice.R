#!/usr/bin/env Rscript

# Roll Dice R Script
# Description: an R script to randomly generate two die rolls.

#Set random seed
set.seed(123)

#Assign numerics to d6 die
die <- 1:6
#Roll two die (w/ replacement - 1:6 are available for both die rolls)
rolls <- sample(die, size = 2, replace = TRUE)
#Store sum of both d6 rolls
roll_total <- sum(rolls)
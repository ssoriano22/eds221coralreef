#!/usr/bin/env Rscript

# Roll Dice R Script
# Description: an R script to randomly generate two die rolls.

set.seed(123)
die <- 1:6
rolls <- sample(die, size = 2, replace = TRUE)
roll_total <- sum(rolls)
#!/usr/bin/env Rscript

# R script containing utility functions for coral reef model

# Roll Dice
roll2d6 <- function() {
  d6_total <- sum(sample(1:6, size = 2, replace = TRUE))
  return(d6_total)
}

# Roll Dice
roll1d8 <- function() {
  d8_total <- sample(1:8, size = 1, replace = TRUE)
  return(d8_total)
}

# Coral Growth Direction
growth <- function(g_reef, roll, row, col) {
  # Set growth offsets for row and col (coral grows left(row-1)/right(row+1), down(col-1)/up(col+1))
  growth_row_offset <- c(-1, -1, -1, 0, 1, 1, 1, 0)
  growth_col_offset <- c(-1, 0, 1, 1, 1, 0, -1, -1)

  # Find growth coordinate (row, col) for new coral
  growth_row <- row + growth_row_offset[roll]
  growth_col <- col + growth_col_offset[roll]

  # Check if growth coordinate is in bounds of reef matrix
  in_bounds <- growth_row >= 1 &&
    growth_row <= nrow(g_reef) &&
    growth_col >= 1 &&
    growth_col <= ncol(g_reef)

  # Use an if statement to update the reef w/ growth ONLY IF we're in bounds
  if (in_bounds) {
    g_reef[growth_row, growth_col] <- 1
  }
  return(g_reef)
}

#In that script, write a function to encapsulate the logic for putting 8 random corals on the initialized reef.
# Rather than hard-coding the number at 8, make the number of corals an input.

# Set random seed
set.seed(32)

# Create a matrix - 5x5 of 0s
reef <- matrix(0, nrow = 5, ncol = 5)
reef

initialize_reef <- function(init_reef, num_init_coral) {
  # Calculate total number of reef cells
  tot_cells <- nrow(init_reef) * ncol(init_reef)
  # Select random cells equal to num_init_coral parameter
  r_cells <- sample(1:tot_cells, size = num_init_coral)
  #For each randomly selected cell:
  for (cell_label in r_cells) {
    # Find row
    cell_row <- (cell_label - 1) %/% nrow(init_reef) + 1
    # Find column
    cell_column <- (cell_label - 1) %% ncol(init_reef) + 1
    #TEST: print coordinate (best to test w/ num_init_coral=1)
    #print(paste(cell_row, cell_column, sep = ", "))
    # Fill reef matrix coordinate (row, column) w/ 1 (coral is present in that cell)
    init_reef[cell_row, cell_column] <- 1
  }
  # Return initialized reef matrix
  return(init_reef)
}

inital_reef <- initialize_reef(reef, 8)

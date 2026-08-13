#!/usr/bin/env Rscript

# R script containing utility functions for coral reef model

# Roll Dice
roll2d6 <- function() {
  total <- sum(sample(1:6, size = 2, replace = FALSE))
  return(total)
}

# Coral Growth Direction
growth <- function(reef, roll, row, col) {
  growth_row_offset <- c(-1, -1, -1, 0, 1, 1, 1, 0)
  growth_col_offset <- c(-1, 0, 1, 1, 1, 0, -1, -1)

  growth_row <- row + growth_row_offset[roll]
  growth_col <- col + growth_col_offset[roll]

  reef[growth_row, growth_col] <- 1

  return(reef)
}

#In that script, write a function to encapsulate the logic for putting 8 random corals on the initialized reef.
# Rather than hard-coding the number at 8, make the number of corals an input.

# 1) Write out expressions for logic

# Create a matrix - 5x5 of 0s
# reef <- matrix(0, nrow = 5, ncol = 5)
# reef

# Random sample 8 cell labels
# r_cells <- sample(1:25, size = 8)
# r_cells
# cell_label <- 12
# cell_row <- (cell_label - 1) %/% 5 + 1
# # Columns
# cell_column <- (cell_label - 1) %% 5 + 1
# # Fill matrix coordinate (row, column) w/ 1 (coral is present)
# reef_matrix[cell_row, cell_column] <- 1
# reef_matrix

# 2) Determine if the function needs any inputs - yes
# num_init_corals - the number of random corals to initialize the reef
# reef - the reef matrix

# 3) Write the function call

#initial_reef <- initialize_reef(reef, num_init_corals)

# 4) Put the expression(s) in a function definition

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

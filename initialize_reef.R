#!/usr/bin/env Rscript

# Pseudocode:

# Create a 5x5 matrix of 0s representing the coral reef
# Label the cells 1-25 such that the first row is 1-5, the second row is 6-10, etc
# Randomly sample 8 cell labels (without replacement)
# For each sample cell label:
#     Convert the cell label to a row index
#     Convert the cell label to a column index
#     Use the row and column indices to set the value of the matrix cell to 1
# Print the matrix

# Main code:

# Set random seed
set.seed(32)

# Create a matrix - 5x5 of 0s
reef_matrix <- matrix(0, nrow = 5, ncol = 5)
reef_matrix

# Random sample 8 cell labels
r_cells <- sample(1:25, size = 8)
r_cells

# For each sample cell label:
for (cell_label in r_cells) {
  # Rows
  #cell_label <- 12
  cell_row <- (cell_label - 1) %/% 5 + 1
  # Columns
  cell_column <- (cell_label - 1) %% 5 + 1
  # Fill matrix coordinate (row, column) w/ 1 (coral is present)
  reef_matrix[cell_row, cell_column] <- 1
  reef_matrix
}

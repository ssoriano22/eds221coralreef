set.seed(221)

# STEP 1: Initialize your reef
reef <- matrix(0,nrow = 5,ncol = 5)
random_coral <- sample(1:25, size = 8)
for (rc in random_coral) {
  rc_row <- (rc - 1) %/% 5 + 1
  rc_col <- (rc - 1) %% 5 + 1
  reef[rc_row, rc_col] <- 1
}
print(reef)

# Your reef should look like this:
#      [,1] [,2] [,3] [,4] [,5]
# [1,]    0    1    1    1    0
# [2,]    0    1    0    1    0
# [3,]    1    0    0    1    0
# [4,]    0    0    0    0    0
# [5,]    0    0    0    1    0

# STEP 2: Create vectors `years` and `coral_cover_pct`
years <- seq(2004, 2024, by = 2)
years
coral_cover_pct <- integer(length(years))

# Your vectors should look like this
# > years
#  [1] 2004 2006 2008 2010 2012 2014 2016 2018 2020 2022 2024
# > coral_cover_pct
#  [1] 0 0 0 0 0 0 0 0 0 0 0


# STEP 3: Calculate coral cover in the first year
# Hint: reef is all 1's and 0's, so the mean of the reef equals the percent cover.

coral_cover_pct[1] <- mean(reef)
coral_cover_pct

# Your coral cover percent should be:
# > coral_cover_pct
#  [1] 0.32 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00

# STEP 4: Loop over time. Call your iterator `t`. You've already calculated 
# percent cover for the first year, so start your sequence at 2. Fill in the 
# blank below.
for (t in 2:length(years)) {
  # STEP 5: Update current and previous reef
  # Copy reef to a new variable, prev_reef
  prev_reef <- reef
  # Wipe the new reef clean
  reef <- matrix(0, nrow = 5, ncol = 5)

  # STEP 6: Loop over the rows and columns. Call your iterators r and c.
  for (r in 1:nrow(reef)) {
    for (c in 1:ncol(reef)) {

      # STEP 7: Check for coral
      # Check if this cell had a coral in it in the previous reef
      if (prev_reef[r,c] == 1) {
        print(paste("Coral found at", r, c))
        
        # STEP 8: Determine coral's fate
        
        # Roll 2d6 for this coral
        coral_outcome <- sum(sample(1:6, size = 2, replace = TRUE))
        # Fill in the conditions below for mortality and survival
        # Update the reef accordingly
        if (coral_outcome <= 3) {
          # Mortality
          print("Coral died")
          # Update the reef
          reef[r,c] <- 0
        } else {
          # Survival
          print("Coral survived")
          # Update the reef
          reef[r,c] <- 1
        }
      }
    }
  }
  print(paste("year:", years[t]))
  print(reef)

  # STEP 9: Update coral_cover_pct
  coral_cover_pct[t] <- mean(reef)
  
}
coral_cover_pct
# When correct, your code will produce this result for the coral cover percent:
#  [1] 0.32 0.32 0.32 0.32 0.32 0.32 0.24 0.20 0.16 0.16 0.12

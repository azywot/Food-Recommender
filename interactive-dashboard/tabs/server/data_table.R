getDataFrame <- function(data, gender, gpaRange, healthLevel, selectedReasons) {
  reasons <- c("stress", "boredom", "sadness", "hunger", "laziness", "cold weather", "happiness", "watching tv", "none")
  if (gender != "-") {
    data <- filter(data, Gender == gender)
  }
  if (gpaRange[1] != 2 || gpaRange[2] != 5) {
    data <- filter(data, between(GPA, gpaRange[1], gpaRange[2]))
  }
  if (healthLevel[1] != 1 || healthLevel[2] != 10) {
    data <- filter(data, between(Health, healthLevel[1], healthLevel[2]))
  }
  if (!setequal(reasons, selectedReasons)) {
    data <- filter(data, Reason %in% selectedReasons)
  }
  return(data)
}

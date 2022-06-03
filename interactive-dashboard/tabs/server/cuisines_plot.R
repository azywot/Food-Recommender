get_cor_plot <- function(cuisine1, cuisine2) {
  food <- read.csv("data/food_coded.csv")
  specific_cuisines <- c(
    "ethnic_food", "greek_food", "indian_food", "italian_food",
    "persian_food", "thai_food"
  )
  columns <- c("cuisine", "fav_cuisine_coded", "weight", "diet_current_coded", specific_cuisines)
  data <- select(food, columns)
  data <- data.frame(data)

  data$cuisine <- recode(data$cuisine,
    `1` = "American",
    `2` = "Mexican/Spanish",
    `3` = "Korean/Asian",
    `4` = "Indian",
    `5` = "American inspired",
    `6` = "Other",
    .missing = "None"
  )

  data$fav_cuisine_coded <- recode(data$fav_cuisine_coded,
    `0` = "None",
    `1` = "Italian/French/Greek",
    `2` = "Spanish/mexican",
    `3` = "Arabic/Turkish",
    `4` = "Asian",
    `5` = "American",
    `6` = "African",
    `7` = "Jamaican",
    `8` = "Indian",
    .missing = "None"
  )

  data$diet_current_coded <- recode(data$diet_current_coded,
    `1` = "healthy",
    `2` = "unhealthy",
    `3` = "monotone",
    `4` = "unclear",
    .missing = "none"
  )

  for (sc in specific_cuisines) {
    data[, sc] <- recode(data[, sc],
      `1` = "1. very unlikely",
      `2` = "2. unlikely",
      `3` = "3. neutral",
      `4` = "4. likely",
      `5` = "5. very likely",
      .missing = "none"
    )
  }

  data <- mutate(data, weight = as.integer(weight))


  p <- ggplot(data, aes(x = cuisine1, y = cuisine2, size = weight, color = diet_current_coded)) +
    geom_jitter() +
    labs(
      title = "Correlation between cuisines",
      subtitle = "bla bla",
      color = "current diet"
    ) +
    scale_color_manual(values = c("#addd8e", "#fec44f", "#ffeda0", "#fc9272"))
  return(p)
}

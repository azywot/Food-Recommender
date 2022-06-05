get_cor_plot <- function(data, cuisine1, cuisine2) {
  specific_cuisines <- c(
    "ethnic_food", "greek_food", "indian_food", "italian_food",
    "persian_food", "thai_food"
  )
  columns <- c("childhood_cuisine", "fav_cuisine_coded", "weight", "diet_current_coded", specific_cuisines)
  data <- select(data, columns)

  p <- ggplot(data, aes(x = data[, cuisine1], y = data[, cuisine2], size = weight, color = diet_current_coded)) +
    geom_jitter(width = 0.2, height = 0.2) +
    labs(
      size = "weight",
      color = "current diet",
      x = cuisine1,
      y = cuisine2
    ) +
    scale_color_manual(values = c("#addd8e", "#fec44f", "#ffeda0", "#fc9272"))
    # plotly doesn't support size legend ☹
  return(ggplotly(p))
}

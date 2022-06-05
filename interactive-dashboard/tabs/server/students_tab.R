get_distribution_plot <- function(data, attr) {
  p <- switch(attr,
    "Gender" = ggplot(data, aes(Gender)),
    "Employment" = ggplot(data, aes(employment)),
    "Income" = ggplot(data, aes(income)),
    "Cook frequency" = ggplot(data, aes(cook)),
    "Cuisine childhood" = ggplot(data, aes(childhood_cuisine)),
    "Current diet" = ggplot(data, aes(diet_current_coded)),
    "Comfort food reasons" = ggplot(data, aes(Reason)),
    "Eating changes at college" = ggplot(data, aes(eating_changes_coded)),
    "Eating out per week" = ggplot(data, aes(eating_out)),
    "Exercise per week" = ggplot(data, aes(exercise))
  )

  p <- p +
    geom_bar(fill = "steelblue") +
    labs(y = "no. of students") +
    labs(x = "", title = paste(attr, " - distribution")) +
    theme_minimal() +
    theme(plot.title = element_text(size = 18, hjust = 0.5))

  return(p)
}

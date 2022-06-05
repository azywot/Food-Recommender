get_distribution_plot <- function(data, attr){
  
  p <- switch (
    attr,
    'Employment' = ggplot(data, aes(employment)),
    'Gender' = ggplot(data, aes(Gender)),
    'Cook frequency' = ggplot(data, aes(cook)),
    'Cuisine childhood' = ggplot(data, aes(cuisine)),
    'Current diet' = ggplot(data, aes(diet_current_coded))
  )

  p <- p + 
    geom_bar(fill="steelblue") +
    labs(y = 'no. of students') +
    labs(x = attr) +
    theme_minimal()
  return(p)
}
get_calories_plot <- function(type, guess) {
    food <- read.csv("data/food_coded.csv")
    columns <- c("calories_scone")
    data <- select(food, columns)
    data <- data.frame(data)
    data <- mutate(data, calories_scone = as.character(calories_scone))
    data <- subset(data, calories_scone != "NaN")

    p <- ggplot() +
        labs(x = "calories") +
        scale_x_discrete(limits = c("120", "315", "420", "980"))

    if (type < 1) {
        p <- ggplot() +
            geom_vline(aes(xintercept = guess, color = "your guess"), size = 1.5) +
            labs(x = "calories") +
            scale_x_discrete(limits = c("120", "315", "420", "980")) +
            scale_color_manual(name = "answer", values = c("your guess" = "black"))
        return(p)
    } else {
        p <- ggplot(data, aes(x = calories_scone, fill = calories_scone)) +
            geom_bar() +
            geom_vline(aes(xintercept = guess, color = "your guess"), size = 1.5) +
            scale_x_discrete(limits = c("120", "315", "420", "980")) +
            scale_fill_manual(values = c("#bdbdbd", "#31a354", "#bdbdbd")) +
            scale_color_manual(name = "answer", values = c("your guess" = "black"))
        return(p)
    }
    return(0)
}

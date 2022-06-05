get_health_plot <- function(drink_opt) {
    food <- read.csv("data/food_coded.csv")
    columns <- c("ideal_diet_coded", "eating_out", "drink")
    data <- select(food, columns)
    data <- data.frame(data)

    data$ideal_diet_coded <- recode(data$ideal_diet_coded,
        `1` = "portion control",
        `2` = "adding veggies",
        `3` = "balance",
        `4` = "less sugar",
        `5` = "home cooked/organic",
        `6` = "current diet",
        `7` = "more protein",
        `8` = "unclear",
        .missing = "None"
    )

    data <- subset(data, drink != drink_opt)

    p <- ggplot(data, aes(area = eating_out, fill = ideal_diet_coded, subgroup = ideal_diet_coded)) +
        geom_treemap(aes(alpha = eating_out)) +
        geom_treemap_subgroup_border(colour = "white", size = 5) +
        geom_treemap_subgroup_text(
            place = "centre", grow = TRUE,
            alpha = 0.25, colour = "black",
            fontface = "italic"
        ) +
        scale_alpha_continuous(labels = c(
            "Never", "1-2 times a week", "2-3 times a week",
            "3-5 times a week", "every day"
        )) +
        guides(fill = "none")
    return(p)
}

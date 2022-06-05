get_health_plot <- function(data, drink_opt) {
    columns <- c("ideal_diet_coded", "eating_out", "drink")
    data <- select(data, columns)
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

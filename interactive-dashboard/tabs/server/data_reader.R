readDataFOOD <- function() {
    data <- read.csv("data/food_coded.csv")
    columns_table <- c("Gender", "GPA", "comfort_food_reasons_coded", 
                       "healthy_feeling", "comfort_food", "cook", "eating_out", 
                       "income", "pay_meal_out", "employment")
    res <- select(data, columns_table)
    res$comfort_food <- str_squish(toupper(res$comfort_food))

    res <- res %>%
        rename(
            Reason = comfort_food_reasons_coded,
            Health = healthy_feeling,
            "Comfort food" = comfort_food
        ) %>%
        mutate(
            Gender = recode(Gender, `1` = "Female", `2` = "Male"),
            Reason = recode(Reason,
                `1` = "stress",
                `2` = "boredom",
                `3` = "sadness",
                `4` = "hunger",
                `5` = "laziness",
                `6` = "cold weather",
                `7` = "happiness",
                `8` = "watching tv",
                `9` = "none",
                .missing = "none"
            ),
            GPA = as.numeric(GPA)
        ) %>%
        mutate_at(vars(GPA), ~ ifelse(is.na(.x), mean(.x, na.rm = TRUE), .x)) %>%
        mutate(GPA = round(GPA, 2))

    return(res)
}

parse_data <- function() {
    food <- read.csv("data/food_coded.csv")
    specific_cuisines <- c(
        "ethnic_food", "greek_food", "indian_food", "italian_food",
        "persian_food", "thai_food"
    )
    columns <- c(
        "calories_scone", "ideal_diet_coded", "eating_out", "drink", "cuisine",
        "fav_cuisine_coded", "weight", "diet_current_coded", specific_cuisines
    )
    data <- select(food, columns)
    data <- data.frame(data)
    data <- mutate(data, calories_scone = as.character(calories_scone))
    # data <- subset(data, calories_scone != "NaN")

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

    data <- rename(data, "childhood_cuisine" = "cuisine")

    data$childhood_cuisine <- recode(data$childhood_cuisine,
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

    return(data)
}

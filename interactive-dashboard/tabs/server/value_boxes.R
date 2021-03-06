getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

get_answer_cook <- function(data) {
  # ans <- getmode(data$cook)
  ans <- mean(data$cook, na.rm = TRUE)
  result <- switch(as.character(round(ans)),
                  "1" = "Every day",
                  "2" = "A few times a week",
                  "3" = "Not very often",
                  "4" = "Barely/little",
                  "5" = "Never"
  )
  return(result)
}

get_eating_out <- function(data) {
  # ans <- getmode(data$eating_out)
  ans <- mean(data$cook, na.rm = TRUE)
  result <- switch(as.character(round(ans)),
                  "1" = "Never",
                  "2" = "1-2 times",
                  "3" = "2-3 times",
                  "4" = "3-5 times",
                  "5" = "every day"
  )
  return(result)
}

get_exercise <- function(data) {
  # ans <- getmode(data$exercise)
  ans <- mean(data$exercise, na.rm = TRUE)
  result <- switch(as.character(round(ans)),
                   "1" = "Everyday", 
                   "2" = "Twice or three times per week",
                   "3" = "Once a week",
                   "4" = "Sometimes", 
                   "5" = "Never"
  )
  return(result)
}

get_gauge_health <- function(data) {
  val <- mean(data$Health, na.rm = TRUE)
  gauge(
    round(val, 2),
    min = 1, max = 10, label = paste("HEALTH RATE"),
    gaugeSectors(colors = c("#01619A"))
    # gaugeSectors(success = c(6, 5), warning = c(4,3), danger = c(2, 1), colors = c("#CC6699"))
  )
}

get_gauge2 <- function(data) {
  val <- getmode(data$income)
  #val <- mean(data$pay_meal_out, na.rm = TRUE)
  gauge(
    round(val, 2),
    min = 1, max = 6, label = paste("MEAL OUT"),
    gaugeSectors(colors = c("#01619A"))
    # gaugeSectors(success = c(6, 5), warning = c(4,3), danger = c(2, 1), colors = c("#CC6699"))
  )
}

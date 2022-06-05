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
  # return(paste(result, "\n", ans))
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
  # return(paste(result, "\n", ans))
  return(result)
}

get_gauge1 <- function(data) {
  val <- mean(data$income, na.rm = TRUE)
  gauge(
    round(val, 2),
    min = 1, max = 6, label = paste("INCOME LEVEL"),
    gaugeSectors(colors = c("#01619A"))
    # gaugeSectors(success = c(6, 5), warning = c(4,3), danger = c(2, 1), colors = c("#CC6699"))
  )
}

get_gauge2 <- function(data) {
  val <- mean(data$pay_meal_out, na.rm = TRUE)
  gauge(
    round(val, 2),
    min = 1, max = 6, label = paste("MEAL OUT"),
    gaugeSectors(colors = c("#01619A"))
    # gaugeSectors(success = c(6, 5), warning = c(4,3), danger = c(2, 1), colors = c("#CC6699"))
  )
}

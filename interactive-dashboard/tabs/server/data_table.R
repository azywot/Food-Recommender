reasons <- c("stress","boredom","sadness","hunger","laziness","cold weather","happiness","watching tv", "none")

readDataFOOD <- function(){
  data <- read.csv("data/food_coded.csv")
  columns_table <- c("Gender", "GPA", "comfort_food_reasons_coded", "healthy_feeling" , "comfort_food")
  res <- select(data, columns_table)
  res$comfort_food = str_squish(toupper(res$comfort_food))
  
  res = res%>%
    rename(Reason = comfort_food_reasons_coded,
           Health = healthy_feeling,
           'Comfort food' = comfort_food) %>%
    mutate(Gender = recode(Gender,`1`="Female", `2`="Male"),
           Reason = recode(Reason, 
                           `1`= "stress",
                           `2`= "boredom",
                           `3`= "sadness",
                           `4`= "hunger",
                           `5`= "laziness",
                           `6`= "cold weather",
                           `7`= "happiness", 
                           `8`= "watching tv",
                           `9`= "none",
                           .missing = "none"),
           GPA = as.numeric(GPA)) %>% 
    mutate_at(vars(GPA),~ifelse(is.na(.x), mean(.x, na.rm = TRUE), .x)) %>%
    mutate(GPA = round(GPA, 2))
  
  return(res)
}

# TODO - rozbiæ na mniejsze funkcje
getDataFrame <- function(data, gender, gpaRange, healthLevel, selectedReasons){
  if(gender != "-"){
    data <- filter(data, Gender == gender)
  }
  if(gpaRange[1]!=2 || gpaRange[2]!=5){
    data <- filter(data, between(GPA, gpaRange[1], gpaRange[2]))
  }
  if(healthLevel[1]!=1 || healthLevel[2]!=10){
    data <- filter(data, between(Health, healthLevel[1], healthLevel[2]))
  }
  if(!setequal(reasons, selectedReasons)){
    data <- filter(data, Reason %in% selectedReasons)
  }
  return(data)
}


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
                           .missing = "none"
           ))
  
  
  return(res)
}

getDataFrame <- function(data, gender){
  if(gender != "-"){
    return(filter(data, Gender == gender))
  }
  return(data)
}


data <- read.csv("data/food_coded.csv")
h <- hist(!is.na(as.numeric(data$GPA)))
h
data$GPA
data_new <- data[!is.na(data$breakfast), ]      # Delete rows
data_new 
hist(data_new$breakfast, main = "AHA")
               
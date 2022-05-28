# load data and libraries
library(shiny)
library(shinydashboard)
library(DT)
library(dplyr)
library(stringr)
library(miceadds) #for multiple source files
source.all("tabs/server/")

#data <- read.csv("data/food_coded.csv")
dataFOOD <- readDataFOOD()
reasons <- c("stress","boredom","sadness","hunger","laziness","cold weather","happiness","watching tv", "none")

function(input, output, session) {
  set.seed(122)
  histdata <- rnorm(500)
  
  observeEvent(input$all, {
    updateCheckboxGroupInput(
      session, "checkGroupReason", choices = reasons,
      selected = if(input$all) reasons
    )
  })
  
  output$plot1 <- renderPlot({
    data <- histdata[seq_len(input$slider)]
    hist(data)
  })
  
  
  dataInput <- reactive({
    getDataFrame(data = dataFOOD,
                 gender = input$selectGender)
    
  })
  
  
  output$datatable <- DT::renderDataTable({
    datatable(dataInput(),  
              options = list(
      pageLength = 10,
      lengthMenu = c(5, 10, 15, 20)
    )) %>%
      formatStyle(
        "Comfort food",
        backgroundColor = "orange")
  })
  
  output$testText <- renderText({ 
    paste("My first server data " , input$sliderGPA[1], "-", input$sliderGPA[2] )
  })
  
}
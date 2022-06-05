# load data and libraries
library(shiny)
library(shinydashboard)
library(DT)
library(dplyr)
library(ggplot2)
library(treemapify)
library(stringr)
library(miceadds) # for multiple source files
source.all("tabs/server/")

# data <- read.csv("data/food_coded.csv")
dataFOOD <- readDataFOOD()
reasons <- c(
  "stress", "boredom", "sadness", "hunger", "laziness",
  "cold weather", "happiness", "watching tv", "none"
)

data_table_columns <- c("Gender", "GPA", "Reason", "Health", "Comfort food")

function(input, output, session) {
  set.seed(23) # is it needed?

  observeEvent(input$all, {
    updateCheckboxGroupInput(
      session, "checkGroupReason",
      choices = reasons,
      selected = if (input$all) reasons
    )
  })

  # data table
  dataInput <- reactive({
    getDataFrame(
      data = dataFOOD,
      gender = input$selectGender,
      gpaRange = input$sliderGPA,
      healthLevel = input$sliderHEALTH,
      selectedReasons = input$checkGroupReason
    )
  })

  output$datatable <- DT::renderDataTable({
    datatable(select(dataInput(), data_table_columns),
      options = list(
        pageLength = 10,
        lengthMenu = c(5, 10, 15, 20)
      )
    ) %>%
      formatStyle(
        "Comfort food",
        backgroundColor = "orange"
      )
  })

  output$cook_how_often <- renderText({
    get_answer_cook(dataInput())
  })

  output$eating_out <- renderText({
    get_eating_out(dataInput())
  })

  output$gauge1 <- flexdashboard::renderGauge({
    get_gauge1(dataInput())
  })

  output$gauge2 <- flexdashboard::renderGauge({
    get_gauge2(dataInput())
  })

  data <- parse_data()
  # cuisines correlations
  output$cuisine_cor <- renderPlot({
    get_cor_plot(
      data = data,
      cuisine1 = input$select_cuisine1,
      cuisine2 = input$select_cuisine2
    )
  })

  # calories guessing
  output$calories_plot <- renderPlot({
    get_calories_plot(data = data, type = input$answers, guess = input$guess_calories)
  })

  # health plot
  output$health_plot <- renderPlot({
    get_health_plot(data = data, drink_opt = input$chosen_drink)
  })
}

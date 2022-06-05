# load data and libraries
library(shiny)
library(shinydashboard)
library(DT)
library(dplyr)
library(ggplot2)
library(plotly)
library(treemapify)
library(stringr)
library(miceadds) # for multiple source files
library(ggthemes)
source.all("tabs/server/")

# data <- read.csv("data/food_coded.csv")
dataFOOD <- readDataFOOD()
data <- parse_data()

reasons <- c(
  "stress", "boredom", "sadness", "hunger", "laziness",
  "cold weather", "happiness", "watching tv", "none"
)

data_table_columns <- c("Gender", "GPA", "Reason", "Health", "Comfort food")

function(input, output, session) {

  # COMFORT FOOD TAB
  observeEvent(input$all, {
    updateCheckboxGroupInput(
      session, "checkGroupReason",
      choices = reasons,
      selected = if (input$all) reasons
    )
  })

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

  # CUISINE TAB
  #data <- parse_data()
  # cuisines correlations
  output$cuisine_cor <- renderPlotly({
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
  
  
  #STUDENTS TAB
  output$selected_distr <- renderText({
    paste(input$selected_distr, " - distribution")
  })
  
  output$plot_selected_attr <- renderPlot({
    get_distribution_plot(dataFOOD, input$selected_distr)
    
    #attr <- input$selected_distr
  })
  
}

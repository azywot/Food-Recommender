dashboardTabItem <- function() {
  COLOR <- "blue"
  reasons <- c("stress", "boredom", "sadness", "hunger", "laziness", "cold weather", "happiness", "watching tv", "none")

  return(
    tabItem(
      tabName = "dashboard",
      h2("Recommender"),
      "Select apropriate attributes and see what other student chose as their comfort food. This can help you find a food inspiration!",
      br(),
      "What is more, you can see some interesting facts concerning the group selected.",
      br(),br(),
      
      # DATAFRAME
      fluidRow(
        tags$head(tags$style(HTML(".small-box {height: 110px}"))),
        shinydashboard::box(
          width = 3,
          height = 150,
          tags$b("AVERAGE HEALTH RATING:"),
          #tagList("TODO", tags$sup(style = "font-size: 20px", "%")),
          #"Approval Rating", icon = icon("line-chart"), color = COLOR
          flexdashboard::gaugeOutput("gauge_health"),
        ),
        shinydashboard::valueBox(
          width = 3,
          tagList(tags$b(style = "font-size: 15px","How often do you cook?")),
          textOutput("cook_how_often"),
          icon = icon("question"), color = COLOR
        ),
        shinydashboard::valueBox(
          width = 3,
          tagList(tags$b(style = "font-size: 15px","How often do you eat out?")), 
          textOutput("eating_out"),
          icon = icon("question"), color = COLOR
        ),
        shinydashboard::valueBox(
          width = 3,
          tagList(tags$b(style = "font-size: 15px","How often do you exercise?")),
          textOutput("exercise"),
          icon = icon("question"), color = COLOR
        )
      ),
      fluidRow(
        # CONTROL TAGS
        box(
          title = tags$b("Filter the data"),
          width = 3,
          selectInput("selectGender", tags$b("Gender"),
            choices = list("Female", "Male", "-"), selected = "-"
          ),
          sliderInput("sliderGPA", tags$b("GPA"),
            min = 2, max = 5, step = 0.2, value = c(2, 5)
          ),
          sliderInput("sliderHEALTH", tags$b("Health assesment"),
            min = 1, max = 10, step = 1, value = c(1, 10)
          ),
          checkboxGroupInput("checkGroupReason",
            tags$b("Food choice reason"),
            choices = reasons,
            selected = reasons
          ),
          checkboxInput("all", "Select all/none", value = TRUE)
        ),

        # DATA TABLE
        box(
          title = tags$b("Food suggestions"),
          width = 9,
          DT::dataTableOutput("datatable")
        )
      )
    )
  )
}

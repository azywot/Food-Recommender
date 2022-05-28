dashboardTabItem <- function(){
  
  COLOR <- "blue"
  reasons <- c("stress","boredom","sadness","hunger","laziness","cold weather","happiness","watching tv", "none")
  
  return(
    tabItem(tabName = "dashboard",
       
      # DATAFRAME
      fluidRow(
        tags$head(tags$style(HTML(".small-box {height: 100px}"))),
        valueBox(
          width = 3,
          tagList("TODO", tags$sup(style="font-size: 20px", "%")),
          "Approval Rating", icon = icon("line-chart"), color = COLOR
        ),
        valueBox(
          width = 3,
          tagList("TODO", tags$sup(style="font-size: 20px", "%")),
          "Approval Rating", icon = icon("line-chart"), color = COLOR
        ),
        valueBox(
          width = 3,
          "TODO", "Progress", icon = icon("users"), color = COLOR
        ),
        valueBox(
          width = 3,
          "TODO", "Progress", icon = icon("users"), color = COLOR
        )
      ),
      fluidRow(
        # CONTROL TAGS
        box(
          title = tags$b("Filter the data"),
          width = 3,
          
          selectInput("selectGender", tags$b("Gender"), 
                      choices = list("Female", "Male", "-"), selected = "-"),
          sliderInput("sliderGPA", tags$b("GPA"),
                      min = 2, max = 5, step = 0.2, value = c(0,5)),
          sliderInput("sliderHEALTH", tags$b("Health assesment"),
                      min = 0, max = 10, step = 1, value = c(0,10)),
          
          checkboxGroupInput("checkGroupReason",
                             tags$b("Food choice reason"),
                             choices = reasons,
                             selected = reasons),
          checkboxInput("all", "Select all/none", value = TRUE)
        ),
        
        # DATA TABLE
        box(
          title = tags$b("Food suggestions"),
          width = 9,
          
          p("Select apropriate attributes and see what other student chose as their comfort food. This can help you find a food inspiration!\nWhat is more, you can see some interesting facts concerning the selected group."),
          DT::dataTableOutput("datatable"))
      ),
      textOutput("testText")
    )
  )
}
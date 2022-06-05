studentsTabItem <- function() {
  COLOR <- "blue"
  reasons <- c("stress", "boredom", "sadness", "hunger", "laziness", "cold weather", "happiness", "watching tv", "none")
  
  return(
    tabItem(
      tabName = "students",
      h2("Get to know the students!"),
      p("Select a criterion to see what is the distribution of students' votes."),
      
      fluidRow(
        # DATA TABLE
        box(
          width = 8,
          title = tags$b(textOutput("selected_distr")),
          selectInput(
              "selected_distr", tags$b("Selected attribute:"),
              choices = list(
                'Employment',
                'Gender',
                'Cook frequency',
                'Cuisine childhood',
                'Current diet'
                             ), 
              selected = 'Gender')
          #plotOutput("plot_selected_attr")
          )
      ),
      
      fluidRow(
        mainPanel(
          tabsetPanel(
            tabPanel("Plot", plotOutput("plot")),
            tabPanel("Summary", verbatimTextOutput("summary")),
            tabPanel("Table", tableOutput("table"))
          )
        )
      )
    )
  )
}

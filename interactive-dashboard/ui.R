## ui.R ##
library(shinydashboard)
library(shinydashboardPlus)
source('tabs/ui/utils.R')

COLOR <- "yellow"

header <- dashboardHeader(
    title = span("Food Recommender  ", tagList(icon("utensils"))),
    titleWidth = 310,
    tags$li(a(href = 'https://www.put.poznan.pl',
              img(src = 'logo.png', height = "30px"),
              style = "padding-top:10px; padding-bottom:10px;"),
            class = "dropdown")
  )


sidebar <- dashboardSidebar(
    width = 310,
    sidebarMenu(
      menuItem("About", tabName = "about", icon = icon("book")),
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
      menuItem("Widgets", tabName = "widgets", icon = icon("th"))
    )
  )

body <- dashboardBody(
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
    ),
    tabItems(
      
      # About tab
      aboutTabItem(),
      
      # Dashboard tab
      tabItem(tabName = "dashboard",
              fluidRow(
                
                mainPanel(
                  tabsetPanel(
                    tabPanel("Plot", plotOutput("plot")), 
                    tabPanel("Summary", verbatimTextOutput("summary")), 
                    tabPanel("Table", tableOutput("table"))
                  )
                ),
                
                box(plotOutput("plot1", height = 250)),
                
                box(
                  title = "Controls",
                  sliderInput("slider", "Number of observations:", 1, 100, 50)
                )
              )
      ),
      
      # Widgets tab
      tabItem(tabName = "widgets",
              h2("Widgets tab content")
      )
    )
  )

footer <- dashboardFooter(
  left = "authors: Zuzanna Gawrysiak, Agata Zywot",
)

dashboardPage(skin = COLOR, header, sidebar, body, footer = footer)
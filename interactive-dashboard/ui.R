## ui.R ##
library(shinydashboard)
library(shinydashboardPlus) # footer
library(readr) # read files
library(miceadds) # for multiple source files
source.all("tabs/ui/")

COLOR <- "yellow"

header <- dashboardHeader(
  title = span(tagList(icon("utensils"), " Food Recommender")),
  titleWidth = 310,
  tags$li(a(
    href = "https://www.put.poznan.pl",
    img(src = "logo.png", height = "30px"),
    style = "padding-top:10px; padding-bottom:10px;"
  ),
  class = "dropdown"
  )
)

sidebar <- dashboardSidebar(
  width = 310,
  sidebarMenu(
    id = "mySidebar",
    menuItem("About", tabName = "about", icon = icon("book")),
    menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
    menuItem("Cuisines", tabName = "cuisines", icon = icon("apple")),
    menuItem("Students dataset", tabName = "students", icon = icon("graduation-cap"))
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
    dashboardTabItem(),

    cuisinesTabItem(),

    # Students dataset tab
    tabItem(
      tabName = "students",
      h2("Dataset analysis - attributes distribution"),
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
)

footer <- dashboardFooter(
  left = "authors: Zuzanna Gawrysiak, Agata Zywot",
)

dashboardPage(skin = COLOR, header, sidebar, body, footer = footer)

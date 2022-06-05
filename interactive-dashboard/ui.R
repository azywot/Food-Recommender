## ui.R ##
library(shinydashboard)
library(shinydashboardPlus) # footer
library(readr) # read files
library(miceadds) # for multiple source files
library(flexdashboard)
library(plotly)
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
    menuItem("About", tabName = "about", icon = icon("info")),
    menuItem("Recommender", tabName = "dashboard", icon = icon("book")),
    menuItem("Cuisines", tabName = "cuisines", icon = icon("apple")),
    menuItem("Health", tabName = "health", icon = icon("bacteria"))
  )
)

body <- dashboardBody(
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
  ),
  tabItems(
    aboutTabItem(),
    dashboardTabItem(),
    cuisinesTabItem(),
    healthTabItem()
  )
)

footer <- dashboardFooter(
  left = "authors: Zuzanna Gawrysiak, Agata Zywot",
)

dashboardPage(skin = COLOR, header, sidebar, body, footer = footer)

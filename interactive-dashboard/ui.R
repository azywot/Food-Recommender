shinyUI(fluidPage(
  titlePanel("Dunk visualization"),
  sidebarLayout(position="right",
                sidebarPanel(
                  img(src = "example.jpg", height = 200, width = 250)
                ),
                mainPanel(
                  h3("Quotes"),
                  p("Can I still dunk... Are you stupid?")
                )
  )
))
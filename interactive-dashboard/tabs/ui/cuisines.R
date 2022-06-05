cuisinesTabItem <- function() {
  specific_cuisines <- c(
    "ethnic_food", "greek_food", "indian_food",
    "italian_food", "persian_food", "thai_food"
  )
  all_cuisines <- c("childhood_cuisine", "fav_cuisine_coded", specific_cuisines)

  return(
    tabItem(
      tabName = "cuisines",
      h2("Which cuisine do you fancy?"),
      p("See how much likely people eat different cuisine and get inspired!"),
      # correlations
      fluidRow(
        # selectors
        box(
          title = tags$b("Choose cuisines"),
          width = 3,
          selectInput("select_cuisine1", tags$b("Select 1st cuisine"),
            choices = all_cuisines, selected = "indian_food"
          ),
          selectInput("select_cuisine2", tags$b("Select 2nd cuisine"),
            choices = all_cuisines, selected = "thai_food"
          )
        ),
        # plot
        box(
          title = tags$b("Cuisines correlations"),
          width = 9,
          plotOutput("cuisine_cor")
        )
      )
    )
  )
}

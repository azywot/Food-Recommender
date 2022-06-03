cuisinesTabItem <- function() {
  specific_cuisines <- c("ethnic_food", "greek_food", "indian_food",
                         "italian_food", "persian_food", "thai_food")
  all_cuisines <- c("cuisine", "fav_cuisine_coded", specific_cuisines)

  return(
    tabItem(
      tabName = "cuisines",

      fluidRow(
        # selectors
        box(
          title = tags$b("Filter the data"),
          width = 3,
          selectInput("select_cuisine1", tags$b("Select 1st cuisine"),
            choices = all_cuisines, selected = "indian_food"
          ),
          selectInput("select_cuisine2", tags$b("Select 1st cuisine"),
            choices = all_cuisines, selected = "thai_food"
          )
        ),

        # plot
        box(
          title = tags$b("Cuisines correlations"),
          width = 9,
          p("Hmm, what cuisine should I choose? Let's see the tastes of other people and decide"),
          plotOutput("cuisine_cor")
        )
      )
    )
  )
}

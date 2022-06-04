cuisinesTabItem <- function() {
  specific_cuisines <- c(
    "ethnic_food", "greek_food", "indian_food",
    "italian_food", "persian_food", "thai_food"
  )
  all_cuisines <- c("childhood_cuisine", "fav_cuisine_coded", specific_cuisines)

  return(
    tabItem(
      tabName = "cuisines",

      # correlations
      fluidRow(
        # selectors
        box(
          title = tags$b("Filter the data"),
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
          p("Hmm, what cuisine should I choose? Let's see the tastes of other people and decide"),
          plotOutput("cuisine_cor")
        )
      ),
      # calories guessing
      fluidRow(
        box(
          title = tags$b("Blueberry scone from Starbucks"),
          width = 4,
          img(src = "scone.png", width = 250, align = "center")
        ),
        # guess
        box(
          title = tags$b("Guess!"),
          width = 4,
          radioButtons("guess_calories", tags$b("How much calories are they in the scone?"),
            choices = list("120 cal" = "120", "315 cal" = "315", "420 cal" = "420", "980 cal" = "980"),
            selected = "120"
          ),
          actionButton("answers", label = "Show answers")
        ),
        # plot
        box(
          title = tags$b("Answers"),
          width = 4,
          p("Compare with others"),
          plotOutput("calories_plot")
        )
      )
    )
  )
}

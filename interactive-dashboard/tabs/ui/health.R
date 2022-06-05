healthTabItem <- function() {
  specific_cuisines <- c(
    "ethnic_food", "greek_food", "indian_food",
    "italian_food", "persian_food", "thai_food"
  )
  all_cuisines <- c("childhood_cuisine", "fav_cuisine_coded", specific_cuisines)

  return(
    tabItem(
      tabName = "health",
      h2("How do you perceive food?"),
      # ideal diet
      column(
        width = 6,
        h3("Food associations"),
        p("See how other people, who made the same choice imagine ideal diet.
           In addition you can examine how often do they eat out."),
        # choose drink
        box(
          title = tags$b("Drinks"),
          width = 6,
          img(src = "juice.png", width = 150, align = "center"),
          img(src = "soda.png", width = 150, align = "center")
        ),
        box(
          title = tags$b("Thirsty?"),
          width = 6,
          radioButtons("chosen_drink", tags$b("Which picture do you associate with the word \"drink\"?"),
            choices = list("orange juice" = 1, "soda" = 2, "both" = 3),
            selected = 3
          )
        ),
        # plot
        box(
          title = tags$b("Ideal diet and eating out"),
          width = 12,
          p("The ideal diet through eyes of the chosen group."),
          plotOutput("health_plot")
        )
      ),
      # calories guessing
      column(
        width = 6,
        h3("Calorie guessing"),
        p("How good are in assesing calories?
          This knowledge can be useful for your next choice of meal."),
        style = "border-left: 1px solid",
        box(
          title = tags$b("Blueberry scone from Starbucks"),
          width = 6,
          img(src = "scone.png", width = 150, align = "center")
        ),
        # guess
        box(
          title = tags$b("Guess!"),
          width = 6,
          radioButtons("guess_calories", tags$b("How much calories are they in the scone?"),
            choices = list("120 cal" = "120", "315 cal" = "315", "420 cal" = "420", "980 cal" = "980"),
            selected = "120"
          ),
          actionButton("answers", label = "Show answers", align = "center")
        ),
        # plot
        box(
          title = tags$b("Answers"),
          width = 12,
          p("Compare how other people guessed."),
          plotOutput("calories_plot")
        )
      )
    )
  )
}

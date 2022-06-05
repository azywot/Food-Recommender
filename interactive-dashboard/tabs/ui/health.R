healthTabItem <- function() {
  specific_cuisines <- c(
    "ethnic_food", "greek_food", "indian_food",
    "italian_food", "persian_food", "thai_food"
  )
  all_cuisines <- c("childhood_cuisine", "fav_cuisine_coded", specific_cuisines)

  return(
    tabItem(
      tabName = "health",

      # ideal diet
      fluidRow(
        # choose drink
        box(
          title = tags$b("Drinks"),
          width = 3,
          img(src = "juice.png", width = 250, align = "center"),
          img(src = "soda.png", width = 250, align = "center")
        ),
        box(
          title = tags$b("Thirsty?"),
          width = 3,
          radioButtons("chosen_drink", tags$b("Which picture do you associate with the word \"drink\"?"),
            choices = list("orange juice" = 1,  "soda" = 2, "both" = 3),
            selected = 3
          )
        ),
        # plot
        box(
          title = tags$b("Ideal diet and eating out"),
          width = 6,
          p("wow"),
          plotOutput("health_plot")
        )
      )
    )
  )
}

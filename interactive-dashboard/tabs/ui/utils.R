aboutTabItem <- function(){
  return(
    tabItem(
      tabName = "about",
      box(title = "About",
          status = "warning",
          solidHeader = F,
          width = 12,
          
          fluidRow(
            column(
              width = 8, 
              
              p("Tu damy opis recommendera..., dalam na razie opis z Kaggle zeby bylo cokolwiek XD"),
              p(read_file("texts/about.txt")),
              em(a("Kaggle Dataset", href="https://www.kaggle.com/datasets/borapajo/food-choices", "\n", )),
              br(),
              em(a("Github repository", href="https://github.com/azywot/Food-Recommender"))),

            column(
              width = 4, align = "right",
              img(src = 'students.jpg', width = 250, align = "center"))))
      )
    )
}
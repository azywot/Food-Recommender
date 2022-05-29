aboutTabItem <- function(){
  return(
    tabItem(
      tabName = "about",
      box(title = tags$b("About"),
          status = "warning",
          solidHeader = F,
          width = 12,
          
          fluidRow(
            column(
              width = 8, 
              
              p("This interactive web app was designed in order to provide an easy insight into students' comfort food choices, get a snack inspiratoin and analyze possible associations between different factors and the food chosen."),
              p("Although the dataset consists of only 126 responses from students, it includes not only the information of food choices but also the data about nutrition, preferences, childhood favorites, health assessment, activity and others, which might be helpful to create a template useful to answer one of the following questions: How important is nutrition information for today's college kids?, Is their taste in food defined by their food preferences when they were children? Do people doing sport usually make healthier food choices?"),
              tags$b("How to use the dashboard?"),
              p("TODO!"),
              
              tags$b("Useful links:"),
              br(),
              em(a("Kaggle Dataset", href="https://www.kaggle.com/datasets/borapajo/food-choices", "\n", )),
              br(),
              em(a("Github repository", href="https://github.com/azywot/Food-Recommender"))),

            column(
              width = 4, align = "right",
              img(src = 'students.jpg', width = 250, align = "center"))))
      )
    )
}
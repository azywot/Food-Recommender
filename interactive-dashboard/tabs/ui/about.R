aboutTabItem <- function() {
  return(
    tabItem(
      tabName = "about",
      h2("About"),
      br(),
      fluidRow(
      box(
        title = tags$b("Dashboard"),
        status = "warning",
        solidHeader = F,
        width = 12,
        fluidRow(
          column(
            width = 8,
            p("This interactive web app was designed in order to provide an easy insight into students' comfort food choices, get a snack inspiration and analyze possible associations between different factors and the food chosen."),
            p("Although the dataset consists of only 126 responses from students, it includes not only the information of food choices but also the data about nutrition, preferences, childhood favorites, health assessment, activity and others, which might be helpful to create a template useful to answer one of the following questions: How important is nutrition information for today's college kids?, Is their taste in food defined by their food preferences when they were children? Do people doing sport usually make healthier food choices?"),
            tags$b("How to use the dashboard?"),
            p("Navigate through tabs and explore the data!"),
            tags$b("Useful links:"),
            br(),
            em(a("Kaggle Dataset", href = "https://www.kaggle.com/datasets/borapajo/food-choices", "\n", )),
            br(),
            em(a("GitHub repository", href = "https://github.com/azywot/Food-Recommender"))
          ),
          column(
            width = 4, align = "right",
            img(src = "students.jpg", width = 250, align = "center")
          )
        )
      )),
      
      fluidRow(
      box(
        title = tags$b("Dataset"),
        status = "warning",
        solidHeader = F,
        width = 12,
        fluidRow(
          #column(width = 1),
          column(
            width = 5,
            tags$b("Get to know the students!"),
            
            p("Select a criterion to see what is the distribution of students' features."),
            selectInput(
              "selected_distr", tags$b("Selected attribute:"),
              choices = list(
                'Gender',
                'Employment',
                'Income',
                'Cook frequency',
                'Cuisine childhood',
                'Current diet',
                'Comfort food reasons',
                'Eating changes at college',
                'Eating out per week',
                'Exercise per week'
              ), 
              selected = 'Gender')
            ),
          #column(width = 1),
          column(
            width = 7,
            plotOutput("plot_selected_attr")
          )
        )
      )
    ))
  )
}

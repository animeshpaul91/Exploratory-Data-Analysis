library(shiny)

# Define UI for miles per gallon app ----
ui <- pageWithSidebar(
  
  # App title ----
  headerPanel("DIC Project1"),
  
  # Sidebar panel for inputs ----
  sidebarPanel(width = 0),
  
  # Main panel for displaying outputs ----
  mainPanel(
  tabsetPanel(
    
    tabPanel("DICLab1Part1", tags$img (src="Problem1.png", align="center"), tags$img (src="Problem2.png"), tags$img (src="Problem4_Histogram.png"),
             tags$img (src="Problem4.png"), tags$img (src="Problem5.png"), tags$img (src="Problem6.png"), tags$img (src="Problem6_USA.png"),
             tags$img (src="Problem 7.1.png"), tags$img (src="Problem 7.2.png"),tags$img (src="Problem 7.3.png"), tags$img (src="Problem 8.png")),

    tabPanel("DICLab1Part2", tags$img (src="Plot1.png", align="center"), tags$img (src="Plot2.png"), tags$img (src="Plot3.png"),
             tags$img (src="Plot4.png"), tags$img (src="Plot5.png"), tags$img (src="Plot6.png"), tags$img (src="Plot7.png"),
             tags$img (src="Plot8.png"), tags$img (src="Plot9.png"),tags$img (src="Chart1_12month.png"), tags$img (src="Chart2_12month.png"),
             tags$img(src="NY.png")),
    tabPanel("DICLab1Part3", tags$img(src = "CDC.png"), tags$img(src = "flu.png"), tags$img(src = "influenza.png"), tags$img(src = "cumulative.png"))
    )
  )
)

# Define server logic to plot various variables against mpg ----
server <- function(input, output) {
  
}

shinyApp(ui, server)
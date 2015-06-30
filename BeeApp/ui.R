library(shiny)

# Define UI for random distribution application 
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Graphing a Beta Distribution with varying Alpha and Beta values"),
  
  # Sidebar with controls to select the random distribution type
  # and number of observations to generate. Note the use of the
  # br() element to introduce extra vertical spacing
  sidebarLayout(position = "left",
                sidebarPanel(
                  
                  sliderInput("shape", 
                              "Alpha", 
                              value = 1,
                              min = 0, 
                              max = 100), br(), 
                  sliderInput("shape", "Beta", value=1, 
                              min = 0, max= 100)
                ), 
                
                
                # Show a tabset that includes a plot, summary, and table view
                # of the generated distribution
                mainPanel(
                  tabsetPanel(type = "tabs", 
                              tabPanel("Plot", plotOutput("plot")), 
                              tabPanel("Table", tableOutput("table"))
                  )
                )
  )
))

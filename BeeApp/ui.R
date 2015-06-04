library(shiny)

# Define UI for random distribution application 
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Fitting the Data for AHB"),
  
  # Sidebar with controls to select the random distribution type
  # and number of observations to generate. Note the use of the
  # br() element to introduce extra vertical spacing
  sidebarLayout(position = "left",
                sidebarPanel(
                  radioButtons("dist", "Distribution type:",
                               c("Normal" = "norm",
                                 "Gamma" = "gamma")),
                  br(),
                  
                  sliderInput("shape", 
                              "Mite Population", 
                              value = 1,
                              min = 0, 
                              max = 1000)
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

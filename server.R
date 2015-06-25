# server.R

library(lattice)
library(mosaic)
library(ggplot2)
source("helper.R")

shinyServer(function(input, output) {

  plotParams <- reactiveValues(alpha = NULL, beta = NULL)

  observeEvent( input$makePlot, {
      plotParams$alpha = input$alpha
      plotParams$beta = input$beta
    })
  
  output$plotA <- renderPlot({  
    graphGamma(plotParams$alpha, plotParams$beta , showing = "All")
  })
})

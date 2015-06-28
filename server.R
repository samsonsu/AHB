# server.R

library(lattice)
library(mosaic)
library(ggplot2)
source("helper.R")

shinyServer(function(input, output) {

  plotParams <- reactiveValues(alpha = NULL, beta = NULL)

  observeEvent( input$makePlot || input$makeCDF, {
      plotParams$alpha = input$alpha
      plotParams$beta = input$beta
    })
  
  output$plotA <- 
    
    renderPlot({
      if (input$cdf
    graphGamma(plotParams$alpha, plotParams$beta , showing = "All")
  })
})


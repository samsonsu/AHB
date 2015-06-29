# server.R
source("helper.R")

shinyServer(function(input, output) {
  
  data <- reactive({
    
    input$runSim
    
    isolate({
      dist <- switch(input$dist,
                     norm = rnorm,
                     unif = runif,
                     lnorm = rlnorm,
                     exp = rexp,
                     gamma = rgamma,
                     rnorm)
      list(data = dist(input$n), name = input$dist, n = input$n)
    })
  })
  
  output$plot1 <- renderPlot({
    
    if (input$cdf) {
      plot(ecdf(data()$data),
           main=paste('r', data()$name, '(', data()$n, ')', sep=''))
    }
    else {
      hist(data()$data, 
           main=paste('r', data()$name, '(', data()$n, ')', sep=''))
    }
  })
})

#   plotParams <- reactiveValues(alpha = NULL, beta = NULL)
# 
#   observeEvent( input$makePlot || input$makeCDF, {
#       plotParams$alpha = input$alpha
#       plotParams$beta = input$beta
#     })
#   
#   output$plot2 <- renderPlot({
#       if (input$makeCDF){
#         choosePlot(plotCDF(plotParams$alpha, plotParams$beta))
#       } 
#     else{
#     choosePlot(graphGamma(plotParams$alpha, plotParams$beta))
#     }
#   })
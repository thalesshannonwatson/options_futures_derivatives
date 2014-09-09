library(shiny)
source("helper.R")

shinyServer(function(input, output) {
  output$maturity <- renderPlot({
    if (input$position != NONE) {
      plot_option_at_maturity(input$position, input$right, input$premium, input$strike)
      
    }
  })
})

library(shiny)
library(datasets)
library(ggplot2)

# Define server logic required to plot various variables against
function(input, output) {
  load("clinical_and_expression.RData")
  
  # Compute the formula text in a reactive expression since it is
  # shared by the output$caption and output$mpgPlot functions
  
  formulaText <- reactive({
    paste("distribution of ", input$param)
  })

  # Return the formula text for printing as a caption
  output$caption <- renderText({
    formulaText()
  })

  # Generate a plot of the requested variable against mpg and
  # only include outliers if requested
 
  output$param_plot <- renderPlot({
    p = ggplot(clinical_data) + geom_histogram(aes_(as.name(input$param)), bins = as.numeric(input$n_breaks), fill = input$color)
    print(p)
  })
}

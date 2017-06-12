library(shiny)
library(ggplot2)
library(pheatmap)

load("clinical_and_expression.RData")

function(input, output, session) {
  
  output$plot <-renderPlot({
    dat = cbind(expression_data[input$parameter], expression_data[input$genes])
    fit = lm(as.formula(paste0(colnames(dat)[1]," ~ ",
                               paste(colnames(dat[2:length(dat)]),collapse = '+'))), data=dat)
    layout(matrix(c(1,2,3,4),2,2)) # optional 4 graphs/page 
    plot(fit)
})
  output$text <- renderPrint({
    dat = cbind(expression_data[input$parameter], expression_data[input$genes])
    fit = lm(as.formula(paste0(colnames(dat)[1]," ~ ",
                               paste(colnames(dat[2:length(dat)]),collapse = '+'))), data=dat)
    summary(fit)
  })

}
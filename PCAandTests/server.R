library(shiny)
library(ggplot2)
library(pheatmap)

load("clinical_and_expression.RData")

function(input, output, session) {

#Center and scale the mRNA expression data.
mRNA_exp_scaled = scale(expression_data,center=T,scale=T)
clinical_numeric_data_cols = sapply(colnames(clinical_data), function(x) is.numeric(clinical_data[,x]))
clinical_numeric_data = clinical_data[,clinical_numeric_data_cols]
mRNA_exp_scaled[is.na(mRNA_exp_scaled)] = 0
clinical_numeric_data[is.na(clinical_numeric_data)] = 0

#Perform PCA on both the mRNA and the RPPA data. 
pca_mRNA = prcomp(mRNA_exp_scaled)
pca_clinical = prcomp(clinical_numeric_data)

# Show a plot of the variances as a function of the component number (as we have done in class).
output$mrna_pca <- renderPlot({ 
  plot(pca_mRNA,type = "l", main="mRNA - PCA Variance",sub = "number of the component")
})
output$clinical_pca <-  renderPlot({ 
    plot(pca_clinical,type = "l", main="clinical - PCA Variance",sub = "number of the component")
})

# Show a heatmap of the pairwise correlations between the first 10 principal components
# of the mRNA and the first 10 principal components of the RPPA data.
# Are some of principal components in the two datasets related? 
colnames(pca_mRNA$x) = gsub("PC","mRNA_PC",colnames(pca_mRNA$x))
colnames(pca_clinical$x) = gsub("PC","clinical_PC",colnames(pca_clinical$x))

output$heatmap <-renderPlot({ 
  pheatmap(cor(pca_mRNA$x[,1:as.integer(input$mRNA_pc_n)],pca_clinical$x[,1:as.integer(input$clinical_pc_n)]), scale = "none", main = "pairwise correlations between the \n first 10 principal components of mRNA and clinical")
})


output$plot <-renderPlot({ 
  xlabel = paste("component",input$clinical_pc, " of clinical PCA")
  ylabel = paste("component",input$mRNA_pc, " of mRNA PCA")

  plot(pca_clinical$x[,as.integer(input$clinical_pc)], pca_mRNA$x[,as.integer(input$mRNA_pc)],xlab = xlabel, ylab=ylabel, col= input$color) })
output$text <- renderPrint({
  selectedData = data.frame("pca_clinical" = pca_clinical$x[,as.integer(input$clinical_pc)], "pca_mRNA" = pca_mRNA$x[,as.integer(input$mRNA_pc)])
  results = cor.test(selectedData[,"pca_clinical"], selectedData[,"pca_mRNA"], method = input$test)
  print(paste("Test name:",input$test,"estimate:",results$estimate,"P-value:",results$p.value))
})

}
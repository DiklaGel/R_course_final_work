library(shiny)

load("clinical_and_expression.RData")
fluidPage(
     tabsetPanel(
      tabPanel("heatmap",
               sidebarLayout(
                 sidebarPanel(
                   selectInput('mRNA_pc_n','mRNA data number of componenets', c(2:10)),
                   selectInput('clinical_pc_n','clinical data number of componenets',c(2:10))),
               mainPanel( plotOutput("heatmap")))),
      tabPanel("correlation between principle components",
               sidebarLayout(
                 sidebarPanel(
                 selectInput('mRNA_pc','mRNA data number of componenet', c(1:10)),
                 selectInput('clinical_pc', 'clinical data number of componenet',c(1:10)),
                 selectInput('color', 'color',choices = rainbow(6, start=.7, end=.1)),
                 selectInput('test', 'correlation test', c("spearm","pearson","kendall"))),
               mainPanel(plotOutput("plot"), 
                         verbatimTextOutput("text")))),
      tabPanel("mRNA PCA", plotOutput("mrna_pca")),
      tabPanel("clinical data PCA",plotOutput("clinical_pca"))
    )
)
library(shiny)

load("clinical_and_expression.RData")
parameter_list = c("patient.days_to_death","patient.days_to_birth", 
                   "patient.age_at_initial_pathologic_diagnosis" , 
                   "patient.lab_procedure_bone_marrow_blast_cell_outcome_percent_value")
gene_list = c("FLT3LG.2323","FLT3.2322","DNMT3A.1788","CEBPA.1050","NPM1.4869","TP53AIP1.63970",
              "TP53BP1.7158","TP53BP2.7159","TP53I11.9537","TP53I13.90313","TP53I3.9540",
              "TP53INP1.94241","TP53INP2.58476","TP53RK.112858","TP53TG1.11257",
              "TP53TG3B.729355","TP53TG5.27296","TP53.7157")
fluidPage(
  sidebarLayout(
    sidebarPanel(
      selectInput('parameter','dependent variable', choices = gene_list[1:4]),
      checkboxGroupInput('genes', 'independent variable', choices = gene_list[5:length(gene_list)], selected = gene_list[5])
      ),
    mainPanel(plotOutput("plot"),
              verbatimTextOutput("text"))
))
library(shiny)

load("clinical_and_expression.RData")
chosen_cols = c("patient.days_to_birth","patient.age_at_initial_pathologic_diagnosis",
                "patient.lab_procedure_blast_cell_outcome_percentage_value",
                "patient.lab_procedure_bone_marrow_band_cell_result_percent_value",
                "patient.lab_procedure_bone_marrow_blast_cell_outcome_percent_value",
                "patient.lab_procedure_bone_marrow_basophil_result_percent_value")


pageWithSidebar(
  headerPanel('k-means clustering of gene expression and clinical data'),
  sidebarPanel(
    selectInput('xcol', 'X Variable', chosen_cols),
    selectInput('ycol', 'Y Variable', gene_list),
    numericInput('clusters', 'Cluster count', 3, min = 1, max = 9)
  ),
  mainPanel(
    plotOutput('plot')
  )
)
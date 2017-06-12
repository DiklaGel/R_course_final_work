library(shiny)

chosen_cols = c("patient.days_to_birth","patient.days_to_death","patient.age_at_initial_pathologic_diagnosis",
                "patient.lab_procedure_abnormal_lymphocyte_result_percent_value",
                "patient.lab_procedure_blast_cell_outcome_percentage_value",
                "patient.lab_procedure_bone_marrow_band_cell_result_percent_value",
                "patient.lab_procedure_bone_marrow_blast_cell_outcome_percent_value",
                "patient.lab_procedure_bone_marrow_basophil_result_percent_value")
                

# Define UI 
fluidPage(
  
  # Application title
  titlePanel("AML parameters"),
  
  # Sidebar with controls to select the variable to plot against
  # mpg and to specify whether outliers should be included
  sidebarLayout(
    sidebarPanel(
      selectInput("n_breaks", label = "number of bins:",
                  choices = c(1:10)*5, selected = 30),
      selectInput("param", label = "clinical parameter:", choices = chosen_cols),
      selectInput("color",label = "color", choices = c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7"), selected = "#999999" )
    ),
    
    # Show the caption and plot of the requested variable against
    # mpg
    mainPanel(
      h3(textOutput("caption")),
      
      plotOutput("param_plot")
    )
  )
)

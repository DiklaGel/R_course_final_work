# R_course_final_work
Final assignment in R course, Weizmann Institute of Science

Course name: "Principles and practice of large scale data analysis using R"
Lecturers: Dr. Schraga Schwartz, Dr. Igor Ulitsky
The course was targeted to Life Sciences and Systems Biology students


Description of the Exercise:
 
1.Select a dataset of your choice which we have not worked on during the course. Ideally, this should be a dataset that is relevant to your research. It can be a gene expression dataset, a chip-seq dataset, human genotyping, etc. Ideally it should have at least two levels of information (e.g. both expression levels and disease status) though this is not strictly required. If you don’t have such a dataset, we suggest that you use a TCGA mRNA expression of a cancer that is not breast cancer (available https://gdac.broadinstitute.org/).
 
2. Use an ‘Rmarkdown’ script to:
Explain what the dataset contains (e.g. type and source of data, dimensions, variable types, distributions)
Pre-process (e.g. subset, renaming rows or columns, aggregate/merge, averaging…) and normalize the dataset.
Generate plots using ggplot2 providing a descriptive overview of the dataset (at least 3 figures/panels). Possible plots : correlation map between variables, Scatterplots with colors based on a factor variable, Boxplots, …
 
2. Develop a Shiny app that allows you to interactively explore this dataset. 
This app (which can be split into several apps) should combine at least three components like Clustering analysis (e.g. using PCA, k-means, hierarchical clustering, …)
Machine learning, Differential analysis, GO analysis,Modelling (linear/polynomial regressions, LOWESS, etc…),
Statistical hypothesis testing (at least 2/3 statistical tests and explain your research hypotheses. Justify your choice of test. Explain why you think it is interesting to make a statistical comparison of the variable you chose)
 

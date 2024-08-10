library(readxl)         # For reading Excel files
library(survival)       # For survival analysis
library(ggplot2)        # For plotting
library(survminer)      # For advanced survival plots

# Load the data set from Excel
file_path <- "Biostatistics Project.xlsx"
breast_cancer_data <- read_excel(file_path, sheet = 1)

# Attach the data set
attach(breast_cancer_data)

# Kaplan-Meier Estimation
surv_object <- Surv(RecurrenceFreeSurvivalTime, Status)
km_fit <- survfit(surv_object ~ 1)

ggsurvplot(km_fit, 
           data = breast_cancer_data,    # Add the data argument
           conf.int = TRUE, 
           pval = TRUE, 
           risk.table = TRUE, 
           ggtheme = theme_minimal(),
           xlab = "Time (days)", 
           ylab = "Survival Probability")

# Fit Kaplan-Meier model stratified by Tumour Grade
km_fit_grade <- survfit(surv_object ~ TumourGrade, data = breast_cancer_data)

# Plot the stratified Kaplan-Meier survival curves for Tumour Grade
ggsurvplot(km_fit_grade, 
           data = breast_cancer_data,
           conf.int = TRUE, 
           pval = TRUE, 
           risk.table = TRUE, 
           ggtheme = theme_minimal(),
           xlab = "Time (days)", 
           ylab = "Survival Probability",
           legend.labs = c("Grade 1", "Grade 2", "Grade 3"))

# Fit Kaplan-Meier model stratified by Hormonal Therapy
km_fit_therapy <- survfit(surv_object ~ HormonalTherapy, data = breast_cancer_data)

# Plot the stratified Kaplan-Meier survival curves for Hormonal Therapy
ggsurvplot(km_fit_therapy, 
           data = breast_cancer_data,
           conf.int = TRUE, 
           pval = TRUE, 
           risk.table = TRUE, 
           ggtheme = theme_minimal(),
           xlab = "Time (days)", 
           ylab = "Survival Probability",
           legend.labs = c("No Hormonal Therapy", "Hormonal Therapy"))

# Fit Kaplan-Meier model stratified by Menopausal Status
km_fit_strat <- survfit(surv_object ~ MenopausalStatus, data = breast_cancer_data)

# Plot the stratified Kaplan-Meier survival curves
ggsurvplot(km_fit_strat, 
           data = breast_cancer_data,
           conf.int = TRUE, 
           pval = TRUE, 
           risk.table = TRUE, 
           ggtheme = theme_minimal(),
           xlab = "Time (days)", 
           ylab = "Survival Probability",
           legend.labs = c("Pre-Menopausal", "Post-Menopausal"))

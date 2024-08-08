install.packages("survival")
library(survival)
library(readxl)
# Example data
setwd("C:/Users/Sujal Yadav/Desktop/Project")
data<-read_xlsx("Biostatistics Project.xlsx")
time <- data$`Recurrence Free Survival Time`  # Survival times
status <- data$Status  # Event occurred (1) or censored (0)
surv_object <- Surv(time, status)
km_fit <- survfit(surv_object ~ 1)
summary(km_fit)
plot(km_fit, xlab = "Time", ylab = "Survival Probability", main = "Kaplan-Meier Survival Curve")
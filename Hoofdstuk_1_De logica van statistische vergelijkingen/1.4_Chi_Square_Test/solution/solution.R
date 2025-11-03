# Create the data matrix
crime_data <- matrix(c(45, 55, 25, 75, 30, 70), 
                     nrow = 2, 
                     dimnames = list(c("Man", "Vrouw"), 
                                   c("Diefstal", "Geweld", "Fraude")))

# Perform chi-square test
chi_result <- chisq.test(crime_data)

# Print results
print(chi_result)
cat("Chi-square statistic:", chi_result$statistic, "\n")
cat("P-value:", chi_result$p.value, "\n")
cat("Degrees of freedom:", chi_result$parameter, "\n")

# Interpretation
if(chi_result$p.value < 0.05) {
  cat("Er is een significante associatie tussen geslacht en criminaliteitstype (p < 0.05)\n")
} else {
  cat("Er is geen significante associatie tussen geslacht en criminaliteitstype (p >= 0.05)\n")
}
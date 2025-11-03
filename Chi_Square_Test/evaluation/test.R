context({
  # Pre-load the data matrix for students
  data_matrix <- matrix(c(45, 25, 15, 35, 20, 40), 
                        nrow = 2, 
                        dimnames = list(
                          Geslacht = c("Man", "Vrouw"),
                          Misdrijf = c("Diefstal", "Geweld", "Fraude")
                        ))
  
  testcase("Chi-square test uitvoeren", {
    # Test that student calls chisq.test on data_matrix
    testEqual(NULL, function(env) { 
      result <- env$chisq.test(data_matrix)
      class(result)[1]
    }, "htest")
  })
  
  testcase("Juiste functie gebruikt", {
    # Verify the chi-square statistic is correct
    result <- chisq.test(data_matrix)
    testEqual(NULL, function(env) { 
      round(env$chisq.test(data_matrix)$statistic, 4) 
    }, round(result$statistic, 4))
  })
})
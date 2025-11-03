context({
  testcase("Chi-square test is performed correctly", {
    testEqual(NULL, function(env) {
      # Check if result exists and is a htest object
      exists("chi_result", envir = env) && inherits(env$chi_result, "htest")
    }, TRUE)
  })
  
  testcase("Chi-square statistic is correct", {
    testEqual(NULL, function(env) {
      # Expected chi-square value for the given data
      expected_chi <- 9.75
      abs(env$chi_result$statistic - expected_chi) < 0.1
    }, TRUE)
  })
  
  testcase("P-value interpretation is correct", {
    testEqual(NULL, function(env) {
      # P-value should be significant (< 0.05)
      env$chi_result$p.value < 0.05
    }, TRUE)
  })
})
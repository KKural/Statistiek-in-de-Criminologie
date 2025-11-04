context({
  testcase("Dataset structure check", {
    testEqual(NULL, function(env) { 
      # Just check if the dataset exists and has the right structure
      if (exists("df_fear_of_crime_gent", envir = env)) {
        ncol(env$df_fear_of_crime_gent)
      } else {
        0
      }
    }, 8)
  })
})
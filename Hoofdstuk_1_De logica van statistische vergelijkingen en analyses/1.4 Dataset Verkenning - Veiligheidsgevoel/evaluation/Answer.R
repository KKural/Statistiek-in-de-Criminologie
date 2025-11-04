context({
  testcase("str(df_fear_of_crime_gent)", {
    testEqual("load_data.R", function(env) { 
      # Load the dataset from workdir 
      env$source("load_data.R")
      
      # Return a simple confirmation that dataset exists
      if (exists("df_fear_of_crime_gent", envir = env)) {
        "dataset_loaded"
      } else {
        "dataset_not_found"
      }
    }, "dataset_loaded")
  })
})
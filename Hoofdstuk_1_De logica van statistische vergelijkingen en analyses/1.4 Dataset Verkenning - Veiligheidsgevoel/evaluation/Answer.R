# Load the dataset that will be available to students
source("load_data.R")

context({
  testcase("str(df_fear_of_crime_gent)", {
    testEqual(NULL, function(env) { 
      # Execute the data loading in student environment
      env$source("load_data.R")
      
      # Capture their str() output
      capture.output(env$str(env$df_fear_of_crime_gent))
    }, capture.output(str(df_fear_of_crime_gent)))
  })
})
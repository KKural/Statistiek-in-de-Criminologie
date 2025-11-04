# Load the dataset from the working directory to get expected result
source("../workdir/load_data.R")
expected_dataset <- df_fear_of_crime_gent

context({
  testcase("str(df_fear_of_crime_gent)", {
    testEqual(NULL, function(env) { 
      # Students should source the load_data.R file from their working directory
      env$source("load_data.R")
      
      # Return the class to verify dataset is loaded correctly
      class(env$df_fear_of_crime_gent)
    }, class(expected_dataset))
  })
})
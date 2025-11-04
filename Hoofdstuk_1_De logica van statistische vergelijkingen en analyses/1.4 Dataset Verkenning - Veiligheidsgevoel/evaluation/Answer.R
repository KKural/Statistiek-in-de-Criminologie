# Load the dataset from the working directory to get expected result
source("../workdir/load_data.R")

context({
  testcase("str(df_fear_of_crime_gent)", {
    testEqual(NULL, function(env) { 
      # Students should source the load_data.R file from their working directory
      env$source("load_data.R")
      
      # Just return the dataset itself, like Echo does with simple values
      env$df_fear_of_crime_gent
    }, df_fear_of_crime_gent)
  })
})
context({
  testcase("dplyr library is loaded", {
    testEqual(NULL, function(env) { 
      # Check if dplyr is in the loaded packages
      "package:dplyr" %in% search()
    }, TRUE)
  })
  
  testcase("dplyr functions are available", {
    testEqual(NULL, function(env) { 
      # Check if a key dplyr function exists
      exists("filter", mode = "function")
    }, TRUE)
  })
})
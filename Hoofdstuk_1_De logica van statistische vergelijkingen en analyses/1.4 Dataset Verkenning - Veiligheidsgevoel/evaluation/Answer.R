# Create the sample dataset that students will work with
df_fear_of_crime_gent <- data.frame(
  respondent_id = 1:500,
  leeftijd = sample(18:80, 500, replace = TRUE),
  geslacht = sample(c("Man", "Vrouw", "Anders"), 500, replace = TRUE, prob = c(0.48, 0.48, 0.04)),
  wijk = sample(c("Centrum", "Brugse Poort", "Rabot", "Nieuw Gent", "Mariakerke"), 500, replace = TRUE),
  veiligheidsgevoel_dag = sample(1:5, 500, replace = TRUE),
  veiligheidsgevoel_nacht = sample(1:5, 500, replace = TRUE),
  slachtoffer_laatste_jaar = sample(c("Ja", "Nee"), 500, replace = TRUE, prob = c(0.15, 0.85)),
  type_misdaad = sample(c("Diefstal", "Geweld", "Vandalisme", "Fraude", "Geen"), 500, replace = TRUE, prob = c(0.08, 0.03, 0.05, 0.02, 0.82))
)

context({
  testcase("str(df_fear_of_crime_gent)", {
    testEqual(NULL, function(env) { 
      # Make dataset available in student environment
      env$df_fear_of_crime_gent <- df_fear_of_crime_gent
      
      # Capture the str() output
      capture.output(env$str(env$df_fear_of_crime_gent))
    }, capture.output(str(df_fear_of_crime_gent)))
  })
})
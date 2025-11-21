context({
  testcase(
    "",
    {
      testEqual(
        " ",
        function(env) {
          # This is a reading exercise - no code evaluation needed
          # Students read the materials and proceed to practical exercises
          
          # Check if student has indicated completion (optional)
          completed <- FALSE
          
          if(exists("materiaal_bestudeerd", envir = env)) {
            completed <- get("materiaal_bestudeerd", envir = env) == TRUE
          }
          
          # Always return TRUE for reading exercises
          return(TRUE)
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          
          # Provide encouraging feedback for reading exercise
          feedback_parts <- c(
            "**📚 Studiemateriaal Hoofdstuk 2**",
            "",
            "✅ **Uitstekend!** Je hebt de studiematerialen geraadpleegd.",
            "",
            "**🎯 Wat je nu moet doen:**",
            "• Bekijk alle video's grondig (totaal ~55 minuten)",
            "• Lees hoofdstuk 2 van het handboek (pagina's 45-78)",
            "• Download en bestudeer de cheatsheet",
            "• Maak de online quiz (minimaal 80% score)",
            "• Test jezelf met de interactieve tools",
            "",
            "**📖 Kernconcepten om te beheersen:**",
            "• **Nominaal:** Categorieën zonder ordening (geslacht, delicttype)",
            "• **Ordinaal:** Categorieën met ordening (opleidingsniveau, scores)",
            "• **Interval:** Getallen zonder echt nulpunt (temperatuur °C)",
            "• **Ratio:** Getallen met echt nulpunt (leeftijd, aantal delicten)",
            "",
            "**🔍 Onderzoeksvraagtypen:**",
            "• **Univariate beschrijvende:** Beschrijft één variabele",
            "• **Bivariate beschrijvende:** Beschrijft relatie tussen twee variabelen",
            "• **Bivariate verklarende:** Onderzoekt causaal verband tussen variabelen",
            "",
            "**🚀 Volgende stap:**",
            "Als je alle materialen hebt bestudeerd, ga naar **Oef - 2.1** om te beginnen met praktische oefeningen!",
            "",
            "**💡 Tip:** Houd de cheatsheet bij de hand tijdens de oefeningen."
          )
          
          get_reporter()$add_message(paste(feedback_parts, collapse = "\n"), type = "markdown")
          
          return(TRUE)
        }
      )
    }
  )
})
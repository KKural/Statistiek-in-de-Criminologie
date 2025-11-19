context({
  testcase(
    " ",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        4,  # Correct answer
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "❌ Fout - het heeft **geen statistische betekenis** als variabele. De nummers 1-552 zijn willekeurig toegekend en hebben geen betekenis. Net zoals dossiernummers in criminologisch onderzoek: dossier nr. 12345 is niet 'hoger' dan dossier nr. 678.",
            
            "2" = "❌ Fout - het heeft **geen statistische betekenis** als variabele. Studentnummer 100 is niet 'hoger gerangschikt' dan studentnummer 50. Vergelijkbaar: politienummer van agent heeft geen rangorde-betekenis.",
            
            "3" = "❌ Fout - het heeft **geen statistische betekenis** als variabele. Je kunt geen gemiddelde berekenen van studentnummers. Net zoals je geen gemiddelde kunt berekenen van zaaknummers in rechtbank.",
            
            "4" = "✅ Juist - zoals aangegeven in de classificatietabel: **'Geen van beide (alleen een identificatie)'**. Het studentnummer dient alleen voor identificatie, net zoals dossiernummers, zaaknummers of badge-nummers van politieagenten. Ze hebben geen statistische betekenis voor analyses."
          )
          
          key <- as.character(generated)
          msg <- feedbacks[[key]] %||% "❌ Geef een getal tussen 1 en 4 in."
          
          get_reporter()$add_message(msg, type = "markdown")
          
          generated == expected
        }
      )
    }
  )
})
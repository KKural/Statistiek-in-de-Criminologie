context({
  testcase(
    " ",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        3,  # Correct answer
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "❌ Fout - **Exploratief onderzoek** verkent een nieuw terrein zonder specifieke hypotheses. Criminologische voorbeelden: eerste interviews over cybercrime onder jongeren, verkenning van nieuwe drugshandelsroutes. Dit onderzoek heeft duidelijke hypothese over interventie-effect.",
            
            "2" = "❌ Fout - **Beschrijvend onderzoek** beschrijft 'wat er is' zonder relaties te toetsen. Criminologische voorbeelden: criminaliteitscijfers per wijk, demografische kenmerken van verdachten. Dit onderzoek vergelijkt interventie- en controlegroep om effect te meten.",
            
            "3" = "✅ Juist - **toetsend onderzoek** test of de interventie **effectief** is door hypothese te toetsen (H1: interventie vermindert overlast vs. H0: geen effect). Vergelijkbaar: testen of elektronische enkelband recidive vermindert, of CCTV criminaliteit doet dalen.",
            
            "4" = "❌ Fout - **Voorspellend onderzoek** voorspelt toekomstige uitkomsten. Criminologische voorbeelden: risico-inschatting voor recidive, voorspelling van criminaliteitshotspots. Dit onderzoek meet een interventie-effect, voorspelt niet."
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
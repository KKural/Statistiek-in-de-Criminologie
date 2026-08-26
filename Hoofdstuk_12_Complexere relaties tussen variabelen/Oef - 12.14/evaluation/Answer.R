context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        2,
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = paste0(
              "\u274c Fout. **Waarschijnlijke redenering:** je hebt mogelijk de VIF-waarden van de twee modellen verwisseld ",
              "of de grens verkeerd toegepast.\n\n",
              "**Denkregel:** VIF < 5 is hier aanvaardbaar; VIF ≥ 5 is problematisch en VIF ≥ 10 ernstig.\n\n",
              "**Volgende stap:** noteer de twee VIF-waarden per model in aparte rijen en vergelijk iedere rij opnieuw met dezelfde grenzen."
            ),
            "2" = paste0(
              "\u2705 Juist! **Model B** heeft een ernstig multicollineariteitsprobleem: beide VIF-waarden ",
              "zijn ver boven 10 (circa 34). Dit komt doordat de samengestelde risicoschaal bijna volledig ",
              "lineair afhankelijk is van de ondersteuningsuren (r \u2248 0,99), waardoor de regressiecoëfficiënten ",
              "onbetrouwbaar worden.\n\n",
              "**Model A** heeft geen probleem: VIF \u2248 1,04 voor beide predictoren."
            ),
            "3" = paste0(
              "\u274c Fout. **Waarschijnlijke redenering:** je hebt mogelijk aangenomen dat elke samenhang tussen predictoren ",
              "al een multicollineariteitsprobleem vormt. De diagnose hangt hier af van de VIF-drempel.\n\n",
              "**Denkregel:** noem een model pas problematisch wanneer zijn VIF-waarden de opgegeven beslisgrens bereiken.\n\n",
              "**Volgende stap:** beoordeel Model A en Model B afzonderlijk en combineer de twee classificaties pas daarna tot één antwoord."
            ),
            "4" = paste0(
              "\u274c Fout. **Waarschijnlijke redenering:** je hebt mogelijk Model A als referentie genomen en dezelfde conclusie ",
              "op Model B toegepast zonder de VIF-waarden opnieuw te vergelijken.\n\n",
              "**Denkregel:** beoordeel ieder model op zijn eigen VIF-waarden; boven 10 is volgens de opgegeven grens ernstig.\n\n",
              "**Volgende stap:** vergelijk voor elk model beide getoonde waarden onafhankelijk met 5 en 10 en probeer daarna opnieuw."
            )
          )
          key <- as.character(generated)
          msg <- feedbacks[[key]] %||% "\u274c Geef een getal tussen 1 en 4 in."
          if (identical(generated, expected)) {
            msg <- paste0(msg, "\n\n**Bevestiging:** deze keuze komt overeen met de ongewijzigde antwoordsleutel.\n\n**Denkregel:** vergelijk elke VIF met de vooraf gekozen drempel; waarden ruim boven 10 wijzen op ernstige multicollineariteit.\n\n**Transferstap:** rapporteer bij een nieuw model zowel de VIF-waarden als de gebruikte beslisdrempel.")
          } else if (key %in% names(feedbacks)) {
            msg <- sub("**Denkregel:**", "**Waarom dit niet klopt:** de gekozen modelconclusie past niet bij de getoonde VIF-waarden en hun drempel.\n\n**Denkregel:**", msg, fixed = TRUE)
          } else {
          msg <- paste0(msg, "\n\n**Controleer je invoer:** de invoer is leeg, niet-numeriek of buiten de aangeboden opties; daardoor kan geen inhoudelijke keuze worden vastgesteld.\n\n**Waarom dit niet klopt:** alleen één van de aangeboden optienummers kan met de antwoordsleutel worden beoordeeld.\n\n**Denkregel:** kies een geldige optie nadat elke VIF afzonderlijk met de drempel is vergeleken.\n\n**Volgende stap:** voer 1, 2, 3 of 4 in en label Model A en B apart.")
          }
          get_reporter()$add_message(msg, type = "markdown")
          generated == expected
        }
      )
    }
  )
})

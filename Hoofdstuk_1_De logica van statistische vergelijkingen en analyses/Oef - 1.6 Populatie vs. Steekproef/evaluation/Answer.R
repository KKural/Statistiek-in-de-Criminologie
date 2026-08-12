context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        4,  # Correct answer: Q5 from your rotation pattern
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "❌ Fout. Er is wel degelijk een verschil tussen populatie en steekproef in termen van omvang en representatie.",
            
            "2" = "❌ Fout. Dit is andersom. De steekproef is een deel van de populatie, niet omgekeerd.",
            
            "3" = "❌ Fout. De grootte van een populatie hangt af van wat je onderzoekt, niet van een vast getal.",
            
            "4" = "✅ Juist! Een populatie bestaat uit alle eenheden waarin je geïnteresseerd bent, een steekproef is een subset daarvan. Als je de hele populatie onderzoekt, heet dat een census. Meestal bestudeer je echter een steekproef, omdat het vaak te duur of onpraktisch is om iedereen te onderzoeken."
          )
          
          likely_reasons <- list(
            "1" = "je zag populatie en steekproef mogelijk beide als groepen onderzoekseenheden en liet het onderscheid tussen het volledige doeluniversum en een subset weg.",
            "2" = "je herkende terecht een deel-geheelrelatie, maar draaide mogelijk de richting om: de steekproef wordt uit de populatie getrokken.",
            "3" = "je koppelde ‘populatie’ mogelijk aan een vaste grote omvang, terwijl de afbakening door de onderzoeksvraag en niet door een getalsgrens wordt bepaald."
          )
          key <- as.character(generated)
          msg <- feedbacks[[key]] %||% "❌ Geef een getal tussen 1 en 4 in."
          if (key %in% names(feedbacks) && generated != expected) {
            msg <- paste0(
              "**Waarschijnlijke redenering:** ", likely_reasons[[key]], "\n\n",
              "**Waarom dit niet klopt:** ",
              msg,
              "\n\n**Denkregel:** Definieer eerst de doelverzameling en daarna de gemeten subset; verwissel deze niveaus niet.\n\n",
              "**Volgende stap:** Schrijf apart op wie tot de populatie behoort en wie werkelijk deelnam, en kies opnieuw."
            )
          } else if (key %in% names(feedbacks) && generated == expected) {
            msg <- paste0(
              "**Bevestiging:** je gekozen optie is correct.\n\n",
              msg,
              "\n\n**Denkregel:** De populatie is de volledige doelgroep waarover je wilt concluderen; de steekproef is het onderzochte deel.\n\n",
              "**Transferstap:** Benoem populatie en steekproef voor een gemeentelijke slachtofferenquete en controleer wie niet werd bereikt."
            )
          }
          
          if (!key %in% names(feedbacks)) {
            msg <- paste0(
              "**Invoercontrole:** je invoer lijkt niet overeen te komen met één van de aangeboden optienummers; dit kan een typefout of een andere invoerinterpretatie zijn.\n\n",
              "**Waarom dit niet klopt:** de evaluator kan alleen een inhoudelijke optie beoordelen wanneer één geldig optienummer is ingevoerd.\n\n",
              "**Denkregel:** koppel eerst elke antwoordoptie aan haar nummer en voer uitsluitend dat ene nummer in.\n\n",
              "**Volgende stap:** lees de opties opnieuw, kies het nummer dat bij je redenering hoort en dien alleen dat nummer in."
            )
          }
          get_reporter()$add_message(msg, type = "markdown")
          
          generated == expected
        }
      )
    }
  )
})

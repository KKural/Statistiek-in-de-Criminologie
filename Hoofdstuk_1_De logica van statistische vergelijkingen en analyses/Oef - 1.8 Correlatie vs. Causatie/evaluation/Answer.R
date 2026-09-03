context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        3, # Correct answer: Q8 from your rotation pattern
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "❌ Fout. Een kosten-batenanalyse is beleidsmatig relevant, maar niet de kernbeperking van deze causale conclusie.",
            "2" = "❌ Fout. Meetbeperkingen zijn mogelijk, maar zelfs met perfecte meting volgt causaliteit niet automatisch uit samenhang.",
            "3" = "✅ Juist! Er kunnen confounding variabelen zijn: rijkere wijken hebben misschien zowel meer straatverlichting ALS minder criminaliteit door andere factoren (meer politie, beter onderwijs, meer werkgelegenheid).",
            "4" = "❌ Fout. Beperkte generaliseerbaarheid naar andere steden is relevant, maar dat is niet de kernbeperking van deze causale conclusie."
          )

          likely_reasons <- list(
            "1" = "je zag mogelijk meteen een praktische beleidsvraag en koos daarom voor kosten-baten, terwijl de vraag focust op de logica van causale inferentie.",
            "2" = "je legde de nadruk mogelijk op datakwaliteit, maar ook kwalitatief sterke metingen kunnen een causaal besluit niet op zichzelf rechtvaardigen.",
            "4" = "je dacht mogelijk aan veralgemeenbaarheid naar andere steden, terwijl de belangrijkste beperking hier intern-causaal is."
          )
          key <- as.character(generated)
          msg <- feedbacks[[key]] %||% "❌ Geef een getal tussen 1 en 4 in."
          if (key %in% names(feedbacks) && generated != expected) {
            msg <- paste0(
              "**Waarom deze keuze begrijpelijk kan lijken:** ", likely_reasons[[key]], "\n\n",
              "**Waarom dit niet klopt:** ",
              msg,
              "\n\n**Denkregel:** Een derde variabele kan zowel X als Y sturen; correlatie alleen maakt X daarom niet tot oorzaak.\n\n",
              "**Volgende stap:** Zoek bij je optie een alternatieve verklaring en kies de uitspraak die deze causale beperking erkent."
            )
          } else if (key %in% names(feedbacks) && generated == expected) {
            msg <- paste0(
              "**Bevestiging:** je gekozen optie is correct.\n\n",
              msg,
              "\n\n**Denkregel:** Een samenhang bewijst geen causaliteit zolang confounders en omgekeerde richting niet zijn uitgesloten.\n\n",
              "**Transferstap:** Noem voor straatverlichting en criminaliteit een derde variabele die beide kan beinvloeden en teken de twee pijlen."
            )
          }

          if (!key %in% names(feedbacks)) {
            msg <- paste0(
              "**Controleer je invoer:** je invoer lijkt niet overeen te komen met één van de aangeboden optienummers; dit kan een typefout of een andere invoerinterpretatie zijn.\n\n",
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

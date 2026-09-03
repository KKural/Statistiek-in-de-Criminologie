context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        2,  # Correct answer
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "Nominale categorieën hebben geen rangorde, terwijl de empathie-antwoorden wel lopen van 'heel onwaarschijnlijk' naar 'heel waarschijnlijk'. **In het handboek:** **Deel I, Hoofdstuk 2, p. 29-30** (**PDF p. 12-13**).",

            "2" = "✅ Juist - **ordinaal** meetniveau met antwoordopties gaande van heel onwaarschijnlijk tot en met heel waarschijnlijk, de categorieën zijn ordenbaar maar de afstand tussen de categorieën is niet gelijk. Het verschil in betekenis tussen onwaarschijnlijk en neutraal is niet exact hetzelfde als tussen waarschijnlijk en heel waarschijnlijk. **In het handboek:** **Deel I, Hoofdstuk 2, p. 29-30** (**PDF p. 12-13**). <a href='https://www.youtube.com/watch?v=KJPXZIEmvfA' target='_blank' rel='noopener noreferrer'>Lees meer</a>",

            "3" = "De categorieën zijn geordend, maar het betekenisverschil tussen 'onwaarschijnlijk' en 'neutraal' hoeft niet gelijk te zijn aan dat tussen 'waarschijnlijk' en 'heel waarschijnlijk'. Nummers op antwoordopties bewijzen geen gelijke intervallen. **In het handboek:** **Deel I, Hoofdstuk 2, p. 29-30** (**PDF p. 12-13**). <a href='https://www.youtube.com/watch?v=KJPXZIEmvfA' target='_blank' rel='noopener noreferrer'>Lees meer</a>",

            "4" = "'Heel onwaarschijnlijk' betekent niet dat empathie objectief nul is, en ook gelijke afstanden zijn niet aangetoond. Ratio vereist zowel gelijke intervallen als een werkelijk nulpunt waarbij afwezigheid van de eigenschap betekenisvol is. **In het handboek:** **Deel I, Hoofdstuk 2, p. 29-30** (**PDF p. 12-13**)."
          )

          likely_reasons <- list(
            "1" = "je zag antwoordcategorieën en koppelde die mogelijk daarom aan nominaal, zonder hun volgorde van onwaarschijnlijk naar waarschijnlijk mee te nemen.",
            "3" = "je behandelde de genummerde antwoordposities mogelijk alsof de afstand tussen elk paar opeenvolgende categorieën gelijk is.",
            "4" = "je interpreteerde het laagste antwoord mogelijk als een werkelijk nulpunt waarop empathie volledig afwezig is."
          )
          key <- as.character(generated)
          msg <- feedbacks[[key]] %||% "❌ Geef een getal tussen 1 en 4 in."
          if (key %in% names(feedbacks) && generated != expected) {
            msg <- paste0(
              "**Waarom deze keuze begrijpelijk kan lijken:** ", likely_reasons[[key]], "\n\n",
              "**Waarom dit niet klopt:** ",
              msg,
              "\n\n**Denkregel:** Het gebruik van cijfers maakt antwoordcategorieen niet automatisch interval; controleer of afstanden inhoudelijk gelijk zijn.\n\n",
              "**Volgende stap:** Vergelijk twee opeenvolgende schaalafstanden en kies opnieuw voor het niveau dat alleen rangorde vereist."
            )
          } else if (key %in% names(feedbacks) && generated == expected) {
            msg <- paste0(
              "**Bevestiging:** je gekozen optie is correct.\n\n",
              msg,
              "\n\n**Denkregel:** Een empathieschaal is ordinaal: categorieen zijn ordenbaar, maar hun psychologische afstanden zijn niet bewezen gelijk.\n\n",
              "**Transferstap:** Classificeer een vijfpuntsschaal voor vertrouwen in de politie en motiveer waarom rangorde wel maar gelijke afstand niet gegarandeerd is."
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

context({
  testcase(
    " ",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        3,  # Correct answer: causaliteit impliceert statistische samenhang
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "❌ Fout. Statistische samenhang is **niet** voldoende om causaliteit te bewijzen. Statistiek toont enkel verbanden; de oorzakelijke interpretatie komt uit theorie, kennis van mechanismen en onderzoeksdesign. [Lees meer over correlatie en causaliteit](https://www.scribbr.com/methodology/correlation-vs-causation/)",
            "2" = "❌ Fout. Causaliteit **kan** empirisch onderzocht worden (bv. via experimenten, longitudinaal onderzoek, mediatieanalyse), maar statistiek levert geen waterdicht bewijs. Ze toont robuuste verbanden die we inhoudelijk moeten interpreteren. [Lees meer](https://www.scribbr.com/methodology/correlation-vs-causation/)",
            "3" = "✅ Juist! Als er een echte causale relatie is, zal er in de populatie ook statistische samenhang zijn. Het omgekeerde geldt niet: statistische samenhang op zich is geen bewijs van causaliteit. [Lees meer](https://www.scribbr.com/methodology/correlation-vs-causation/)",
            "4" = "❌ Fout. Causaliteit is een theoretisch/filosofisch begrip, terwijl statistische relaties enkel de **empirische samenhang** beschrijven. Twee variabelen kunnen correleren zonder dat er een oorzakelijk verband is (schijnverband). [Lees meer over confounding](https://www.scribbr.com/methodology/confounding-variables/)"
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

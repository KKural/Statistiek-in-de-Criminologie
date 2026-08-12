context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        3,  # Correct answer: causaliteit impliceert statistische samenhang
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = "❌ **Je keuze is begrijpelijk:** je koppelt een zichtbaar statistisch verband aan een oorzakelijke verklaring.\n\n**Waarom dit hier niet volstaat:** hetzelfde verband kan ontstaan door een derde variabele, omgekeerde richting of toeval. Samenhang is dus geen voldoende bewijs voor causaliteit.\n\n**Denkregel voor je volgende poging:** vraag apart: (1) is er samenhang, en (2) ondersteunen theorie, tijdsvolgorde, mechanisme en onderzoeksdesign een causale interpretatie? <a href='https://www.scribbr.com/methodology/correlation-vs-causation/' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            "2" = "❌ **Je antwoord past bij een veelvoorkomende overcorrectie:** omdat statistiek geen waterdicht causaal bewijs levert, concludeer je dat causaliteit nooit empirisch onderzocht kan worden.\n\n**Waarom dit niet klopt:** experimenten, longitudinaal onderzoek en mediatieanalyse kunnen causale verklaringen wel degelijk ondersteunen, zonder absolute zekerheid te garanderen.\n\n**Denkregel:** onderscheid *empirisch onderbouwen* van *definitief bewijzen*. <a href='https://www.scribbr.com/methodology/correlation-vs-causation/' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            "3" = "✅ **Juist.** Een echte causale relatie impliceert in de populatie statistische samenhang, maar de omgekeerde redenering is ongeldig: samenhang alleen bewijst geen causaliteit.\n\n**Versterk je redenering:** onthoud de éénrichtingsregel: causaliteit → samenhang; samenhang ⇏ automatisch causaliteit. <a href='https://www.scribbr.com/methodology/correlation-vs-causation/' target='_blank' rel='noopener noreferrer'>Lees meer</a>",
            "4" = "❌ **Je keuze suggereert dat je een causaal begrip en een statistische beschrijving als hetzelfde behandelt.**\n\n**Waarom dit fout is:** een statistische relatie beschrijft hoe variabelen samen veranderen; causaliteit voegt een inhoudelijke uitspraak toe over wat een verandering voortbrengt. Een schijnverband kan dus statistisch sterk zijn zonder causaal te zijn.\n\n**Denkregel:** vraag: beschrijf ik alleen een patroon, of verklaar ik ook waarom X tot Y leidt? <a href='https://www.scribbr.com/methodology/correlation-vs-causation/' target='_blank' rel='noopener noreferrer'>Lees meer</a>"
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

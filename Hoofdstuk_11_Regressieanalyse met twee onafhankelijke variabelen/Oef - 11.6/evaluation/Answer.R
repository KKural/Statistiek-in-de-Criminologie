context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          expected <- c(
            vraag1 = 2,
            vraag2 = 3,
            vraag3 = 2,
            vraag4 = 2,
            vraag5 = 2,
            vraag6 = 1,
            vraag7 = 1,
            vraag8 = 1,
            vraag9 = 1,
            vraag10 = 1,
            vraag11 = 2,
            vraag12 = 2,
            vraag13 = 3,
            vraag14 = 3
          )

          parse_num <- function(x) {
            if (is.character(x)) {
              x <- trimws(x)
              if (grepl("^[A-Da-d]$", x)) return(match(toupper(x), c("A", "B", "C", "D")))
              x <- gsub(",", ".", x, fixed = TRUE)
            }
            suppressWarnings(as.numeric(x))
          }

          res <- lapply(names(expected), function(q) {
            if (!exists(q, envir = env)) {
              return(list(q = q, ok = FALSE, val = NA, num = NA_real_,
                          expected = expected[[q]], reason = "missing"))
            }
            raw <- get(q, envir = env)
            num <- parse_num(raw)
            ok <- !is.na(num) && abs(num - expected[[q]]) < 0.5
            list(q = q, ok = ok, val = raw, num = num, expected = expected[[q]],
                 reason = if (ok) "ok" else "wrong")
          })
          names(res) <- names(expected)
          assign("mcq_results", res, envir = globalenv())

          all(vapply(res, function(x) isTRUE(x$ok), logical(1)))
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          res <- get("mcq_results", envir = globalenv())
          labels <- c(
            vraag1 = "Verschil voorspelde waarde en residu",
            vraag2 = "Betekenis van CI dat 0 bevat",
            vraag3 = "Betekenis van niet-significante coëfficiënt",
            vraag4 = "Nut van niet-significante predictor",
            vraag5 = "Waarom coëfficiënten veranderen",
            vraag6 = "Bivariaat vs multivariaat significantie",
            vraag7 = "Adjusted R² vs R²",
            vraag8 = "Concept multicollineariteit",
            vraag9 = "Concept ΔR²",
            vraag10 = "Ceteris paribus interpretatie van b",
            vraag11 = "95%-CI van b2 volledig positief",
            vraag12 = "Sterkste relatieve effect: welke parameter?",
            vraag13 = "Vrijheidsgraden foutterm (df residual)",
            vraag14 = "b positief maar bivariate correlatie negatief"
          )

          # Each selectable option has its own four-part explanation:
          # likely reasoning || why it is/is not correct || decision rule || next step.
          feedback <- list(
            vraag1 = c(
              "Je koppelt voorspellen aan een gemiddelde en residu aan onzekerheid.||Een voorspelde waarde is modelspecifiek, terwijl een standaardfout onzekerheid meet; geen van beide definieert het residu.||Gebruik altijd Y_i = Yhat_i + e_i.||Schrijf bij een observatie eerst Yhat_i en bereken daarna e_i = Y_i - Yhat_i.",
              "Je onderscheidt de modelvoorspelling van de overblijvende afwijking.||Yhat_i is de geschatte uitkomst en e_i = Y_i - Yhat_i is precies het residu.||Gebruik altijd Y_i = Yhat_i + e_i.||Controleer ook het teken: ligt Y_i boven Yhat_i, dan is e_i positief.",
              "Je behandelt voorspellen als noodzakelijk overschatten en het residu als een absolute afstand.||Zowel voorspellingen als residuen kunnen hoger, lager of nul zijn; een residu behoudt zijn teken.||Een residu is de getekende verticale afwijking Y_i - Yhat_i.||Neem Y_i = 8 en Yhat_i = 10 en bereken het residu met teken.",
              "Je gebruikt voorspelde waarde en residu als synoniemen.||Het zijn verschillende termen in dezelfde decompositie: de ene is fitted, de andere blijft onverklaard.||Label in Y_i = Yhat_i + e_i elk symbool voordat je interpreteert.||Maak een zin voor Yhat_i en een aparte zin voor e_i."
            ),
            vraag2 = c(
              "Je laat de positieve puntschatting zwaarder wegen dan het interval.||Het interval bevat ook nul; daarom is een nul-effect bij een tweezijdige toets op 5% nog verenigbaar met de data.||Beoordeel significantie door het volledige 95%-interval met nul te vergelijken.||Teken -0,2, 0 en 1,0 op een getallenlijn.",
              "Je ziet de negatieve ondergrens en concludeert dat het effect negatief is.||Een interval dat van negatief naar positief loopt, legt het teken niet vast.||Volledig onder nul betekent negatief; volledig boven nul positief; nul erin betekent niet significant.||Markeer eerst nul en daarna beide intervalgrenzen.",
              "Je controleert terecht of nul in het interval ligt.||Omdat [-0,2; 1,0] nul bevat, is er op 5% onvoldoende bewijs voor een niet-nulcoefficient.||Een tweezijdige 5%-toets en een 95%-BI geven dezelfde nulbeslissing.||Formuleer voorzichtig: onvoldoende bewijs, niet bewezen dat het effect exact nul is.",
              "Je trekt uit onzekerheid over een coefficient een oordeel over het hele model.||Een interval voor een coefficient beslist niet of het volledige model ongeldig is.||Scheid coefficientinferentie, totale modeltoets en assumptiediagnostiek.||Benoem expliciet op welk van die drie niveaus de vraag zit."
            ),
            vraag3 = c(
              "Je vertaalt niet significant naar nooit relevant.||De conclusie geldt alleen voor deze data en modelspecificatie en kan samenhangen met power of gedeelde variantie.||Afwezig bewijs is niet hetzelfde als bewijs van afwezigheid.||Voeg aan je conclusie toe: gegeven dit model en deze steekproef.",
              "Je formuleert de inferentie voorzichtig en modelspecifiek.||Niet significant betekent onvoldoende bewijs voor een uniek effect, gegeven de andere predictoren.||Interpreteer p of BI als bewijssterkte, niet als absolute waarheid over relevantie.||Bekijk daarna BI, theorie, power en de rol van de predictor.",
              "Je vermoedt dat een onverwachte uitkomst automatisch een datafout is.||Een geldige dataset kan een niet-significant resultaat geven door ruis, kleine power of overlappende predictoren.||Controleer datakwaliteit en statistische evidentie als twee afzonderlijke vragen.||Doe eerst datacontroles; interpreteer daarna coefficient en interval.",
              "Je gebruikt een automatische p-waarde-regel om de predictor te verwijderen.||Een controlevariabele of confounder kan inhoudelijk nodig zijn zonder zelf significant te zijn.||Modelkeuze combineert onderzoeksvraag, theorie, doel en onzekerheid.||Noteer eerst de functie van de predictor voordat je over verwijderen beslist."
            ),
            vraag4 = c(
              "Je stelt bruikbaarheid gelijk aan statistische significantie.||Een predictor kan nodig zijn als controle, confounder of theoretisch onderdeel van het model.||Vraag eerst welke inhoudelijke of causale rol een variabele speelt.||Geef een voorbeeld waarin controle voor leeftijd een andere coefficient zuiverder maakt.",
              "Je onderscheidt inferentie van modelrol.||Een niet-significante predictor kan nuttig blijven voor controle, theorie of betere schatting van andere effecten.||Beoordeel relevantie niet met p alleen, maar met doel, theorie en onzekerheid.||Schrijf in een zin welke rol de predictor in dit model heeft.",
              "Je gebruikt n < 30 als automatische uitsluitregel.||Steekproefgrootte beinvloedt precisie en power, maar beslist niet of een predictor conceptueel nuttig is.||Scheid de precisievraag van de inhoudelijke modelrol.||Beschrijf apart wat een groter n en wat goede theorie zou veranderen.",
              "Je gebruikt R-kwadraat > 0,5 als universele kwaliteitsgrens.||Zo'n grens is contextafhankelijk en zegt niet welke rol een specifieke predictor heeft.||Scheid totale model fit van de bijdrage of controlefunctie van een variabele.||Maak twee kolommen: modelmaat en predictorrol."
            ),
            vraag5 = c(
              "Je schrijft coefficientverandering toe aan willekeur van software.||Bij dezelfde data en specificatie is de schatting reproduceerbaar; toevoegen van predictoren verandert wat constant wordt gehouden.||Een nieuw model schat een nieuw partieel verband.||Vergelijk welke variabelen in beide modellen worden gecontroleerd.",
              "Je herkent dat regressiecoefficienten conditionele effecten zijn.||Nieuwe predictoren verdelen gedeelde variantie anders en veranderen dus de ceteris-paribusinterpretatie.||Interpreteer elke coefficient binnen de exacte modelspecificatie.||Schrijf voor elk model de zin: bij gelijk houden van ...",
              "Je ziet een coefficient als een vaste eigenschap van een variabele.||Een coefficient hangt af van uitkomst, schaal, steekproef en opgenomen covariaten.||Een regressiecoefficient behoort bij een model, niet los bij X.||Zet naast elke coefficient de modelspecificatie waarin hij is geschat.",
              "Je denkt dat alleen standaardiseren coefficienten kan veranderen.||Ook ongestandaardiseerde coefficienten veranderen wanneer de conditionering en gedeelde variantie veranderen.||Scheid schaalverandering van wijziging van de predictorenset.||Vraag eerst: werd de schaal veranderd of werd een predictor toegevoegd?"
            ),
            vraag6 = c(
              "Je onderscheidt het totale bivariate verband van de unieke multivariabele bijdrage.||Na controle voor X2 kan weinig unieke informatie van X1 overblijven.||Bivariaat en partieel beantwoorden verschillende vragen.||Vergelijk correlatie X1-Y met b1 en noteer welke variabele wordt gecontroleerd.",
              "Je veronderstelt een vaste p-waarde boven 0,5 zodra een predictor niet significant wordt.||De p-waarde hangt af van coefficient, standaardfout en steekproef; er is geen vaste grens boven 0,5.||Leid significantie af uit b gedeeld door SE of uit het BI.||Bekijk welke van b en SE door toevoeging van X2 verandert.",
              "Je concludeert dat een bivariate analyse daarom fout is.||De analyse kan correct zijn maar een ander, ongecontroleerd verband schatten.||Noem het estimand: totaal verband of uniek verband gegeven X2.||Label beide resultaten voordat je ze vergelijkt.",
              "Je probeert het verschil via een negatief R-kwadraat te verklaren.||In standaard OLS met intercept daalt R-kwadraat niet door een predictor toe te voegen; dit verklaart de coefficienttoets niet.||Scheid totale fit van de unieke toets van een predictor.||Onderzoek b1 en zijn SE in plaats van alleen R-kwadraat."
            ),
            vraag7 = c(
              "Je koppelt de correctie terecht aan modelcomplexiteit.||Adjusted R-kwadraat verrekent zowel steekproefgrootte n als het aantal predictoren k; gewoon R-kwadraat doet dat niet.||Gebruik adjusted R-kwadraat wanneer extra predictoren op eerlijke fitwinst worden beoordeeld.||Leg uit waarom een zwakke extra predictor R-kwadraat toch iets kan verhogen.",
              "Je denkt dat de aangepaste maat altijd groter is.||Door de strafterm is adjusted R-kwadraat normaal kleiner dan of gelijk aan R-kwadraat.||Adjusted betekent gecorrigeerd voor complexiteit, niet opgehoogd.||Denk aan een irrelevante extra predictor en voorspel beide maten.",
              "Je beperkt R-kwadraat tot precies een predictor.||R-kwadraat vat verklaarde variatie van het volledige regressiemodel samen, ook bij meerdere predictoren.||Lees een modelmaat op modelniveau, niet op predictorenniveau.||Noem alle predictoren waarvan de gezamenlijke fit wordt samengevat.",
              "Je verwart de correctie met het verwijderen van het intercept.||Adjusted R-kwadraat past de fitmaat via vrijheidsgraden aan; het herspecificeert het model niet.||Scheid een formule voor een maat van een keuze van modeltermen.||Controleer in de formule waar n en k voorkomen."
            ),
            vraag8 = c(
              "Je focust op de samenhang tussen predictoren.||Sterke X-X-samenhang maakt unieke effecten moeilijk te scheiden en kan standaardfouten vergroten.||Multicollineariteit gaat over afhankelijkheid binnen de predictorenset.||Vergelijk een correlatiematrix of VIF met de coefficientonzekerheid.",
              "Je verwart multicollineariteit met niet-normale residuen.||Residual normality is een andere diagnostiek en zegt niet dat predictoren onderling sterk samenhangen.||Gebruik VIF/correlaties voor predictoren en een Q-Q-plot voor residuen.||Kies eerst of de vraag over X-variabelen of fouten gaat.",
              "Je denkt dat sterk samenhangende predictoren een perfecte voorspelling van Y garanderen.||X-X-samenhang kan hoog zijn terwijl de gezamenlijke relatie met Y zwak blijft.||Scheid informatie-overlap tussen X'en van voorspelkracht voor Y.||Teken X1-X2 en X-Y als twee verschillende pijlen.",
              "Je verbindt afwezigheid van uitbijters aan multicollineariteit.||Uitbijters zijn observatieniveauproblemen; multicollineariteit is een structuur tussen predictoren.||Gebruik invloeddiagnostiek voor rijen en VIF voor kolommen.||Noteer welke diagnostiek bij welk probleem hoort."
            ),
            vraag9 = c(
              "Je leest delta als verandering tussen geneste modellen.||Delta R-kwadraat is R-kwadraat van het uitgebreide model min dat van het beperktere model.||Een delta van een fitmaat vergelijkt dezelfde maat op twee modelstappen.||Schrijf beide R-kwadraten onder elkaar en trek oud van nieuw af.",
              "Je verwart een modelverschil met de residugrootte van een observatie.||Een absoluut residu ligt op observatieniveau; delta R-kwadraat ligt op modelniveau.||Controleer eerst het analyseniveau: observatie, coefficient of model.||Vraag welke twee modellen in de vergelijking staan.",
              "Je ziet delta als verschil tussen b en beta.||b en beta zijn coefficientschalen; R-kwadraat is een fitmaat en delta duidt modelverandering aan.||Vergelijk alleen grootheden met dezelfde naam en eenheid.||Onderstreep R-kwadraat aan beide kanten van de aftrekking.",
              "Je koppelt delta R-kwadraat aan de p-waarde van het intercept.||Een intercepttoets is een parametertoets en is niet de definitie van fitwinst.||Scheid parameterinferentie van verandering in model fit.||Noem eerst de twee R-kwadraatwaarden die nodig zijn."
            ),
            vraag10 = c(
              "Je gebruikt de ceteris-paribusinterpretatie.||b1 is de verwachte verandering in Y bij een eenheid X1, terwijl de andere predictoren constant blijven.||Noem richting, eenheden en wat constant wordt gehouden.||Vul de concrete eenheden van Y en X1 in de interpretatie in.",
              "Je behandelt b1 als een correlatie.||Een regressiecoefficient is directioneel, heeft eenheden en is partieel; r is symmetrisch en schaalvrij.||Controleer of de grootheid een helling of een correlatie is.||Schrijf de eenheden Y-eenheden per X1-eenheid.",
              "Je koppelt X1 = 0 aan b1.||De voorspelling wanneer alle predictoren nul zijn hoort bij het intercept; b1 is de helling.||In Yhat = b0 + b1X1 + b2X2 heeft elke term een eigen rol.||Markeer b0 als startpunt en b1 als verandering.",
              "Je maakt van elke coefficient automatisch een percentage.||Dat mag alleen als de variabelen of transformaties een procentinterpretatie ondersteunen.||Begin bij de oorspronkelijke schalen en eenheden.||Controleer of Y of X1 als percentage of logaritme is gemeten."
            ),
            vraag11 = c(
              "Je ziet breedte als onzekerheid en concludeert daardoor niet significant.||Een interval kan breed zijn en toch volledig boven nul liggen; uitsluiten van nul is beslissend.||Vergelijk beide grenzen met nul, niet alleen de breedte.||Teken de volledige intervalpositie op een getallenlijn.",
              "Je controleert terecht dat het hele interval positief is.||Als beide 95%-grenzen boven nul liggen, is b2 positief en tweezijdig significant op 5%.||Volledig boven nul betekent positief significant bij de gekoppelde toets.||Rapporteer ook interval en richting, niet alleen significantie.",
              "Je gebruikt een interval van b2 om iets over het intercept te zeggen.||Een interval hoort uitsluitend bij de parameter op die rij.||Koppel elke inferentie aan de juiste coefficientnaam.||Markeer b0, b1 en b2 apart in de output.",
              "Je leidt een hoge R-kwadraat af uit de significantie van b2.||Coefficientinferentie en totale verklaarde variantie zijn verschillende eigenschappen.||Scheid parameterniveau van modelniveau.||Rapporteer b2 met BI en R-kwadraat als twee aparte resultaten."
            ),
            vraag12 = c(
              "Je vergelijkt ongestandaardiseerde b's als maat van relatieve sterkte.||Hun grootte hangt af van de meeteenheden, zodat verschillende schalen de vergelijking vertekenen.||Vergelijk absolute beta's voor relatieve effecten op een gemeenschappelijke schaal.||Controleer eerst of de coefficienten gestandaardiseerd zijn.",
              "Je kiest de grootste absolute gestandaardiseerde beta.||Beta's drukken effecten in standaarddeviaties uit en zijn daardoor onderling vergelijkbaar binnen het model.||Voor relatieve sterkte vergelijk je absolute beta, met behoud van het teken voor richting.||Noem zowel grootste absolute waarde als richting.",
              "Je gebruikt de invoervolgorde als rangorde van effecten.||Blok- of invoervolgorde beschrijft modelopbouw, niet automatisch effectsterkte.||Scheid procedurele volgorde van een effectmaat.||Zoek in de tabel expliciet de beta-kolom.",
              "Je stelt de kleinste p-waarde gelijk aan de grootste beta.||Een p-waarde hangt ook af van standaardfout en n en meet bewijs, niet effectgrootte.||Houd effectgrootte en evidentie in aparte kolommen.||Vergelijk beta voor grootte en p of BI voor onzekerheid."
            ),
            vraag13 = c(
              "Je gebruikt k - 1, een telling die eerder bij groepsvergelijkingen voorkomt.||Regressie schat k hellingen plus een intercept en verbruikt dus k + 1 parameters.||Residual df = n min het aantal geschatte parameters.||Tel intercept en alle k predictoren expliciet.",
              "Je gebruikt n - 1, de totale vrijheidsgraden.||De residuele vrijheidsgraden moeten ook de k hellingen aftrekken.||Total df wordt opgesplitst in model df en residual df.||Schrijf n - 1 = k + [n - k - 1].",
              "Je telt alle geschatte regressieparameters mee.||Met n observaties, k hellingen en een intercept blijven n - k - 1 residuele vrijheidsgraden over.||Residual df = observaties min geschatte parameters.||Controleer met een klein voorbeeld, bijvoorbeeld n = 10 en k = 2.",
              "Je geeft k + 1, het aantal gebruikte parameters.||Dat is wat het model verbruikt, niet wat voor de foutterm overblijft.||Scheid parameter count van resterende vrijheidsgraden.||Maak twee vakken: gebruikt k + 1 en resterend n - k - 1."
            ),
            vraag14 = c(
              "Je beschouwt een tekenomslag automatisch als een softwarefout.||Conditioneren op X1 kan het verband van X2 met Y legitiem van teken doen veranderen.||Controleer suppressie of confounding voordat je een rekenfout concludeert.||Vergelijk bivariate correlatie en partiele coefficient met dezelfde codering.",
              "Je verklaart de tekenomslag met niet-normaliteit van Y.||Normaliteit van Y is niet de definitie van een tekenomslag; de covarianties en modelspecificatie zijn centraal.||Scheid verdelingsassumpties van conditionele verbanden.||Teken de relaties X1-X2, X1-Y en X2-Y.",
              "Je herkent een suppressor- of conditioneringseffect.||Na controle voor X1 kan de unieke component van X2 positief samenhangen met Y, ondanks een negatieve bivariate correlatie.||Vergelijk een totaal verband met een partieel verband gegeven de andere predictor.||Leg in woorden uit welke gedeelde variantie door X1 wordt verwijderd.",
              "Je schrijft de tekenomslag automatisch toe aan een kleine steekproef.||Een klein n kan instabiliteit geven, maar zonder informatie over n is suppressie de conceptuele verklaring voor dit patroon.||Scheid precisieproblemen van de structuur van gedeelde variantie.||Bekijk zowel BI als de correlaties voordat je een oorzaak kiest."
            )
          )

          lines <- character(0)
          score <- 0
          total <- length(res)

          for (q in names(res)) {
            r <- res[[q]]
            heading <- paste0("### ", sub("vraag", "Vraag ", q), " — ", labels[[q]])

            if (identical(r$reason, "missing")) {
              message <- paste0(
                "❌ **Geen antwoord gevonden.** De variabele ", q, " ontbreekt.\n\n",
                "**Denkregel:** elke vraag heeft een afzonderlijke variabele met een keuze van 1 tot 4.\n\n",
                "**Volgende stap:** voeg ", q, " toe en koppel de waarde aan de gekozen optie."
              )
            } else if (!isTRUE(r$ok) && (is.na(r$num) || r$num < 1 || r$num > 4 ||
                       abs(r$num - round(r$num)) > .Machine$double.eps^0.5)) {
              message <- paste0(
                "❌ **Ongeldige keuze:** ", as.character(r$val), ".\n\n",
                "**Denkregel:** dit is een meerkeuzevraag; alleen 1, 2, 3 of 4 (ook A, B, C of D) kan aan een optie worden gekoppeld.\n\n",
                "**Volgende stap:** lees de vier opties opnieuw en geef precies één geldige keuze."
              )
            } else {
              # The original grader accepts values within 0.5 of the keyed option.
              # Use the keyed option for those accepted values so display and score agree.
              choice <- if (isTRUE(r$ok)) {
                as.character(r$expected)
              } else {
                as.character(as.integer(round(r$num)))
              }
              parts <- strsplit(feedback[[q]][[as.integer(choice)]], "||", fixed = TRUE)[[1]]
              if (isTRUE(r$ok)) {
                score <- score + 1
                message <- paste0(
                  "✅ **Correct — optie ", choice, ".**\n\n",
                  "**Jouw redenering:** ", parts[[1]], "\n\n",
                  "**Waarom dit klopt:** ", parts[[2]], "\n\n",
                  "**Denkregel:** ", parts[[3]], "\n\n",
                  "**Volgende stap:** ", parts[[4]]
                )
              } else {
                message <- paste0(
                  "❌ **Nog niet — optie ", choice, ".** Het correcte antwoord is **optie ", r$expected, "**.\n\n",
                  "**Waarschijnlijke redenering:** ", parts[[1]], "\n\n",
                  "**Waarom dit niet klopt:** ", parts[[2]], "\n\n",
                  "**Denkregel:** ", parts[[3]], "\n\n",
                  "**Volgende stap:** ", parts[[4]]
                )
              }
            }
            lines <- c(lines, paste(heading, message, sep = "\n\n"))
          }

          lines <- c(lines, paste0("\n**Score: ", score, " / ", total, "**"))
          get_reporter()$add_message(paste(lines, collapse = "\n\n---\n\n"), type = "markdown")

          generated == expected
        }
      )
    }
  )
})

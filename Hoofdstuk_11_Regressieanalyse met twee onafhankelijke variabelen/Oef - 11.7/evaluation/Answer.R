context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          expected <- c(
            vraag1  = 2,   # R = 0.664 ~ 0.66
            vraag2  = 4,   # R2 = 0.4409 ~ 44%
            vraag3  = 3,   # 1 - 0.44 = 56%
            vraag4  = 4,   # N = 5
            vraag5  = 3,   # F = 0.79, niet significant (p = .559)
            vraag6  = 3,   # intercept = -9.98
            vraag7  = 1,   # b1 = 13.55, ceteris paribus
            vraag8  = 2,   # WanordeIndex, beta1 = 0.90
            vraag9  = 3,   # geen enkele parameter significant
            vraag10 = 3,   # CI bevat 0 -> niet significant
            vraag11 = 4    # predicted = 68.43
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
              return(list(q = q, ok = FALSE, val = NA, choice = NA_real_, expected = expected[[q]], reason = "missing"))
            }
            raw <- get(q, envir = env)
            num <- parse_num(raw)
            ok <- !is.na(num) && abs(num - expected[[q]]) < 0.5
            valid_choice <- !is.na(num) && num %in% 1:4
            list(
              q = q,
              ok = ok,
              val = raw,
              choice = num,
              expected = expected[[q]],
              reason = if (ok) "ok" else if (valid_choice) "wrong" else "invalid"
            )
          })
          names(res) <- names(expected)
          assign("mcq_results_11_8", res, envir = globalenv())

          all(vapply(res, function(x) isTRUE(x$ok), logical(1)))
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          res <- get("mcq_results_11_8", envir = globalenv())
          labels <- c(
            vraag1  = "Multiple R (2 decimalen)",
            vraag2  = "R\u00b2 als % verklaarde variantie",
            vraag3  = "% NIET verklaarde variantie",
            vraag4  = "Aantal observaties N",
            vraag5  = "F-statistiek en modelsignificantie",
            vraag6  = "Intercept en betekenis",
            vraag7  = "b\u2081 WanordeIndex en interpretatie",
            vraag8  = "Sterkste relatieve effect en parameter",
            vraag9  = "Significante regressieparameter(s)",
            vraag10 = "Betekenis 95%-CI voor b\u2081",
            vraag11 = "Voorspelde AngstScore (W=7, Z=45)"
          )

          wrong_feedback <- function(likely, why_wrong, rule, next_step, correct) {
            paste0(
              "❌ **Waarschijnlijke redenering:** ", likely,
              "\n\n**Waarom dit niet klopt:** ", why_wrong,
              "\n\n**Denkregel:** ", rule,
              "\n\n**Volgende stap:** ", next_step,
              "\n\n**Correct antwoord:** ", correct
            )
          }

          correct_feedback <- function(why_right, rule, next_step) {
            paste0(
              "✅ **Bevestiging:** correct.\n\n**Waarom dit klopt:** ", why_right,
              "\n\n**Denkregel:** ", rule,
              "\n\n**Volgende stap:** ", next_step,
              "\n\n**Transferstap:** pas dezelfde regel toe op een nieuwe regressietabel en controleer grootheid, schaal en onzekerheid."
            )
          }

          feedbacks <- list(
            vraag1 = list(
              "1" = wrong_feedback(
                "Je hebt mogelijk R² = 0.4409 afgerond en dat als R gelezen.",
                "0.44 is de determinatiecoëfficiënt R², terwijl de vraag rechtstreeks naar Multiple R vraagt.",
                "Lees eerst het label van de statistiek: R en R² beantwoorden verschillende vragen.",
                "Markeer in de tabel de rij Multiple R en rond 0.6640 pas daarna af op twee decimalen.",
                "antwoord 2: 0.66."
              ),
              "2" = correct_feedback(
                "De tabel geeft Multiple R = 0.6640; afronden op twee decimalen levert 0.66.",
                "Neem bij een afleesvraag de gevraagde rij en rond uitsluitend op het gevraagde einde af.",
                "Controleer nu dat 0.66 tussen 0 en 1 ligt en niet met R² = 0.4409 is verwisseld."
              ),
              "3" = wrong_feedback(
                "Je hebt mogelijk een andere correlatiewaarde of een onnodige bewerking van 0.6640 gebruikt.",
                "0.81 staat niet in de rij Multiple R en volgt niet uit het afronden van 0.6640.",
                "Bij rechtstreeks aflezen voer je geen wortel, kwadraat of percentagebewerking uit.",
                "Schrijf 0.6640 over en rond het derde decimaal af: 0.66.",
                "antwoord 2: 0.66."
              ),
              "4" = wrong_feedback(
                "Je hebt mogelijk de cijfers van 0.6640 onjuist afgekapt of omgewisseld.",
                "Afronden op twee decimalen behoudt 0.66; 0.61 is geen afronding van de tabelwaarde.",
                "Kijk voor twee decimalen naar het derde cijfer: bij 0.6640 blijft de tweede 6 staan.",
                "Zet een streep na 0.66 en gebruik het volgende cijfer 4 om de afronding te beslissen.",
                "antwoord 2: 0.66."
              )
            ),
            vraag2 = list(
              "1" = wrong_feedback(
                "Je hebt mogelijk Multiple R = 0.6640 als 66% verklaarde variantie geïnterpreteerd.",
                "Verklaarde variantie komt uit R², niet rechtstreeks uit R.",
                "Voor een percentage verklaarde variantie gebruik je R² × 100%.",
                "Neem 0.4409 uit de R²-rij en vermenigvuldig met 100.",
                "antwoord 4: ongeveer 44%."
              ),
              "2" = wrong_feedback(
                "Je hebt mogelijk een andere waarde gekwadrateerd of 0.81 als percentage overgenomen.",
                "De output geeft R² expliciet als 0.4409; dat is niet 81%.",
                "Als R² al in de tabel staat, gebruik die waarde en zet alleen om naar procenten.",
                "Bereken 0.4409 × 100% = 44.09% en rond passend af.",
                "antwoord 4: 44%."
              ),
              "3" = wrong_feedback(
                "Je hebt mogelijk 1 − R berekend: 1 − 0.664 is ongeveer 0.34.",
                "Dat complement heeft geen betekenis als verklaarde variantie; daarvoor is R² nodig.",
                "R² is verklaard; 1 − R² is onverklaard. Gebruik nooit 1 − R voor deze vraag.",
                "Lees R² = 0.4409 en zet dit om naar 44.09%.",
                "antwoord 4: 44%."
              ),
              "4" = correct_feedback(
                "R² = 0.4409 betekent dat het model 44.09%, afgerond 44%, van de variantie in AngstScore verklaart.",
                "Percentage verklaard = R² × 100%.",
                "Noteer daarnaast dat het resterende percentage met 1 − R² wordt berekend."
              )
            ),
            vraag3 = list(
              "1" = wrong_feedback(
                "Je hebt mogelijk het verklaarde percentage van 44% opnieuw gekozen.",
                "De vraag vraagt juist naar het complement: wat het model niet verklaart.",
                "Onverklaard aandeel = 1 − R², of in procenten 100% − verklaard percentage.",
                "Trek 44.09% af van 100% en rond het resultaat af.",
                "antwoord 3: ongeveer 56%."
              ),
              "2" = wrong_feedback(
                "Je hebt mogelijk 1 − R gebruikt en zo ongeveer 34% à 35% verkregen.",
                "Het complement moet van R² worden genomen, niet van R.",
                "Verklaard = R²; onverklaard = 1 − R².",
                "Bereken 1 − 0.4409 = 0.5591 en zet dit om naar procenten.",
                "antwoord 3: 56%."
              ),
              "3" = correct_feedback(
                "1 − 0.4409 = 0.5591, dus ongeveer 56% van de variantie blijft onverklaard.",
                "Verklaard en onverklaard tellen samen op tot 100%.",
                "Controleer je uitkomst door 44% + 56% = 100% te verifiëren."
              ),
              "4" = wrong_feedback(
                "Je hebt mogelijk R = 0.6640 als 66% onverklaarde variantie gelezen.",
                "R zelf is geen aandeel verklaarde of onverklaarde variantie.",
                "Gebruik voor variantiepercentages steeds R² en het complement 1 − R².",
                "Start bij R² = 0.4409 en bereken 100% − 44.09%.",
                "antwoord 3: 56%."
              )
            ),
            vraag4 = list(
              "1" = wrong_feedback(
                "Je hebt mogelijk het aantal predictors, twee, aangezien voor het aantal observaties.",
                "Predictors zijn variabelen; N telt de vijf buurtrijen in de dataset.",
                "N is het aantal analyseeenheden, niet het aantal onafhankelijke variabelen.",
                "Tel de genummerde buurten of lees N in de model-fit-tabel.",
                "antwoord 4: N = 5."
              ),
              "2" = wrong_feedback(
                "Je hebt mogelijk de twee predictors plus het intercept geteld en zo drie modelparameters gevonden.",
                "Het aantal geschatte parameters is niet hetzelfde als het aantal observaties.",
                "Tel voor N de datarijen; tel parameters alleen wanneer vrijheidsgraden worden gevraagd.",
                "Wijs elke buurt één observatie toe en tel de vijf rijen.",
                "antwoord 4: N = 5."
              ),
              "3" = wrong_feedback(
                "Je hebt mogelijk de totale vrijheidsgraden df = 4 als N gelezen.",
                "Bij een model met intercept geldt totale df = N − 1, dus df 4 impliceert N 5.",
                "Onderscheid steekproefomvang N van vrijheidsgraden; totaal-df is één lager.",
                "Tel één op bij totale df 4 of lees de vijf datarijen.",
                "antwoord 4: N = 5."
              ),
              "4" = correct_feedback(
                "De dataset bevat vijf buurten en de model-fit-tabel vermeldt N = 5.",
                "Elke rij of analyseeenheid telt als één observatie.",
                "Controleer consistentie: totale df moet N − 1 = 4 zijn, zoals in de ANOVA-tabel."
              )
            ),
            vraag5 = list(
              "1" = wrong_feedback(
                "Je hebt mogelijk F = 0.79 correct afgelezen, maar aangenomen dat elke vermelde F statistisch significant is.",
                "De bijbehorende p-waarde is .559 en dus groter dan α = .05; p < .001 wordt niet door de tabel ondersteund.",
                "Beslis over modelsignificantie met de p-waarde naast F: p < α betekent significant.",
                "Lees F en p uit dezelfde ANOVA-rij en vergelijk .559 expliciet met .05.",
                "antwoord 3: F = 0.79 en het model is niet significant."
              ),
              "2" = wrong_feedback(
                "Je hebt mogelijk b₁ = 13.55 uit de coëfficiëntentabel aangezien voor de F-statistiek.",
                "F = 0.788 staat in de ANOVA-tabel; 13.55 is een regressiecoëfficiënt met andere betekenis en schaal.",
                "Koppel statistieken aan hun tabel: F toetst het model, b beschrijft een predictoreffect.",
                "Markeer de kolom F in de ANOVA-tabel en lees daarna de p-waarde uit dezelfde rij.",
                "antwoord 3: F = 0.79, p = .559, niet significant."
              ),
              "3" = correct_feedback(
                "De ANOVA-tabel geeft F = 0.788, afgerond 0.79, met p = .559; omdat .559 > .05 is het model niet significant.",
                "Voor de overall toets geldt: verwerp H₀ alleen wanneer de p-waarde kleiner is dan α.",
                "Vermeld bij de interpretatie ook de grote onzekerheid: met N = 5 en twee predictors is residuele df slechts 2."
              ),
              "4" = wrong_feedback(
                "Je hebt mogelijk Multiple R = 0.66 als F gebruikt en 0.4409 verkeerd als p = .044 gelezen.",
                "F en p moeten rechtstreeks uit de ANOVA-tabel komen: F = 0.788 en p = .559.",
                "Verplaats geen decimalen en combineer geen waarden uit verschillende tabellen.",
                "Omcirkel in de regressierij eerst F = 0.788 en vervolgens p = .559; toets daarna p tegen .05.",
                "antwoord 3: niet significant."
              )
            ),
            vraag6 = list(
              "1" = wrong_feedback(
                "Je hebt mogelijk de eerste predictorcoëfficiënt b₁ = 13.55 voor het intercept aangezien.",
                "13.55 is de helling voor WanordeIndex; het intercept staat in de aparte rij Intercept en is −9.98.",
                "In Ŷ = a + b₁X₁ + b₂X₂ is a het intercept en zijn b₁ en b₂ hellingen.",
                "Label elke coëfficiëntenrij met a, b₁ of b₂ voordat je interpreteert.",
                "antwoord 3: −9.98 bij beide predictors gelijk aan 0."
              ),
              "2" = wrong_feedback(
                "Je hebt mogelijk b₂ = −0.37 geselecteerd omdat dit ook een negatieve coëfficiënt is.",
                "−0.37 hoort bij ZwerfvuilKlachten en beschrijft een verandering per eenheid, niet de startwaarde.",
                "Het intercept is de constante term; een predictorcoëfficiënt staat bij de naam van die predictor.",
                "Zoek de rij Intercept en voeg voor de betekenis X₁ = 0 en X₂ = 0 in.",
                "antwoord 3: −9.98."
              ),
              "3" = correct_feedback(
                "De rij Intercept geeft a = −9.9765, afgerond −9.98: de voorspelde AngstScore wanneer beide predictors 0 zijn.",
                "Het intercept is de modelwaarde bij X₁ = X₂ = 0, ook als die combinatie inhoudelijk weinig realistisch is.",
                "Controleer altijd of nul binnen het waargenomen bereik ligt voordat je het intercept inhoudelijk zwaar interpreteert."
              ),
              "4" = wrong_feedback(
                "Je hebt mogelijk een voorspelde of geobserveerde AngstScore aangezien voor de constante.",
                "68.43 is de voorspelling uit vraag 11, niet de coëfficiënt in de rij Intercept.",
                "Een intercept lees je uit de coëfficiëntentabel; een voorspelling bereken je voor specifieke X-waarden.",
                "Lees a = −9.9765 en controleer de betekenis door X₁ = X₂ = 0 in de vergelijking te zetten.",
                "antwoord 3: −9.98."
              )
            ),
            vraag7 = list(
              "1" = correct_feedback(
                "b₁ = 13.5528: bij één eenheid meer WanordeIndex stijgt de voorspelde AngstScore gemiddeld 13.55 punten, bij gelijke ZwerfvuilKlachten.",
                "Een ongestandaardiseerde b geeft de verandering in Y-eenheden per één X-eenheid, ceteris paribus.",
                "Noem bij elke meervoudige-regressiehelling expliciet de uitkomst, de eenheden en de gecontroleerde predictor."
              ),
              "2" = wrong_feedback(
                "Je hebt mogelijk de coëfficiënt −0.37 van ZwerfvuilKlachten aan WanordeIndex gekoppeld.",
                "−0.37 is b₂; voor WanordeIndex staat in de b-kolom 13.55, met een positieve richting.",
                "Lees een effect op het kruispunt van de juiste predictor-rij en de kolom ongestandaardiseerde b.",
                "Volg de rij WanordeIndex horizontaal naar b en formuleer daarna de ceteris-paribuszin.",
                "antwoord 1: b₁ = 13.55 en een gemiddelde stijging."
              ),
              "3" = wrong_feedback(
                "Je hebt mogelijk de gestandaardiseerde β₁ = 0.90 gekozen in plaats van de gevraagde ongestandaardiseerde b₁.",
                "β heeft standaarddeviatie-eenheden en is geen gewone correlatie; de vraag vraagt b in oorspronkelijke score-eenheden.",
                "Gebruik b voor interpretatie in oorspronkelijke eenheden en β voor relatieve vergelijking tussen predictors.",
                "Kies de b-kolom bij WanordeIndex en voeg de controle voor ZwerfvuilKlachten toe.",
                "antwoord 1: b₁ = 13.55."
              ),
              "4" = wrong_feedback(
                "Je hebt mogelijk het intercept −9.98 als b₁ gelezen omdat het de eerste modelterm is.",
                "Het intercept is de startwaarde; b₁ staat in de rij WanordeIndex en is 13.55.",
                "a en b₁ hebben verschillende rollen: a is Ŷ bij alle X = 0, b₁ is verandering in Ŷ per X₁-eenheid.",
                "Schrijf het model als Ŷ = −9.98 + 13.55X₁ − 0.37X₂ en wijs elke term toe.",
                "antwoord 1."
              )
            ),
            vraag8 = list(
              "1" = wrong_feedback(
                "Je hebt mogelijk een ongestandaardiseerde coëfficiënt gebruikt en de negatieve richting als sterk effect geïnterpreteerd.",
                "b₂ = −0.37 staat op de schaal van klachten en is niet geschikt voor een relatieve vergelijking met b₁.",
                "Vergelijk effectsterkte tussen predictors met absolute gestandaardiseerde coëfficiënten |β|.",
                "Leg |β₁| = 0.90 naast |β₂| = 0.33.",
                "antwoord 2: WanordeIndex op basis van β₁."
              ),
              "2" = correct_feedback(
                "|β₁| = 0.90 voor WanordeIndex is groter dan |β₂| = 0.33 voor ZwerfvuilKlachten.",
                "Gestandaardiseerde β's staan op dezelfde schaal; vergelijk voor sterkte de absolute waarden en gebruik het teken alleen voor richting.",
                "Rapporteer zowel sterkte als richting en wees door N = 5 voorzichtig met een inhoudelijke rangorde."
              ),
              "3" = wrong_feedback(
                "Je hebt mogelijk β correct als maat gekozen, maar de negatieve β₂ als sterker gezien door naar het teken te kijken.",
                "Het minteken geeft richting, niet grootte; 0.33 is in absolute waarde kleiner dan 0.90.",
                "Sterkte vergelijk je met |β|, richting met het plus- of minteken.",
                "Neem de absolute waarden: |0.90| versus |−0.33|.",
                "antwoord 2: WanordeIndex."
              ),
              "4" = wrong_feedback(
                "Je hebt mogelijk de juiste predictor gekozen omdat 13.55 numeriek groter is, maar daarvoor de ruwe b's vergeleken.",
                "Ongestandaardiseerde b's hangen af van verschillende meeteenheden en onderbouwen geen relatieve vergelijking.",
                "Gebruik β voor relatieve sterkte; b blijft geschikt voor verandering in oorspronkelijke eenheden.",
                "Vervang de vergelijking 13.55 versus −0.37 door |0.90| versus |−0.33|.",
                "antwoord 2."
              )
            ),
            vraag9 = list(
              "1" = wrong_feedback(
                "Je hebt mogelijk p = .418 bij WanordeIndex gelezen als kleiner dan .05, of de positieve b als bewijs van significantie gezien.",
                ".418 is groter dan .05; richting en grootte van b bepalen op zichzelf niet of de schatting significant is.",
                "Vergelijk voor elke parameter haar eigen p-waarde met α = .05.",
                "Schrijf de drie vergelijkingen op: .884 > .05, .418 > .05 en .748 > .05.",
                "antwoord 3: geen enkele parameter."
              ),
              "2" = wrong_feedback(
                "Je hebt mogelijk de p-waarde .748 van ZwerfvuilKlachten verkeerd met de .05-grens vergeleken.",
                ".748 is veel groter dan .05 en ondersteunt geen statistisch significant partieel effect.",
                "Een parameter is op 5%-niveau significant wanneer p < .05, niet wanneer p een groot getal is.",
                "Plaats .748 en .05 op een getallenlijn en controleer daarna ook de andere parameterrijen.",
                "antwoord 3: geen."
              ),
              "3" = correct_feedback(
                "Alle parameter-p-waarden zijn groter dan .05: intercept .884, WanordeIndex .418 en ZwerfvuilKlachten .748.",
                "Toets elke parameter afzonderlijk met haar p-waarde; een niet-significant overall model bevestigt niet automatisch elke afzonderlijke toets, maar hier wijzen beide analyses dezelfde kant op.",
                "Rapporteer voorzichtig dat er in deze zeer kleine steekproef onvoldoende bewijs is, niet dat de effecten zeker nul zijn."
              ),
              "4" = wrong_feedback(
                "Je hebt mogelijk grote of opvallende coëfficiënten aangezien voor statistisch significante parameters.",
                "Significantie hangt af van de verhouding tussen schatting en standaardfout; de p-waarden van intercept en WanordeIndex zijn .884 en .418.",
                "Gebruik de p-kolom of controleer of het 95%-interval nul bevat; kijk niet alleen naar de coëfficiënt.",
                "Markeer per gekozen parameter de p-waarde en vergelijk die expliciet met .05.",
                "antwoord 3: geen enkele parameter."
              )
            ),
            vraag10 = list(
              "1" = wrong_feedback(
                "Je hebt mogelijk alleen de positieve bovengrens 71.12 of de positieve puntschatting bekeken.",
                "De ondergrens is −44.02, zodat het interval ook nul en negatieve effecten bevat; positief is dus niet zeker.",
                "Beoordeel het volledige interval: volledig boven 0 is positief significant, nul erin is niet significant.",
                "Teken −44.02, 0 en 71.12 op een getallenlijn.",
                "antwoord 3: het interval bevat 0."
              ),
              "2" = wrong_feedback(
                "Je hebt mogelijk alleen de negatieve ondergrens −44.02 bekeken.",
                "De bovengrens is 71.12; het interval omvat ook nul en positieve waarden, dus een zeker negatief effect volgt niet.",
                "Gebruik beide grenzen en controleer of 0 ertussen ligt.",
                "Schrijf de ongelijkheid −44.02 < 0 < 71.12.",
                "antwoord 3: geen significant effect op 5%-niveau."
              ),
              "3" = correct_feedback(
                "Omdat −44.02 < 0 < 71.12 bevat het 95%-interval nul en is b₁ niet significant op het tweezijdige 5%-niveau.",
                "Een 95%-interval voor een regressiecoëfficiënt dat nul bevat correspondeert met p ≥ .05 bij de bijbehorende tweezijdige toets.",
                "Noem ook de brede onzekerheidsmarge en concludeer onvoldoende bewijs, niet dat b₁ bewezen nul is."
              ),
              "4" = wrong_feedback(
                "Je hebt mogelijk een betrouwbaarheidsinterval voor b₁ geïnterpreteerd als een garantie over individuele voorspellingen.",
                "Dit interval beschrijft onzekerheid rond één regressiecoëfficiënt, niet de voorspellingsfout van het model.",
                "Koppel het soort interval aan het doel: coëfficiënteninterval voor effect, predictie-interval voor een nieuwe uitkomst.",
                "Controleer eerst of nul in het b₁-interval ligt; beoordeel voorspellingen met een apart predictie-interval.",
                "antwoord 3."
              )
            ),
            vraag11 = list(
              "1" = wrong_feedback(
                "Je hebt mogelijk de geobserveerde AngstScore 76.59 van buurt 4 gekozen omdat die dicht bij de opgegeven predictorwaarden lijkt.",
                "De vraag vraagt een modelvoorspelling voor W = 7 en Z = 45, niet het kopiëren van een bestaande Y-waarde.",
                "Een voorspelling volgt uit Ŷ = a + b₁W + b₂Z met alle opgegeven waarden ingevuld.",
                "Vul −9.9765 + 13.5528 × 7 − 0.3658 × 45 in en reken term voor term.",
                "antwoord 4: 68.43."
              ),
              "2" = wrong_feedback(
                "Je hebt mogelijk niet alle drie modeltermen gebruikt of bij de optelling een teken- of rekenfout gemaakt.",
                "De voorspelling vereist het intercept én beide predictorbijdragen; met de outputcoëfficiënten volgt 68.4321, niet 62.44.",
                "Behoud de tekens uit het model en rond pas af nadat alle termen zijn opgeteld.",
                "Bereken afzonderlijk −9.9765, 13.5528 × 7 en −0.3658 × 45 en tel ze daarna op.",
                "antwoord 4: 68.43."
              ),
              "3" = wrong_feedback(
                "Je hebt mogelijk een predictorbijdrage weggelaten of een tussentijdse afronding gebruikt.",
                "56.20 volgt niet uit de volledige vergelijking met beide predictors en het intercept.",
                "Bij meervoudige regressie moeten alle modeltermen worden ingevuld, ook wanneer één coëfficiënt klein is.",
                "Schrijf drie tussenresultaten op en controleer dat de negatieve bijdrage van klachten ongeveer −16.46 is.",
                "antwoord 4: 68.43."
              ),
              "4" = correct_feedback(
                "Ŷ = −9.9765 + 13.5528 × 7 − 0.3658 × 45 = 68.4321, afgerond 68.43.",
                "Voorspel met het volledige model, behoud elk coëfficiëntteken en rond alleen het eindresultaat af.",
                "Controleer de berekening door de drie bijdragen −9.98, +94.87 en −16.46 afzonderlijk te sommeren."
              )
            )
          )

          lines <- character(0)
          score <- 0
          total <- length(res)

          for (q in names(res)) {
            r <- res[[q]]
            fb <- feedbacks[[q]]
            if (isTRUE(r$ok)) {
              selected <- as.character(r$expected)
              lines <- c(lines, paste0("### ", labels[[q]], "\n\n", fb[[selected]]))
              score <- score + 1
            } else if (identical(r$reason, "missing")) {
              lines <- c(lines, paste0("### ", labels[[q]], "\n\nGeen antwoord gevonden.\n\n**Denkregel:** Elke vraag heeft een afzonderlijke variabele met één keuze van 1 tot en met 4 nodig.\n\n**Volgende stap:** Voeg ", q, " toe en wijs er het nummer van je keuze aan toe."))
            } else if (identical(r$reason, "invalid")) {
              lines <- c(lines, paste0("### ", labels[[q]], "\n\nOngeldige keuze: ", as.character(r$val), ".\n\n**Controleer je invoer:** de invoer is niet eenduidig aan één van de vier aangeboden antwoordopties te koppelen.\n\n**Waarom dit niet klopt:** alleen opties 1, 2, 3 of 4 (ook A, B, C of D) kunnen inhoudelijk worden beoordeeld.\n\n**Denkregel:** Kies exact één aangeboden antwoordoptie.\n\n**Volgende stap:** Voer voor ", q, " één geldig nummer in."))
            } else {
              selected <- as.character(as.integer(r$choice))
              lines <- c(lines, paste0("### ", labels[[q]], " — gekozen optie ", selected, "\n\n", fb[[selected]]))
            }
          }

          lines <- c(lines, paste0("\n**Score: ", score, " / ", total, "**"))
          get_reporter()$add_message(paste(lines, collapse = "\n\n---\n\n"), type = "markdown")

          generated == expected
        }
      )
    }
  )
})

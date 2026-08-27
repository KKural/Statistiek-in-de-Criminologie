context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) {
          check_value <- function(varname, expected, tolerance = 0.005) {
            if (!exists(varname, envir = env, inherits = FALSE)) {
              return(list(
                exists = FALSE,
                raw = NA,
                value = NA_real_,
                correct = FALSE,
                expected = expected
              ))
            }

            raw <- get(varname, envir = env, inherits = FALSE)
            value <- suppressWarnings(as.numeric(raw))
            valid <- length(value) == 1L && !is.na(value) && is.finite(value)

            list(
              exists = TRUE,
              raw = raw,
              value = if (valid) value else NA_real_,
              correct = valid && abs(value - expected) <= tolerance,
              expected = expected
            )
          }

          results <- list(
            kans_inbraak_of_geweld = check_value("kans_inbraak_of_geweld", 0.64),
            kans_geen_van_beide = check_value("kans_geen_van_beide", 0.36)
          )

          assign("detailed_results_4_4", results, envir = globalenv())
          all(vapply(results, function(result) isTRUE(result$correct), logical(1)))
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("detailed_results_4_4", envir = globalenv())
          near <- function(value, target, tolerance = 0.005) {
            !is.na(value) && abs(value - target) <= tolerance
          }
          show_value <- function(result) {
            if (!result$exists) return("ontbreekt")
            paste(as.character(result$raw), collapse = ", ")
          }

          diagnose_union <- function(result) {
            if (!result$exists) {
              return(list(
                reason = "het eerste antwoord ontbreekt; de berekening van de unie is daardoor niet beoordeelbaar.",
                why = "zonder een waarde voor P(A ∪ B) kan de somregel niet worden gecontroleerd.",
                next_step = "vul eerst P(A)+P(B) in bij `kans_inbraak_of_geweld`."
              ))
            }
            value <- result$value
            if (is.na(value)) {
              return(list(
                reason = "het eerste antwoord is mogelijk als tekst, formule of meerdere waarden ingevoerd in plaats van als één getal.",
                why = "de gevraagde proportie moet als één numerieke waarde kunnen worden geïnterpreteerd.",
                next_step = "voer bij `kans_inbraak_of_geweld` één decimaal getal zonder procentteken in."
              ))
            }
            if (near(value, 64, 0.05)) {
              return(list(
                reason = "de waarde 64 kan passen bij een correcte omzetting naar procent, terwijl de vraag om een proportie vroeg.",
                why = "64% moet in de gevraagde schaal worden ingevoerd als 0.64; de factor 100 verandert de antwoordeenheid.",
                next_step = "deel het percentage door 100 en noteer de uitkomst als proportie."
              ))
            }
            if (near(value, 0.0943, 0.001)) {
              return(list(
                reason = "de waarde ligt bij 0.23×0.41 en kan dus passen bij het toepassen van een productregel.",
                why = "vermenigvuldigen richt zich op een doorsnede onder passende aannames, terwijl hier de unie van twee disjuncte categorieën wordt gevraagd.",
                next_step = "vervang het product door de speciale somregel P(A ∪ B)=P(A)+P(B)."
              ))
            }
            if (near(value, 0.18)) {
              return(list(
                reason = "de waarde 0.18 kan passen bij het aftrekken van de twee gegeven kansen.",
                why = "een verschil vergelijkt de categorieën, maar telt niet alle incidenten in A of B samen.",
                next_step = "tel 0.23 en 0.41 op omdat de primaire categorieën disjunct zijn."
              ))
            }
            if (near(value, 0.23) || near(value, 0.41)) {
              return(list(
                reason = "het eerste antwoord komt overeen met één van de twee afzonderlijke categorieën; mogelijk is slechts één gebeurtenis meegeteld.",
                why = "de unie bevat zowel alle woninginbraken als alle geweldsmisdrijven.",
                next_step = "combineer beide kansen met de speciale somregel."
              ))
            }
            if (near(value, 0.36)) {
              return(list(
                reason = "het eerste antwoord komt overeen met het complement en kan passen bij het verwisselen van de twee gevraagde velden.",
                why = "0.36 beschrijft geen van beide categorieën, niet de unie van woninginbraak en geweldsmisdrijf.",
                next_step = "plaats eerst de som van de twee categorieën in het eerste veld en bereken daarna pas het complement."
              ))
            }
            if (value < 0 || value > 1) {
              return(list(
                reason = "de ingevoerde waarde valt buiten het interval voor proporties; mogelijk zijn schaal of rekenbewerking verwisseld.",
                why = "een kans als proportie moet tussen 0 en 1 liggen.",
                next_step = "controleer de antwoordeenheid en herbereken de unie met 0.23+0.41."
              ))
            }
            list(
              reason = "de afwijkende waarde kan passen bij een rekenfout of een andere interpretatie van 'of'; het eindgetal alleen laat geen eenduidiger conclusie toe.",
              why = "voor twee disjuncte primaire categorieën is de overlap nul en moeten de twee gegeven kansen rechtstreeks worden opgeteld.",
              next_step = "schrijf P(A ∪ B)=0.23+0.41 uit en rond het eindresultaat af op twee decimalen."
            )
          }

          diagnose_complement <- function(result) {
            if (!result$exists) {
              return(list(
                reason = "het tweede antwoord ontbreekt; de complementstap is daardoor niet beoordeelbaar.",
                why = "zonder een waarde voor geen van beide kan niet worden gecontroleerd of de totale kans 1 is gebruikt.",
                next_step = "vul `kans_geen_van_beide` in met 1 min de berekende unie."
              ))
            }
            value <- result$value
            if (is.na(value)) {
              return(list(
                reason = "het tweede antwoord is mogelijk als tekst, formule of meerdere waarden ingevoerd in plaats van als één getal.",
                why = "de gevraagde complementkans moet als één numerieke proportie kunnen worden geïnterpreteerd.",
                next_step = "voer bij `kans_geen_van_beide` één decimaal getal zonder procentteken in."
              ))
            }
            if (near(value, 36, 0.05)) {
              return(list(
                reason = "de waarde 36 kan passen bij een correcte complementkans in procentvorm, terwijl een proportie werd gevraagd.",
                why = "36% moet in de gevraagde schaal als 0.36 worden ingevoerd.",
                next_step = "deel het percentage door 100 en noteer de proportie met twee decimalen."
              ))
            }
            if (near(value, 0.64)) {
              return(list(
                reason = "de uniewaarde lijkt in het tweede veld te zijn herhaald; mogelijk is de complementstap overgeslagen.",
                why = "geen van beide is het complement van A ∪ B en moet samen met de unie optellen tot 1.",
                next_step = "bereken 1−P(A ∪ B) voor het tweede veld."
              ))
            }
            if (near(value, 0.77) || near(value, 0.59)) {
              return(list(
                reason = "de waarde kan passen bij het complement van slechts één categorie: 1−0.23 of 1−0.41.",
                why = "'geen van beide' sluit beide delictcategorieën tegelijk uit en vereist daarom het complement van hun unie.",
                next_step = "tel eerst de twee disjuncte kansen op en trek die volledige som daarna af van 1."
              ))
            }
            if (near(value, 0.9057, 0.001)) {
              return(list(
                reason = "de waarde ligt bij 1−(0.23×0.41) en kan passen bij een product vóór de complementstap.",
                why = "de gevraagde basis voor het complement is de unie; voor disjuncte categorieën wordt die met optellen berekend.",
                next_step = "gebruik 1−(0.23+0.41), niet 1−(0.23×0.41)."
              ))
            }
            if (value < 0 || value > 1) {
              return(list(
                reason = "de ingevoerde waarde valt buiten het interval voor proporties; mogelijk zijn schaal of volgorde van aftrekken verwisseld.",
                why = "ook een complementkans moet tussen 0 en 1 liggen.",
                next_step = "trek de unie van 1 af en controleer dat beide antwoorden samen 1 vormen."
              ))
            }
            list(
              reason = "de afwijkende waarde kan passen bij een rekenfout of een onvolledige complementstap; het eindgetal alleen laat geen eenduidiger conclusie toe.",
              why = "de gebeurtenissen 'A of B' en 'geen van beide' vullen samen de volledige uitkomstenruimte en hun kansen moeten dus optellen tot 1.",
              next_step = "gebruik het gecorrigeerde eerste antwoord in 1−P(A ∪ B) en rond pas daarna af."
            )
          }

          labels <- c(
            kans_inbraak_of_geweld = "1. P(woninginbraak of geweldsmisdrijf)",
            kans_geen_van_beide = "2. P(geen van beide)"
          )
          feedback <- c("**Resultaten per onderdeel:**")
          reasons <- character()
          explanations <- character()
          next_steps <- character()

          for (name in names(results)) {
            result <- results[[name]]
            mark <- if (isTRUE(result$correct)) "correct" else "niet correct"
            feedback <- c(
              feedback,
              paste0("- **", labels[[name]], "**: `", show_value(result), "` — ", mark)
            )

            if (!isTRUE(result$correct)) {
              diagnosis <- if (name == "kans_inbraak_of_geweld") {
                diagnose_union(result)
              } else {
                diagnose_complement(result)
              }
              reasons <- c(reasons, diagnosis$reason)
              explanations <- c(explanations, diagnosis$why)
              next_steps <- c(next_steps, diagnosis$next_step)
            }
          }

          read_more <- "<a href='https://openstax.org/books/introductory-statistics-2e/pages/3-3-two-basic-rules-of-probability' target='_blank' rel='noopener noreferrer'>Lees meer</a>"

          if (isTRUE(generated == expected)) {
            feedback <- c(
              feedback,
              "**Bevestiging:** beide kansen zijn correct: P(A ∪ B)=0.64 en P((A ∪ B)^c)=0.36; samen vormen ze de volledige kans 1.",
              "**Denkregel:** bepaal eerst of overlap mogelijk is, bereken daarna de unie en gebruik pas vervolgens de complementregel 1−P(A ∪ B).",
              "**Transferstap:** pas dezelfde twee stappen toe als twee andere, wederzijds uitsluitende primaire delictcategorieën kansen 0.17 en 0.28 hebben.",
              read_more
            )
          } else {
            invalid_input <- any(vapply(
              results,
              function(result) !isTRUE(result$exists) || is.na(result$value),
              logical(1)
            ))
            route_heading <- if (invalid_input) {
              paste0("**Controleer je invoer:** ", paste(unique(reasons), collapse = " "))
            } else {
              paste0("**Waarschijnlijke redenering:** ", paste(unique(reasons), collapse = " "))
            }
            feedback <- c(
              feedback,
              route_heading,
              paste0("**Waarom dit niet klopt:** ", paste(unique(explanations), collapse = " ")),
              "**Denkregel:** omdat de primaire categorieën disjunct zijn, geldt P(A ∪ B)=P(A)+P(B); 'geen van beide' is daarna het complement 1−P(A ∪ B). Controleer bovendien dat elke proportie tussen 0 en 1 ligt en dat beide eindantwoorden samen 1 zijn.",
              paste0("**Volgende stap:** ", paste(unique(next_steps), collapse = " ")),
              read_more
            )
          }

          get_reporter()$add_message(paste(feedback, collapse = "\n\n"), type = "markdown")
          generated == expected
        }
      )
    }
  )
})

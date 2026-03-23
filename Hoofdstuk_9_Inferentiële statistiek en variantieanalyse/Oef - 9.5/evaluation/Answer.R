context({
  testcase(
    "Controlevragen - Inferentiële statistiek en ANOVA",
    {
      testEqual(
        "",
        function(env) {
          results <- list()

          exp_answers <- list(
            vraag1 = 2,  # gemiddelde verschilt tussen 2+ groepen
            vraag2 = 4,  # F-waarde
            vraag3 = 2,  # F > 1
            vraag4 = 3,  # p-waarde kleiner
            vraag5 = 1,  # model verklaart meer dan nulmodel
            vraag6 = 3,  # model verklaart significant meer
            vraag7 = 2   # t-toets voor individuele coeff
          )

          parse_num <- function(val) {
            if (is.character(val)) {
              val <- trimws(val)
              if (grepl("^[A-Da-d]$", val)) {
                return(match(toupper(val), c("A", "B", "C", "D")))
              }
              val <- gsub(",", ".", val, fixed = TRUE)
            }
            suppressWarnings(as.numeric(val))
          }

          check_mc <- function(varname, expected) {
            if (!exists(varname, envir = env)) {
              return(list(exists = FALSE, value = NA, correct = FALSE, expected = expected))
            }
            raw <- get(varname, envir = env)
            num <- parse_num(raw)
            ok  <- !is.na(num) && abs(num - expected) < 0.5
            list(exists = TRUE, value = raw, value_num = num, correct = ok, expected = expected)
          }

          for (q in names(exp_answers)) {
            results[[q]] <- check_mc(q, exp_answers[[q]])
          }

          assign("detailed_results", results, envir = globalenv())
          all(sapply(results, function(x) x$correct))
        },
        TRUE,
        comparator = function(generated, expected, ...) {
          results <- get("detailed_results", envir = globalenv())

          parse_num <- function(val) {
            if (is.character(val)) { val <- trimws(val); val <- gsub(",", ".", val, fixed=TRUE)
              if (grepl("^[A-Da-d]$", val)) return(match(toupper(val), c("A","B","C","D"))) }
            suppressWarnings(as.numeric(val))
          }

          # ── wrong_msg helpers ──────────────────────────────────────────────────

          wrong_msg_vraag1 <- function(val) {
            v <- parse_num(val)
            if (!is.na(v) && v == 1)
              return("**Optie 1 is onjuist.** Dat alle groepsgemiddelden *gelijk* zijn is juist de **nulhypothese H₀**, niet de alternatieve. ANOVA test of H₀ verworpen kan worden.\n\n**Correct (2):** H₀: μ₁=μ₂=μ₃; Hₐ: minstens één gemiddelde verschilt.")
            if (!is.na(v) && v == 3)
              return("**Optie 3 is onjuist.** Gelijke varianties testen is de **Levene-toets** (assumptie voor ANOVA), niet de ANOVA-hypothese zelf.\n\n**Correct (2):** ANOVA test gemiddelden, niet varianties.")
            if (!is.na(v) && v == 4)
              return("**Optie 4 is onjuist.** ANOVA toetst of **minstens één** gemiddelde verschilt, niet of **alle** gemiddelden van elkaar verschillen.\n\n**Correct (2):** Hₐ zegt: ∃ i,j: μᵢ ≠ μⱼ.")
            "**Correct antwoord: 2** — H₀: alle groepsgemiddelden zijn gelijk (μ₁=μ₂=...=μₖ); Hₐ: minstens één gemiddelde verschilt."
          }

          wrong_msg_vraag2 <- function(val) {
            v <- parse_num(val)
            if (!is.na(v) && v == 1)
              return("**Optie 1 is onjuist.** De t-waarde hoort bij de t-toets (twee groepen / individuele coëfficiënten bij regressie), niet bij ANOVA.\n\n**Correct (4):** De **F-waarde** is de toetsingsgrootheid bij ANOVA.")
            if (!is.na(v) && v == 2)
              return("**Optie 2 is onjuist.** De z-waarde hoort bij de z-toets (grote steekproef, bekende σ).\n\n**Correct (4):** De **F-waarde** = MS_between / MS_within bij ANOVA.")
            if (!is.na(v) && v == 3)
              return("**Optie 3 is onjuist.** De chi-kwadraatwaarde hoort bij nominale variabelen en toetsen van onafhankelijkheid.\n\n**Correct (4):** Bij ANOVA gebruik je de **F-statistiek**.")
            "**Correct antwoord: 4** — De F-waarde (F = MS_between / MS_within) is de toetsingsgrootheid bij ANOVA."
          }

          wrong_msg_vraag3 <- function(val) {
            v <- parse_num(val)
            if (!is.na(v) && v == 1)
              return("**Optie 1 is onjuist.** F=1 betekent dat between- en within-variantie même groot zijn — er is dan geen bewijs voor een groepseffect.\n\n**Correct (2):** F > 1 betekent dat de tussengroepsvariantie **groter** is dan de binnengroepsvariantie.")
            if (!is.na(v) && v == 3)
              return("**Optie 3 is onjuist.** F < 1 zou betekenen dat de binnengroepsvariantie groter is — dat wijst eerder op *geen* groepseffect.\n\n**Correct (2):** F > 1 → tussengroepsvariantie > binnengroepsvariantie.")
            if (!is.na(v) && v == 4)
              return("**Optie 4 is onjuist.** F=0 is praktisch onmogelijk (zou betekenen dat alle groepsgemiddelden exact gelijk zijn én er is geen toevalsruis).\n\n**Correct (2):** F > 1 → significant groepseffect mogelijk.")
            "**Correct antwoord: 2** — F > 1 betekent dat de tussengroepsvariantie (MS_between) groter is dan de binnengroepsvariantie (MS_within), wat wijst op een groepseffect."
          }

          wrong_msg_vraag4 <- function(val) {
            v <- parse_num(val)
            if (!is.na(v) && v == 1)
              return("**Optie 1 is onjuist.** Naarmate F groter is, wordt de p-waarde **kleiner** (niet groter) — een grote F-waarde levert sterk bewijs tegen H₀.\n\n**Correct (3):** Grotere F → kleinere p.")
            if (!is.na(v) && v == 2)
              return("**Optie 2 is onjuist.** De p-waarde blijft niet gelijk als F verandert — p is een functie van F.\n\n**Correct (3):** Grotere F → kleinere p-waarde.")
            if (!is.na(v) && v == 4)
              return("**Optie 4 is onjuist.** Er is geen reden waarom p onbepaalbaar zou worden bij een grote F.\n\n**Correct (3):** Grotere F → kleinere p.")
            "**Correct antwoord: 3** — Hoe groter de F-waarde, hoe kleiner de p-waarde. Een grote F levert sterk bewijs tegen H₀."
          }

          wrong_msg_vraag5 <- function(val) {
            v <- parse_num(val)
            if (!is.na(v) && v == 2)
              return("**Optie 2 is onjuist.** De F-toets test het *gehele* regressiemodel, niet individuele coëfficiënten. Voor individuele coëfficiënten gebruik je de t-toets.\n\n**Correct (1):** F-toets = test of model als geheel significant is ten opzichte van het nulmodel.")
            if (!is.na(v) && v == 3)
              return("**Optie 3 is onjuist.** De F-toets vergelijkt het *model* met het nulmodel (interceptmodel), niet twee afzonderlijke variabelen.\n\n**Correct (1):** F = variantie verklaard door het model / variantie van residuen.")
            if (!is.na(v) && v == 4)
              return("**Optie 4 is onjuist.** De F-toets geeft geen schatting van de richting van effecten — daarvoor kijk je naar de regressiecoëfficiënten.\n\n**Correct (1):** F-toets test of R² significant groter is dan 0.")
            "**Correct antwoord: 1** — De F-toets bij regressie test of het model als geheel significant meer variantie verklaart dan het nulmodel (enkel het intercept)."
          }

          wrong_msg_vraag6 <- function(val) {
            v <- parse_num(val)
            if (!is.na(v) && v == 1)
              return("**Optie 1 is onjuist.** p<0.05 bij F betekent dat het *model* significant is, niet noodzakelijk de individuele coëfficiënten.\n\n**Correct (3):** Het model verklaart significant meer variantie dan het nulmodel.")
            if (!is.na(v) && v == 2)
              return("**Optie 2 is onjuist.** p<0.05 bij F toont niet aan dat alle predictoren significant zijn — dat vereist t-toetsen per coëfficiënt.\n\n**Correct (3):** p<0.05 bij F-toets → het complete model is significant.")
            if (!is.na(v) && v == 4)
              return("**Optie 4 is onjuist.** De steekproefgrootte is niet wat de F-toets test.\n\n**Correct (3):** p<0.05 bij F-toets = het regressiemodel verklaart significant meer dan het nulmodel.")
            "**Correct antwoord: 3** — p<0.05 bij de F-toets betekent dat het regressiemodel als geheel significant meer variantie verklaart dan het nulmodel."
          }

          wrong_msg_vraag7 <- function(val) {
            v <- parse_num(val)
            if (!is.na(v) && v == 1)
              return("**Optie 1 is onjuist.** De F-toets is al de toets voor het gehele model. Voor *individuele* coëfficiënten gebruik je een andere toets.\n\n**Correct (2):** De t-toets test of een individuele regressiecoëfficiënt significant van 0 verschilt.")
            if (!is.na(v) && v == 3)
              return("**Optie 3 is onjuist.** De chi-kwadraattoets test onafhankelijkheid van nominale variabelen, niet regressiecoëfficiënten.\n\n**Correct (2):** t-toets voor B₁, B₂, ... elk afzonderlijk.")
            if (!is.na(v) && v == 4)
              return("**Optie 4 is onjuist.** De z-toets wordt zelden gebruikt bij regressie.\n\n**Correct (2):** t-toets voor individuele regressiecoëfficiënten.")
            "**Correct antwoord: 2** — De t-toets wordt gebruikt om individuele regressiecoëfficiënten te toetsen (H₀: Bⱼ = 0)."
          }

          # ── labels + functies ──────────────────────────────────────────────────

          qnames <- c(
            vraag1 = "Vraag 1: Hypothesen bij ANOVA",
            vraag2 = "Vraag 2: Toetsingsgrootheid ANOVA",
            vraag3 = "Vraag 3: F-waarde en tussengroepsvariantie",
            vraag4 = "Vraag 4: p-waarde naarmate F groter is",
            vraag5 = "Vraag 5: Doel F-toets bij regressie",
            vraag6 = "Vraag 6: Betekenis p<0.05 bij F-toets regressie",
            vraag7 = "Vraag 7: Andere toets bij regressie"
          )

          wrong_fns <- list(
            vraag1 = wrong_msg_vraag1,
            vraag2 = wrong_msg_vraag2,
            vraag3 = wrong_msg_vraag3,
            vraag4 = wrong_msg_vraag4,
            vraag5 = wrong_msg_vraag5,
            vraag6 = wrong_msg_vraag6,
            vraag7 = wrong_msg_vraag7
          )

          correct_msgs <- list(
            vraag1 = "H₀: alle groepsgemiddelden gelijk; Hₐ: minstens één verschilt ✓",
            vraag2 = "F-waarde (= MS_between / MS_within) ✓",
            vraag3 = "F > 1 → tussengroepsvariantie > binnengroepsvariantie ✓",
            vraag4 = "Grotere F → kleinere p ✓",
            vraag5 = "F-toets test of het model significant meer verklaart dan het nulmodel ✓",
            vraag6 = "Model verklaart significant meer variantie dan nulmodel ✓",
            vraag7 = "t-toets voor individuele regressiecoëfficiënten ✓"
          )

          # ── feedback opbouwen ─────────────────────────────────────────────────

          lines <- character(0)
          score <- 0
          total <- length(qnames)

          for (key in names(qnames)) {
            r   <- results[[key]]
            lbl <- qnames[[key]]
            if (!r$exists) {
              lines <- c(lines, paste0("❌ **", lbl, "** — variabele `", key, "` niet ingevuld.\n\n",
                wrong_fns[[key]]("?"), "\n"))
            } else if (r$correct) {
              lines <- c(lines, paste0("✅ **", lbl, "** (antwoord ", as.integer(r$expected),
                "): correct — ", correct_msgs[[key]], "\n"))
              score <- score + 1
            } else {
              lines <- c(lines, paste0("❌ **", lbl, "** — jouw antwoord: **", as.character(r$value),
                "**\n\n", wrong_fns[[key]](r$value), "\n"))
            }
          }

          lines <- c(lines, sprintf("---\n\n**Score: %d / %d**", score, total))
          get_reporter()$add_message(paste(lines, collapse = "\n"), type = "markdown")
          generated == expected
        }
      )
    }
  )
})
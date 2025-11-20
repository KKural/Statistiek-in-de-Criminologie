# R Evaluation Script voor Onderzoeksvraag Classificatie
# Verwachte antwoorden (case insensitive)
expected_answers <- list(
  type_vraag = "univariate beschrijvende",
  bestudeerde_variabele = c("het aantal gerapporteerde inbraken per maand in belgische steden", 
                           "aantal inbraken per maand", 
                           "inbraken per maand",
                           "aantal gerapporteerde inbraken per maand"),
  meetniveau = "ratio",
  waarden = c("natuurlijke getallen", "0, 1, 2, ...", "gehele getallen", "getallen", "0 of meer")
)

# Variabele display names
variable_names <- list(
  type_vraag = "Type onderzoeksvraag",
  bestudeerde_variabele = "Bestudeerde variabele",
  meetniveau = "Meetniveau", 
  waarden = "Mogelijke waarden"
)

get_specific_feedback <- function(var_key, student_answer, var_display) {
  if (var_key == "type_vraag") {
    if (student_answer == "bivariate beschrijvende") {
      return(paste("•", var_display, ": Je koos 'bivariate beschrijvende', maar dit is fout. Deze vraag gaat over slechts één variabele (aantal inbraken). Er wordt geen relatie tussen twee variabelen onderzocht → **univariate beschrijvende**"))
    } else if (student_answer == "bivariate verklarende") {
      return(paste("•", var_display, ": Je koos 'bivariate verklarende', maar dit is fout. Deze vraag zoekt geen oorzakelijk verband tussen variabelen. Het gaat om het beschrijven van één variabele → **univariate beschrijvende**"))
    } else {
      return(paste("•", var_display, ": Deze vraag onderzoekt slechts één variabele (aantal inbraken per maand) zonder relatie met andere variabelen → **univariate beschrijvende**"))
    }
  } else if (var_key == "bestudeerde_variabele") {
    return(paste("•", var_display, ": De variabele die wordt bestudeerd is 'het aantal gerapporteerde inbraken per maand in Belgische steden'. Focus op wat er precies wordt geteld/gemeten."))
  } else if (var_key == "meetniveau") {
    if (student_answer == "nominaal") {
      return(paste("•", var_display, ": Je koos 'nominaal', maar dit is fout. Aantal inbraken zijn getallen waarmee je kunt rekenen, heeft een echt nulpunt (0 inbraken) en betekenisvolle verhoudingen → **ratio**"))
    } else if (student_answer == "ordinaal") {
      return(paste("•", var_display, ": Je koos 'ordinaal', maar dit is fout. Aantal inbraken heeft niet alleen rangorde maar ook gelijke afstanden en een echt nulpunt → **ratio**"))
    } else if (student_answer == "interval") {
      return(paste("•", var_display, ": Je koos 'interval', maar dit is fout. Aantal inbraken heeft wel een echt nulpunt: 0 inbraken betekent echt geen inbraken → **ratio**"))
    } else {
      return(paste("•", var_display, ": Aantal inbraken heeft gelijke afstanden, een echt nulpunt (0 = geen inbraken) en betekenisvolle verhoudingen → **ratio**"))
    }
  } else if (var_key == "waarden") {
    return(paste("•", var_display, ": De mogelijke waarden zijn natuurlijke getallen: 0, 1, 2, 3, ... (je kunt geen negatief aantal inbraken hebben)"))
  }
  return(paste("•", var_display, ": Controleer je antwoord en probeer opnieuw."))
}

# Check elk van de variabelen
results <- list()
all_correct <- TRUE

for (var_name in names(expected_answers)) {
  if (exists(var_name, envir = globalenv())) {
    student_answer <- tolower(trimws(get(var_name, envir = globalenv())))
    expected_options <- tolower(expected_answers[[var_name]])
    
    results[[var_name]] <- list(
      exists = TRUE,
      value = get(var_name, envir = globalenv()),
      correct = student_answer %in% expected_options,
      expected = expected_answers[[var_name]][1]
    )
    
    if (!results[[var_name]]$correct) {
      all_correct <- FALSE
    }
  } else {
    results[[var_name]] <- list(
      exists = FALSE,
      value = NULL,
      correct = FALSE,
      expected = expected_answers[[var_name]][1]
    )
    all_correct <- FALSE
  }
}

# Genereer gedetailleerde feedback
feedback_parts <- c("## **Resultaten per onderdeel:**", "")

counter <- 1
for (var_key in names(expected_answers)) {
  var_display <- variable_names[[var_key]]
  result <- results[[var_key]]
  
  if (!result$exists) {
    feedback_parts <- c(feedback_parts, paste(counter, ". **", var_display, "**: *Ontbreekt* ❌", sep = ""))
  } else if (result$correct) {
    feedback_parts <- c(feedback_parts, paste(counter, ". **", var_display, "**: ", result$value, " ✅", sep = ""))
  } else {
    feedback_parts <- c(feedback_parts, paste(counter, ". **", var_display, "**: ", result$value, " ❌", sep = ""))
  }
  counter <- counter + 1
}

if (all_correct) {
  feedback_parts <- c(feedback_parts, "", "✅ **Alle onderdelen correct geclassificeerd.**", "", "**Uitstekend!** Je begrijpt onderzoeksvraag classificatie goed.")
} else {
  # Voeg specifieke feedback toe voor foute antwoorden
  incorrect_vars <- names(results)[sapply(results, function(x) !x$correct)]
  if (length(incorrect_vars) > 0) {
    feedback_parts <- c(feedback_parts, "", "**📚 Uitleg waarom deze antwoorden fout zijn:**")
    
    for (var_key in incorrect_vars) {
      result <- results[[var_key]]
      var_display <- variable_names[[var_key]]
      
      if (!result$exists) {
        feedback_parts <- c(feedback_parts, paste("• **", var_display, "**: ❌ Variabele niet gevonden. Vergeet je de variabele te definiëren?", sep = ""))
      } else {
        student_answer <- tolower(result$value)
        feedback_parts <- c(feedback_parts, get_specific_feedback(var_key, student_answer, var_display))
      }
    }
  }
}

# Voeg altijd educatieve content toe
feedback_parts <- c(feedback_parts, "", "**Onderzoeksvraag types uitleg:**")
feedback_parts <- c(feedback_parts, "• **Univariate beschrijvende**: Beschrijft eigenschappen van één variabele")
feedback_parts <- c(feedback_parts, "• **Bivariate beschrijvende**: Beschrijft relatie tussen twee variabelen") 
feedback_parts <- c(feedback_parts, "• **Bivariate verklarende**: Onderzoekt of één variabele invloed heeft op een andere")

# Print de feedback als markdown
cat(paste(feedback_parts, collapse = "\n\n"))

# Return success/failure voor de judge
if (all_correct) {
  return(TRUE)
} else {
  return(FALSE)
}
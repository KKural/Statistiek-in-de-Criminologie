library(testthat)

# Define the testEqual function for validation
testEqual <- function(actual, expected, message) {
  if (is.character(expected)) {
    if (actual == expected) {
      cat("✓ CORRECT:", message, "\n")
    } else {
      cat("✗ INCORRECT:", message, "\n")
      cat("  Expected:", expected, "\n")
      cat("  Actual:", actual, "\n")
    }
  } else {
    if (abs(actual - expected) < 1e-4) {
      cat("✓ CORRECT:", message, "\n")
    } else {
      cat("✗ INCORRECT:", message, "\n")
      cat("  Expected:", expected, "\n")
      cat("  Actual:", actual, "\n")
    }
  }
}

cat("# VALIDATIE RESULTATEN OEFENING 3.3\n")
cat("===================================\n\n")

# STAP 1 - Frequenties en Percentages
cat("## STAP 1: FREQUENTIETABEL EN CENTRALITEIT\n\n")

cat("### Frequenties:\n")
testEqual(freq_24, 3, "Frequentie van 24 uren")
testEqual(freq_28, 2, "Frequentie van 28 uren")
testEqual(freq_32, 2, "Frequentie van 32 uren")
testEqual(freq_34, 1, "Frequentie van 34 uren")
testEqual(freq_35, 1, "Frequentie van 35 uren")
testEqual(freq_36, 7, "Frequentie van 36 uren")
testEqual(freq_38, 1, "Frequentie van 38 uren")
testEqual(freq_40, 3, "Frequentie van 40 uren")

cat("\n### Percentages:\n")
testEqual(percent_24, 15, "Percentage van 24 uren")
testEqual(percent_28, 10, "Percentage van 28 uren")
testEqual(percent_32, 10, "Percentage van 32 uren")
testEqual(percent_34, 5, "Percentage van 34 uren")
testEqual(percent_35, 5, "Percentage van 35 uren")
testEqual(percent_36, 35, "Percentage van 36 uren")
testEqual(percent_38, 5, "Percentage van 38 uren")
testEqual(percent_40, 15, "Percentage van 40 uren")

cat("\n### Centraliteitsmaten:\n")
testEqual(modus, 36, "Modus (meest voorkomende waarde)")
testEqual(mediaan, 36, "Mediaan (middelste waarde)")
testEqual(gemiddelde, 33.55, "Gemiddelde")

# STAP 2 - Spreidingsmaten
cat("\n## STAP 2: SPREIDINGSMATEN EN PARAMETER KEUZES\n\n")

cat("### Spreidingsmaten:\n")
testEqual(variatiebreedte, 16, "Variatiebreedte (range)")
testEqual(q1, 30, "Eerste kwartiel (Q1)")
testEqual(q3, 36, "Derde kwartiel (Q3)")
testEqual(ika, 6, "Interkwartielafstand (IKA)")

cat("\n### Parameter keuzes:\n")
testEqual(meest_relevante_centraliteit, "gemiddelde", "Meest relevante centraliteit")
testEqual(meest_relevante_spreiding, "interkwartielafstand", "Meest relevante spreiding")
testEqual(reden, "gebruikt alle informatie", "Reden voor keuze")

# STAP 3 - Geavanceerde spreidingsberekeningen
cat("\n## STAP 3: GEAVANCEERDE SPREIDINGSBEREKENINGEN\n\n")

cat("### Individual Afwijkingen:\n")
testEqual(afwijking_24_1, -9.55, "Afwijking 24_1")
testEqual(afwijking_36_1, 2.45, "Afwijking 36_1")
testEqual(afwijking_35, 1.45, "Afwijking 35")
testEqual(afwijking_28_1, -5.55, "Afwijking 28_1")
testEqual(afwijking_24_2, -9.55, "Afwijking 24_2")
testEqual(afwijking_28_2, -5.55, "Afwijking 28_2")
testEqual(afwijking_24_3, -9.55, "Afwijking 24_3")
testEqual(afwijking_36_2, 2.45, "Afwijking 36_2")
testEqual(afwijking_32_1, -1.55, "Afwijking 32_1")
testEqual(afwijking_36_3, 2.45, "Afwijking 36_3")
testEqual(afwijking_40_1, 6.45, "Afwijking 40_1")
testEqual(afwijking_38, 4.45, "Afwijking 38")
testEqual(afwijking_36_4, 2.45, "Afwijking 36_4")
testEqual(afwijking_34, 0.45, "Afwijking 34")
testEqual(afwijking_40_2, 6.45, "Afwijking 40_2")
testEqual(afwijking_36_5, 2.45, "Afwijking 36_5")
testEqual(afwijking_32_2, -1.55, "Afwijking 32_2")
testEqual(afwijking_36_6, 2.45, "Afwijking 36_6")
testEqual(afwijking_40_3, 6.45, "Afwijking 40_3")
testEqual(afwijking_36_7, 2.45, "Afwijking 36_7")

# Create vectors for internal validation
afwijkingen <- c(afwijking_24_1, afwijking_36_1, afwijking_35, afwijking_28_1, afwijking_24_2, 
                afwijking_28_2, afwijking_24_3, afwijking_36_2, afwijking_32_1, afwijking_36_3,
                afwijking_40_1, afwijking_38, afwijking_36_4, afwijking_34, afwijking_40_2,
                afwijking_36_5, afwijking_32_2, afwijking_36_6, afwijking_40_3, afwijking_36_7)

cat("\n### Individual Gekwadrateerde Afwijkingen:\n")
testEqual(gekw_afwijking_24_1, 91.2025, "Gekwadrateerde afwijking 24_1")
testEqual(gekw_afwijking_36_1, 6.0025, "Gekwadrateerde afwijking 36_1")
testEqual(gekw_afwijking_35, 2.1025, "Gekwadrateerde afwijking 35")
testEqual(gekw_afwijking_28_1, 30.8025, "Gekwadrateerde afwijking 28_1")
testEqual(gekw_afwijking_24_2, 91.2025, "Gekwadrateerde afwijking 24_2")
testEqual(gekw_afwijking_28_2, 30.8025, "Gekwadrateerde afwijking 28_2")
testEqual(gekw_afwijking_24_3, 91.2025, "Gekwadrateerde afwijking 24_3")
testEqual(gekw_afwijking_36_2, 6.0025, "Gekwadrateerde afwijking 36_2")
testEqual(gekw_afwijking_32_1, 2.4025, "Gekwadrateerde afwijking 32_1")
testEqual(gekw_afwijking_36_3, 6.0025, "Gekwadrateerde afwijking 36_3")
testEqual(gekw_afwijking_40_1, 41.6025, "Gekwadrateerde afwijking 40_1")
testEqual(gekw_afwijking_38, 19.8025, "Gekwadrateerde afwijking 38")
testEqual(gekw_afwijking_36_4, 6.0025, "Gekwadrateerde afwijking 36_4")
testEqual(gekw_afwijking_34, 0.2025, "Gekwadrateerde afwijking 34")
testEqual(gekw_afwijking_40_2, 41.6025, "Gekwadrateerde afwijking 40_2")
testEqual(gekw_afwijking_36_5, 6.0025, "Gekwadrateerde afwijking 36_5")
testEqual(gekw_afwijking_32_2, 2.4025, "Gekwadrateerde afwijking 32_2")
testEqual(gekw_afwijking_36_6, 6.0025, "Gekwadrateerde afwijking 36_6")
testEqual(gekw_afwijking_40_3, 41.6025, "Gekwadrateerde afwijking 40_3")
testEqual(gekw_afwijking_36_7, 6.0025, "Gekwadrateerde afwijking 36_7")

# Create vector for internal validation 
gekwadrateerde_afwijkingen <- c(gekw_afwijking_24_1, gekw_afwijking_36_1, gekw_afwijking_35, gekw_afwijking_28_1, gekw_afwijking_24_2,
                               gekw_afwijking_28_2, gekw_afwijking_24_3, gekw_afwijking_36_2, gekw_afwijking_32_1, gekw_afwijking_36_3,
                               gekw_afwijking_40_1, gekw_afwijking_38, gekw_afwijking_36_4, gekw_afwijking_34, gekw_afwijking_40_2,
                               gekw_afwijking_36_5, gekw_afwijking_32_2, gekw_afwijking_36_6, gekw_afwijking_40_3, gekw_afwijking_36_7)

cat("\n### Variantie en standaardafwijking:\n")
testEqual(sum_of_squares, 528.95, "Som van gekwadrateerde afwijkingen")
testEqual(variantie, 27.8295, "Variantie")
testEqual(standaardafwijking, 5.2763, "Standaardafwijking")
testEqual(variatiecoefficient, 0.1573, "Variatiecoëfficiënt")

cat("\n===================================\n")
cat("# VALIDATIE VOLTOOID\n")

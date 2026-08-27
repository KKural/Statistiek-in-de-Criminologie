# The former broad rounding cases were replaced when the long exercises changed.
source(file.path("tests", "verify_answer_bank_all.R"), chdir = FALSE)
source(file.path("tests", "verify_concept_focused_exercises.R"), chdir = FALSE)
cat("Chapters 9-13 canonical answers and redesigned focused routes passed.\n")

# Legacy Chapter 3 answer checks were coupled to the former long submissions.
# The replacement validates every canonical answer and the redesigned routes.
source(file.path("tests", "verify_answer_bank_all.R"), chdir = FALSE)
source(file.path("tests", "verify_concept_focused_exercises.R"), chdir = FALSE)
cat("Chapter 3 answer hygiene is covered by the canonical answer-bank and concept-focused validators.\n")

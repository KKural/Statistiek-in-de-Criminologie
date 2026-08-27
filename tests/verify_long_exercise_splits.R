# Compatibility entry point for the former split-exercise check. The sourced
# validator now checks the complete 59-exercise bank and the 35 multi-answer
# activities, each with one objective and three to five related answer fields.
source(file.path("tests", "verify_concept_focused_exercises.R"), chdir = FALSE)
cat("All logically grouped and formerly long exercises passed.\n")

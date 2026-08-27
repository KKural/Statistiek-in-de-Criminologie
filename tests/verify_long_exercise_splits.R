# Compatibility entry point for the former split-exercise check. The sourced
# validator now checks the complete 51-exercise bank and the 34 logically grouped
# activities, each with one objective and three to five related answer fields.
source(file.path("tests", "verify_concept_focused_exercises.R"), chdir = FALSE)
cat("All logically grouped and formerly long exercises passed.\n")

# Oefening 7.2 – Crimineel gedrag per geslacht
# -------------------------------------------
# Visualisatie van de kruistabel uit de oefening
# met absolute aantallen YES/NO per geslacht.

library(ggplot2)

get_script_dir <- function() {
  cmd <- commandArgs(trailingOnly = FALSE)
  file_arg <- grep("^--file=", cmd, value = TRUE)
  if (length(file_arg) > 0) {
    return(dirname(normalizePath(sub("^--file=", "", file_arg[1]))))
  }
  if (!is.null(sys.frames()[[1]]$ofile)) {
    return(dirname(normalizePath(sys.frames()[[1]]$ofile)))
  }
  getwd()
}

# Gegevens uit Tabel 1
# Crimineel gedrag per geslacht (absolute frequenties)

data <- data.frame(
  geslacht = factor(c("Man", "Man", "Vrouw", "Vrouw"),
                    levels = c("Man", "Vrouw")),
  gedrag   = factor(c("YES", "NO", "YES", "NO"),
                    levels = c("YES", "NO")),
  freq     = c(380, 850, 120, 650)
)

p <- ggplot(data, aes(x = geslacht, y = freq, fill = gedrag)) +
  geom_col(position = "stack", colour = "black", width = 0.6) +
  geom_text(aes(label = freq),
            position = position_stack(vjust = 0.5),
            colour = "white", size = 4) +
  scale_fill_manual(values = c("#e74c3c", "#3498db"),
                    name = "Crimineel gedrag",
                    labels = c("YES (wel misdrijf)", "NO (geen misdrijf)")) +
  labs(
    title = "Crimineel gedrag per geslacht",
    subtitle = "Absolute aantallen YES/NO in een steekproef van N = 2000",
    x = "Geslacht",
    y = "Frequentie"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold"),
    plot.subtitle = element_text(hjust = 0.5),
    legend.position = "top"
  )

print(p)

# PNG opslaan voor gebruik in Dodona (in dezelfde map als dit script)
out_file <- file.path(get_script_dir(), "crimineel_geslacht_kruistabel.png")
ggsave(out_file,
       plot = p, width = 8, height = 5, dpi = 300, bg = "white")

cat("Plot gegenereerd en opgeslagen als: ", out_file, "\n", sep = "")

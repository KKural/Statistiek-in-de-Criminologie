# Oef - 7.1.1 – Vuurwapenbezit en geslacht
# ----------------------------------------
# Visualisatie: percentages binnen geslacht (kolommen = 100%).

library(ggplot2)

# Absolute aantallen uit de kruistabel
data_counts <- data.frame(
  geslacht = factor(
    c("Man", "Man", "Vrouw", "Vrouw"),
    levels = c("Man", "Vrouw")
  ),
  bezit = factor(
    c("JA", "NEEN", "JA", "NEEN"),
    levels = c("JA", "NEEN")
  ),
  freq = c(343, 474, 260, 780)
)

# Percentages binnen geslacht
data_perc <- within(data_counts, {
  total_geslacht <- ave(freq, geslacht, FUN = sum)
  perc <- freq / total_geslacht * 100
})

p <- ggplot(data_perc, aes(x = geslacht, y = perc, fill = bezit)) +
  geom_col(position = "stack", colour = "black", width = 0.65) +
  geom_text(
    aes(label = sprintf("%.1f%%", perc)),
    position = position_stack(vjust = 0.5),
    colour = "white",
    size = 6
  ) +
  scale_fill_manual(
    values = c("JA" = "#e74c3c", "NEEN" = "#3498db"),
    name = "Vuurwapenbezit"
  ) +
  labs(
    title = "Vuurwapenbezit per geslacht",
    subtitle = "Percentages binnen geslacht (kolommen = 100%)",
    x = "Geslacht",
    y = "Percentage"
  ) +
  theme_minimal(base_size = 20) +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold"),
    plot.subtitle = element_text(hjust = 0.5),
    legend.position = "top"
  )

print(p)

# Save to the same folder as this script (works both in RStudio and Rscript)
args <- commandArgs(trailingOnly = FALSE)
file_arg <- grep("^--file=", args, value = TRUE)
script_path <- if (length(file_arg) > 0) sub("^--file=", "", file_arg[1]) else NA_character_
out_dir <- if (!is.na(script_path) && nzchar(script_path)) dirname(normalizePath(script_path)) else getwd()

ggsave(
  filename = file.path(out_dir, "vuurwapen_geslacht_percentages.png"),
  plot = p,
  width = 9,
  height = 5,
  dpi = 300,
  bg = "white"
)

cat("Plot opgeslagen als:", file.path(out_dir, "vuurwapen_geslacht_percentages.png"), "\n")


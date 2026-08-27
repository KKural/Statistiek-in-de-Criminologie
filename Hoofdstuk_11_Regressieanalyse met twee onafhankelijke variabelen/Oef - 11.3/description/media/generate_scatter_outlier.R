# generate_scatter_outlier.R
# Creates: scatter_outlier.png
# Used in: Oef - 8.3 (Hoofdstuk 8)
# Topic: Scatterplot of 6 labelled points + OLS regression line.
#        Students identify point B as having the largest absolute residual.
# Data:
#   A(3,33)  residu = -1.1
#   B(8,29)  residu = +4.8  <-- largest absolute residual (correct answer)
#   C(11,16) residu = -2.3
#   D(14,10) residu = -2.4
#   E(17,5)  residu = -1.5
#   F(20,3)  residu = +2.4
# Run from this directory: Rscript generate_scatter_outlier.R

library(ggplot2)

# ── Data ──────────────────────────────────────────────────────────────────────
df <- data.frame(
  label = c("A", "B", "C", "D", "E", "F"),
  x     = c(3,   8,  11,  14,  17,  20),
  y     = c(33,  29,  16,  10,   5,   3)
)

# OLS regression (same values used in Answer.R feedback)
fit  <- lm(y ~ x, data = df)
# At x=8: yhat ≈ 24.2 (B has residu +4.8, largest absolute)

line_df <- data.frame(x = c(0, 22))
line_df$y <- predict(fit, newdata = line_df)

# Residual segments (vertical lines from point to fitted line)
df$yhat   <- predict(fit)
df$residu <- df$y - df$yhat

# ── Plot ──────────────────────────────────────────────────────────────────────
p <- ggplot(df, aes(x = x, y = y)) +
  # Residual lines (grey dashed)
  geom_segment(aes(xend = x, yend = yhat),
               linetype = "dashed", colour = "grey60", linewidth = 0.6) +
  # Regression line
  geom_line(data = line_df, aes(x = x, y = y),
            colour = "#2166ac", linewidth = 1.1) +
  # All points (open circles — no highlighting to avoid revealing the answer)
  geom_point(size = 3.5, colour = "grey30", fill = "white", shape = 21,
             stroke = 1.2) +
  # Point labels (offset above right)
  geom_text(aes(label = label),
            nudge_x = 0.7, nudge_y = 1.2,
            size = 4.5, fontface = "bold", colour = "grey20") +
  # Axis labels
  labs(
    x       = "Politie-inzet (X)",
    y       = "Criminaliteitsgraad (Y)",
    title   = "Scatterplot: Politie-inzet vs Criminaliteitsgraad",
    subtitle = "OLS-regressielijn met residuen (gestippeld)"
  ) +
  scale_x_continuous(limits = c(0, 23), breaks = seq(0, 22, 2)) +
  scale_y_continuous(limits = c(0, 38), breaks = seq(0, 35, 5)) +
  theme_classic(base_size = 12) +
  theme(
    plot.title    = element_text(face = "bold", size = 13),
    plot.subtitle = element_text(size = 9.5, colour = "grey40"),
    axis.title    = element_text(face = "bold")
  )

# ── Save ──────────────────────────────────────────────────────────────────────
ggsave("scatter_outlier.png", plot = p,
       width = 7, height = 5, dpi = 150, bg = "white")
cat("Saved: scatter_outlier.png\n")
cat(sprintf("Residuals: %s\n",
    paste(sprintf("%s=%.1f", df$label, df$residu), collapse = ", ")))

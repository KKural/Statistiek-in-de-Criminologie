# generate_punt_P_lijn.R
# Creates: punt_P_lijn.png
# Used in: Oef - 8.4 (Hoofdstuk 8)
# Topic: Students decide whether point P lies above / on / below the regression line.
#        Correct answer: code 3 (BELOW — residu = -2.3)
#
# Data chosen so that:
#   - OLS line at x=8 gives yhat ≈ 18.4  (feedback says "≈ 18.3")
#   - P = (8, 16)  →  residu = 16 - 18.4 = -2.4  (negative → below the line)
#   - Neighbouring points (6,21) and (10,16) make P look "on the trend line"
#     which is the deliberate visual trap described in the answer feedback.
# Run from this directory: Rscript generate_punt_P_lijn.R

library(ggplot2)

# ── Data ──────────────────────────────────────────────────────────────────────
other <- data.frame(
  x = c(2,  6, 10, 12, 14),
  y = c(29, 21, 16, 13,  9)
)
punt_P <- data.frame(x = 8, y = 16)

all_pts <- rbind(other, punt_P)
fit     <- lm(y ~ x, data = all_pts)

# Regression line range
line_df <- data.frame(x = c(0, 17))
line_df$y <- predict(fit, newdata = line_df)

# Predicted value at P
yhat_P <- predict(fit, newdata = punt_P)

# ── Plot ──────────────────────────────────────────────────────────────────────
p <- ggplot() +
  # Regression line
  geom_line(data = line_df, aes(x = x, y = y),
            colour = "#2166ac", linewidth = 1.1) +
  # Other points
  geom_point(data = other, aes(x = x, y = y),
             size = 3.5, colour = "grey30", fill = "white",
             shape = 21, stroke = 1.2) +
  # Point P (red, labelled)
  geom_point(data = punt_P, aes(x = x, y = y),
             size = 4.5, colour = "#d73027", fill = "#d73027",
             shape = 21, stroke = 1.5) +
  geom_text(data = punt_P, aes(x = x, y = y, label = "P"),
            nudge_x = 0.6, nudge_y = 1.2,
            size = 5, fontface = "bold", colour = "#d73027") +
  # NOTE: residual segment removed — it would reveal that P is below the line
  labs(
    x        = "Politie-inzet (X)",
    y        = "Criminaliteitsgraad (Y)",
    title    = "Scatterplot: Politie-inzet vs Criminaliteitsgraad",
    subtitle = "Bepaal de ligging van observatie P (rood) t.o.v. de regressielijn"
  ) +
  scale_x_continuous(limits = c(0, 18), breaks = seq(0, 18, 2)) +
  scale_y_continuous(limits = c(0, 34), breaks = seq(0, 30, 5)) +
  theme_classic(base_size = 12) +
  theme(
    plot.title    = element_text(face = "bold", size = 13),
    plot.subtitle = element_text(size = 9.5, colour = "grey40"),
    axis.title    = element_text(face = "bold")
  )

# ── Save ──────────────────────────────────────────────────────────────────────
ggsave("punt_P_lijn.png", plot = p,
       width = 7, height = 5, dpi = 150, bg = "white")
cat(sprintf("Saved: punt_P_lijn.png\n"))
cat(sprintf("Regression: yhat = %.3f + %.3f * x\n", coef(fit)[1], coef(fit)[2]))
cat(sprintf("yhat at x=8: %.3f  |  P y=16  |  residu = %.3f\n",
            yhat_P, 16 - yhat_P))

# generate_regressie_output_tabel.R
# Creates: regressie_output_tabel.png
# Used in: Oef - 8.5 (Hoofdstuk 8)
# Topic: SPSS-style regression output table.
#        Students read R² = 0.872 → 87% of variance explained.
#
# Key values (consistent with Answer.R feedback):
#   n = 10, R = 0.934, R² = 0.872, Adjusted R² = 0.856
#   SE of estimate = 3.117
#   ANOVA: F(1,8) = 54.59, p < .001
#   Coefficients: Constante = 38.24, Politie-inzet = -2.14
#
# Run from this directory: Rscript generate_regressie_output_tabel.R

library(grid)
library(gridExtra)

# ── Helper: draw a bordered table with a bold title header ────────────────────
make_section <- function(title, df_data) {
  # Title grob
  title_grob <- textGrob(
    title,
    gp = gpar(fontface = "bold", fontsize = 10, col = "black"),
    x = 0.01, just = "left"
  )
  # Table grob
  tbl <- tableGrob(
    df_data,
    rows  = NULL,
    theme = ttheme_minimal(
      base_size  = 9,
      core       = list(fg_params = list(col = "black"),
                        bg_params = list(fill = c("white", "#f7f7f7"),
                                         alpha = 1)),
      colhead    = list(fg_params = list(fontface = "bold", col = "black"),
                        bg_params = list(fill = "#dce6f1")),
      padding    = unit(c(4, 6), "mm")
    )
  )
  # Top border line under column headers
  list(title = title_grob, table = tbl)
}

# ── Section 1: Model Summary ──────────────────────────────────────────────────
ms_df <- data.frame(
  "Model"                    = "1",
  "R"                        = ".934a",
  "R\u00b2"                  = ".872",
  "Gecorrigeerde R\u00b2"    = ".856",
  "Std. fout v/d schatting"  = "3.117",
  check.names = FALSE
)

# ── Section 2: ANOVA ──────────────────────────────────────────────────────────
anova_df <- data.frame(
  "Model"                 = c("1", "", ""),
  " "                     = c("Regressie", "Residu", "Totaal"),
  "Kwadratensom"          = c("529.97", "77.63", "607.60"),
  "df"                    = c("1", "8", "9"),
  "Gemiddeld kwadraat"    = c("529.97", "9.70", ""),
  "F"                     = c("54.59", "", ""),
  "Sig."                  = c(".000b", "", ""),
  check.names = FALSE
)

# ── Section 3: Coefficients ───────────────────────────────────────────────────
coef_df <- data.frame(
  "Model"        = c("1", ""),
  " "            = c("(Constante)", "Politie-inzet (X)"),
  "B"            = c("38.24", "-2.14"),
  "Std. fout"    = c("2.19", ".29"),
  "Beta"         = c("", "-.934"),
  "t"            = c("17.46", "-7.39"),
  "Sig."         = c(".000", ".000"),
  check.names = FALSE
)

# ── Footnotes ─────────────────────────────────────────────────────────────────
note1 <- textGrob(
  "a. Predictoren: (Constante), Politie-inzet (X)",
  gp = gpar(fontsize = 8, col = "grey30", fontface = "italic"),
  x = 0.01, just = "left"
)
note2 <- textGrob(
  "b. Afhankelijke variabele: Criminaliteitsgraad (Y)",
  gp = gpar(fontsize = 8, col = "grey30", fontface = "italic"),
  x = 0.01, just = "left"
)

# ── Build grobs ───────────────────────────────────────────────────────────────
s1 <- make_section("Modelsamenvatting", ms_df)
s2 <- make_section("ANOVA\u1d9c", anova_df)
s3 <- make_section("Co\u00ebffici\u00ebnten\u1d9c", coef_df)

main_title <- textGrob(
  "Regressie-uitvoer \u2014 Politie-inzet (X) als predictor van Criminaliteitsgraad (Y)",
  gp = gpar(fontface = "bold", fontsize = 11, col = "#1a3a5c"),
  x = 0.5, just = "centre"
)

layout <- arrangeGrob(
  main_title,
  s1$title, s1$table,
  rectGrob(height = unit(0.5, "mm"), gp = gpar(fill = "grey70", col = NA)),
  s2$title, s2$table,
  rectGrob(height = unit(0.5, "mm"), gp = gpar(fill = "grey70", col = NA)),
  s3$title, s3$table,
  note1, note2,
  ncol   = 1,
  heights = unit(c(12, 6, 28, 1, 6, 32, 1, 6, 32, 5, 5), "mm")
)

# ── Save ──────────────────────────────────────────────────────────────────────
png("regressie_output_tabel.png", width = 820, height = 520,
    res = 110, bg = "white")
grid.draw(layout)
dev.off()
cat("Saved: regressie_output_tabel.png\n")
cat("Key value for students: R2 = 0.872 -> 87%\n")

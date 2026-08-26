# generate_anova_dotplot.R
# Creates: anova_dotplot.png
# Used in: Oef - 9.4 (Hoofdstuk 9)
# Topic: Dot plot of fietsdiefstallen per gemeentetype with group means.
#        Shows that the 3 groups do NOT overlap → large SS_between, high F (~265).
#
# Data from Tabel 1 in description.nl.md:
#   Grootsteden:        3500,2700,2900,3200,3150,3300,2650,4000,3500,3000
#   Middelgrote steden: 1850,1650,1450,1600,1550,1800,1400,1750,1250,1500
#   Rurale gemeenten:    400, 450, 500, 550, 390, 530, 410, 440, 570, 600
#
# Key statistics (from Answer.R):
#   Means: Grootsteden=3190, Middelgrote=1580, Ruraal=484
#   Grand mean = (31900+15800+4840)/30 = 52540/30 = 1751.33
#   F ≈ 265
#
# Run from this directory: Rscript generate_anova_dotplot.R

library(ggplot2)

# ── Data ──────────────────────────────────────────────────────────────────────
groot  <- c(3500, 2700, 2900, 3200, 3150, 3300, 2650, 4000, 3500, 3000)
middel <- c(1850, 1650, 1450, 1600, 1550, 1800, 1400, 1750, 1250, 1500)
ruraal <- c(400,  450,  500,  550,  390,  530,  410,  440,  570,  600)

df <- data.frame(
  diefstallen = c(groot, middel, ruraal),
  gemeentetype = factor(
    rep(c("Grootsteden", "Middelgrote\nsteden", "Rurale\ngemeenten"),
        each = 10),
    levels = c("Grootsteden", "Middelgrote\nsteden", "Rurale\ngemeenten")
  )
)

# Group means
means_df <- aggregate(diefstallen ~ gemeentetype, data = df, FUN = mean)

# Grand mean
grand_mean <- mean(df$diefstallen)

# ── Plot ──────────────────────────────────────────────────────────────────────
p <- ggplot(df, aes(x = gemeentetype, y = diefstallen,
                    colour = gemeentetype)) +
  # Grand mean reference line
  geom_hline(yintercept = grand_mean,
             linetype = "dotted", colour = "grey50", linewidth = 0.8) +
  # Individual data points (jittered slightly for readability)
  geom_jitter(width = 0.12, size = 3.5, alpha = 0.85) +
  # Group mean diamond markers
  geom_point(data = means_df,
             aes(x = gemeentetype, y = diefstallen),
             shape = 18, size = 6, colour = "black") +
  # Group mean horizontal line segments
  geom_crossbar(data = means_df,
                aes(x = gemeentetype, y = diefstallen,
                    ymin = diefstallen, ymax = diefstallen),
                width = 0.55, middle.linewidth = 3, colour = "black", linewidth = 0.9) +
  # NOTE: group mean labels and grand mean value label removed — students must calculate these themselves
  scale_colour_manual(values = c(
    "Grootsteden"          = "#d73027",
    "Middelgrote\nsteden"  = "#fc8d59",
    "Rurale\ngemeenten"    = "#1a9641"
  )) +
  scale_y_continuous(
    limits = c(0, 4400),
    breaks = seq(0, 4000, 500),
    labels = function(x) formatC(x, format = "d", big.mark = ".")
  ) +
  labs(
    x        = "Gemeentetype",
    y        = "Aantal fietsdiefstallen",
    title    = "Fietsdiefstallen per gemeentetype \u2014 30 Belgische gemeenten (2008)",
    subtitle = "Punten = individuele gemeenten | \u25c6 = groepsgemiddelde | \u2026 = grand mean"
  ) +
  theme_classic(base_size = 12) +
  theme(
    legend.position = "none",
    plot.title      = element_text(face = "bold", size = 12),
    plot.subtitle   = element_text(size = 9, colour = "grey40"),
    axis.title      = element_text(face = "bold"),
    axis.text.x     = element_text(size = 11, face = "bold")
  )

# ── Save ──────────────────────────────────────────────────────────────────────
ggsave("anova_dotplot.png", plot = p,
       width = 7.5, height = 5.5, dpi = 150, bg = "white")
cat("Saved: anova_dotplot.png\n")
cat(sprintf("Group means  -> Groot: %d, Middel: %d, Ruraal: %d\n",
            round(mean(groot)), round(mean(middel)), round(mean(ruraal))))
cat(sprintf("Grand mean   -> %.2f\n", grand_mean))

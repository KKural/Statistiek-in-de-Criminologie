# generate_partiele_correlatie_types.R
# Creates: partiele_correlatie_types.png
# Used in: Oef - 10.4 (Hoofdstuk 10)
# Topic: Four effect types in partial correlation analysis
# Run from this directory: Rscript generate_partiele_correlatie_types.R

library(ggplot2)

# ── Data ──────────────────────────────────────────────────────────────────────
df <- data.frame(
  type = factor(
    c("1. Schijnverband", "2. Indirect verband",
      "3. Suppressoreffect", "4. Reeel verband"),
    levels = c("1. Schijnverband", "2. Indirect verband",
               "3. Suppressoreffect", "4. Reeel verband")
  ),
  r_bi   = c(0.62, 0.38, 0.16, 0.55),
  r_par  = c(0.02, 0.21, 0.57, 0.53),
  colour = c("#d73027", "#fc8d59", "#4575b4", "#1a9641"),
  lbl_bi  = c("0.62", "0.38", "0.16", "0.55"),
  lbl_par = c("~0",   "0.21", "0.57", "0.53")
)

arr <- data.frame(
  type = df$type,
  x    = df$r_bi,
  xend = df$r_par,
  col  = df$colour
)

# ── Plot ──────────────────────────────────────────────────────────────────────
p <- ggplot() +
  # Arrow from bi-variate r to partial r
  geom_segment(
    data = arr,
    aes(x = x, xend = xend, y = 0, yend = 0, colour = col),
    arrow     = arrow(length = unit(0.22, "cm"), type = "closed"),
    linewidth = 1.3,
    show.legend = FALSE
  ) +
  # Circles for bi-variate r (left) and partial r (right)
  geom_point(data = df, aes(x = r_bi,  y = 0, colour = colour),
             size = 18, show.legend = FALSE) +
  geom_point(data = df, aes(x = r_par, y = 0, colour = colour),
             size = 18, show.legend = FALSE) +
  # Labels inside circles
  geom_text(data = df, aes(x = r_bi,  y = 0, label = lbl_bi),
            size = 3.4, colour = "white", fontface = "bold") +
  geom_text(data = df, aes(x = r_par, y = 0, label = lbl_par),
            size = 3.4, colour = "white", fontface = "bold") +
  # Column header labels (only on top facet)
  annotate("text", x = 0.62, y =  0.55, label = "r_XY (bivariaat)",
           size = 3.2, fontface = "italic", colour = "grey30") +
  annotate("text", x = 0.10, y =  0.55, label = "r_XY.Z (partieel)",
           size = 3.2, fontface = "italic", colour = "grey30") +
  scale_colour_identity() +
  scale_x_continuous(limits = c(-0.15, 0.85)) +
  scale_y_continuous(limits = c(-0.7, 0.7)) +
  facet_wrap(~type, ncol = 1, strip.position = "left") +
  theme_minimal(base_size = 12) +
  theme(
    axis.text        = element_blank(),
    axis.ticks       = element_blank(),
    axis.title       = element_blank(),
    panel.grid       = element_blank(),
    strip.text.y.left = element_text(angle = 0, hjust = 1,
                                     face = "bold", size = 10),
    panel.spacing.y  = unit(0.8, "cm"),
    plot.title       = element_text(face = "bold", size = 13),
    plot.subtitle    = element_text(size = 10, colour = "grey40"),
    plot.margin      = margin(t = 10, r = 10, b = 10, l = 10)
  ) +
  labs(
    title    = "Vier effecttypen bij partiele correlatie",
    subtitle = "Hoe verandert r_XY nadat je voor Z controleert?"
  )

# ── Save ──────────────────────────────────────────────────────────────────────
out <- file.path(dirname(sys.frame(1)$ofile %||% "."), "partiele_correlatie_types.png")
# Fallback: save next to this script
ggsave("partiele_correlatie_types.png", plot = p,
       width = 8, height = 5.5, dpi = 150, bg = "white")
cat("Saved: partiele_correlatie_types.png\n")

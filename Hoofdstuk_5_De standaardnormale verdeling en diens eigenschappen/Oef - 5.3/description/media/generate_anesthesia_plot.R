# Visualisatie voor Exercise 5.3 - Anesthesie Risico Analyse
# Effectieve versus letale dosissen voor een anestheticum

library(ggplot2)

# -----------------------------
# 1. Parameters uit de vraag
# -----------------------------
mu_eff <- 45   # gemiddelde effectieve dosis (mg)
sd_eff <- 9    # standaardafwijking effectieve dosis

mu_let <- 100  # gemiddelde letale dosis (mg)
sd_let <- 18   # standaardafwijking letale dosis

# 92% effectieve dosis: P(X <= dosis) = 0.92 voor N(45, 9)
dosis_92 <- qnorm(0.92, mean = mu_eff, sd = sd_eff)

# -----------------------------
# 2. Data voor beide verdelingen
# -----------------------------
x_vals <- seq(0, 160, length.out = 1000)

df <- data.frame(
  dosis = x_vals,
  dichtheid_effectief = dnorm(x_vals, mean = mu_eff, sd = sd_eff),
  dichtheid_leta      = dnorm(x_vals, mean = mu_let, sd = sd_let)
)

# Lethaal gebied (voor de letale verdeling, rechts van de 92% dosis)
df$dichtheid_leta_gebied <- ifelse(df$dosis >= dosis_92,
                                   df$dichtheid_leta,
                                   NA)

# -----------------------------
# 3. Plot maken
# -----------------------------
p <- ggplot(df, aes(x = dosis)) +
  # Lethaal gebied inkleuren
  geom_ribbon(aes(ymin = 0, ymax = dichtheid_leta_gebied),
              fill = "red", alpha = 0.25) +
  
  # Effectieve dosis verdeling
  geom_line(aes(y = dichtheid_effectief,
                colour = "Effectieve dosis N(45, 9)"),
            linewidth = 1.3) +
  
  # Letale dosis verdeling
  geom_line(aes(y = dichtheid_leta,
                colour = "Letale dosis N(100, 18)"),
            linewidth = 1.3) +
  
  # Verticale lijn bij 92% effectieve dosis
  geom_vline(xintercept = dosis_92,
             linetype = "dashed", colour = "black", linewidth = 1) +
  
  # Tekstlabel bij 92% dosis
  annotate("text",
           x = dosis_92 + 2,
           y = max(df$dichtheid_effectief) * 0.8,
           label = sprintf("92%% effectieve dosis\n≈ %.1f mg", dosis_92),
           hjust = 0, size = 4) +
  
  # As- en titels (in het Nederlands, met termen uit de vraag)
  labs(
    title    = "Effectieve versus letale dosissen voor een anestheticum",
    x        = "Dosis (mg)",
    y        = "Dichtheid",
    colour   = "Verdeling"
  ) +
  
  scale_colour_manual(values = c(
    "Effectieve dosis N(45, 9)" = "darkorange",
    "Letale dosis N(100, 18)"  = "red"
  )) +
  
  # Juiste schaal voor beginners: duidelijke tick marks
  scale_x_continuous(breaks = seq(0, 160, by = 20)) +
  theme_minimal(base_size = 14) +
  theme(
    plot.title  = element_text(hjust = 0.5, face = "bold"),
    legend.position = "top"
  )

# Plot tonen in R
print(p)

# -----------------------------
# 4. Hoge resolutie afbeelding opslaan (voor Dodona)
# -----------------------------
# Dit maakt een scherpe PNG (300 dpi) die je in Dodona kunt gebruiken.
ggsave("anesthesie_dosissen.png",
       plot = p,
       width = 8, height = 5.33, dpi = 300, units = "in")

cat("Plot opgeslagen als anesthesie_dosissen.png\n")
cat("Effectieve dosis (92%):", round(dosis_92, 1), "mg\n")
cat("Mortaliteitsrisico:", round(pnorm(dosis_92, mean = mu_let, sd = sd_let) * 100, 2), "%\n")
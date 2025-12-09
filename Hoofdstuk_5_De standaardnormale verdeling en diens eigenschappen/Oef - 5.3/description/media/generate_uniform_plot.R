# Visualisatie voor Exercise 5.3 - Anesthesie Risico Analyse (UNIFORM)
# Effectieve versus letale dosissen - beide verdelingen uniform weergegeven

library(ggplot2)

# -----------------------------
# 1. Parameters uit de vraag
# -----------------------------
mu_eff <- 45   # gemiddelde effectieve dosis (mg)
sd_eff <- 9    # standaardafwijking effectieve dosis

mu_let <- 100  # gemiddelde letale dosis (mg)
sd_let <- 18   # standaardafwijking letale dosis

# Dosis grens (zonder 92% te tonen - dit moeten studenten berekenen)
dosis_grens <- qnorm(0.92, mean = mu_eff, sd = sd_eff)

# -----------------------------
# 2. Data voor beide verdelingen
# -----------------------------
x_vals <- seq(0, 160, length.out = 1000)

df <- data.frame(
  dosis = x_vals,
  dichtheid_effectief = dnorm(x_vals, mean = mu_eff, sd = sd_eff),
  dichtheid_letaal    = dnorm(x_vals, mean = mu_let, sd = sd_let)
)

# -----------------------------
# 3. UNIFORME Plot maken - beide verdelingen als schone curves
# -----------------------------
p <- ggplot(df, aes(x = dosis)) +
  # Effectieve dosis verdeling (oranje curve)
  geom_line(aes(y = dichtheid_effectief,
                colour = "Effectieve dosis N(45, 9)"),
            linewidth = 1.5) +
  
  # Letale dosis verdeling (rode curve)  
  geom_line(aes(y = dichtheid_letaal,
                colour = "Letale dosis N(100, 18)"),
            linewidth = 1.5) +
  
  # Verticale referentielijn (zonder specifieke waarde te tonen)
  geom_vline(xintercept = dosis_grens,
             linetype = "dashed", colour = "black", linewidth = 1) +
  
  # Generiek label (geen 92% spoiler)
  annotate("text",
           x = dosis_grens + 2,
           y = max(df$dichtheid_effectief) * 0.8,
           label = "Gewenste\neffectieve dosis",
           hjust = 0, size = 4, fontface = "bold") +
  
  # Titels en assen
  labs(
    title    = "Effectieve en letale dosissen van anestheticum",
    subtitle = "Twee normale verdelingen voor risico-analyse",
    x        = "Dosis (mg)",
    y        = "Dichtheid",
    colour   = "Verdeling"
  ) +
  
  # Consistente kleuren
  scale_colour_manual(values = c(
    "Effectieve dosis N(45, 9)" = "darkorange",
    "Letale dosis N(100, 18)"   = "red"
  )) +
  
  scale_x_continuous(breaks = seq(0, 160, by = 20)) +
  theme_minimal(base_size = 14) +
  theme(
    plot.title    = element_text(hjust = 0.5, face = "bold"),
    plot.subtitle = element_text(hjust = 0.5),
    legend.position = "top",
    panel.background = element_rect(fill = "white", colour = "white"),
    plot.background = element_rect(fill = "white", colour = "white")
  )

# Plot tonen
print(p)

# Hoge resolutie opslaan
ggsave("anesthesie_uniform.png",
       plot = p, width = 10, height = 6, dpi = 300,
       bg = "white")

cat("Uniforme anesthesie plot gegenereerd als 'anesthesie_uniform.png'\n")
cat("Beide verdelingen nu consistent weergegeven als schone curves\n")
cat("Geen selectieve arcering - beide verdelingen gelijk behandeld\n")
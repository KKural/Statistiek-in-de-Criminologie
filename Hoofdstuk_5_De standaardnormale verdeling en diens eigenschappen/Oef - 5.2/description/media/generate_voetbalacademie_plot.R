# OEFENING 2 – Voetbalacademie
# ---------------------------------
# Normale verdeling van toetsscores N(75, 10)
# met drie zones: <65, 65–80, >=80

library(ggplot2)

mu  <- 75   # gemiddelde toetsscore
sd  <- 10   # standaarddeviatie

# Data voor de curve
x_vals <- seq(30, 120, length.out = 1000)
dens   <- dnorm(x_vals, mean = mu, sd = sd)

df2 <- data.frame(
  score   = x_vals,
  dichtheid = dens
)

# Zones volgens regels van de academie
df2$zone <- cut(
  df2$score,
  breaks = c(-Inf, 65, 80, Inf),
  labels = c(
    "Niet deelnemen (< 65%)",
    "Mee trainen, niet spelen (65–79%)",
    "Volledig deelnemen (≥ 80%)"
  )
)

# Plot
p2 <- ggplot(df2, aes(x = score, y = dichtheid)) +
  # Gekleurde zones onder de curve
  geom_area(aes(fill = zone), alpha = 0.5) +
  geom_line(size = 1.2, colour = "black") +
  
  # Verticale lijnen bij 65% en 80%
  geom_vline(xintercept = 65, linetype = "dashed", colour = "black") +
  geom_vline(xintercept = 80, linetype = "dashed", colour = "black") +
  
  # Labels bij de drempels
  annotate("text", x = 65, y = max(df2$dichtheid) * 0.95,
           label = "65% grens", angle = 90, vjust = -0.4, size = 3.5) +
  annotate("text", x = 80, y = max(df2$dichtheid) * 0.95,
           label = "80% grens", angle = 90, vjust = -0.4, size = 3.5) +
  
  # Titels en assen (in termen van de vraag)
  labs(
    title   = "Toetsscores van kandidaten – Voetbalacademie",
    subtitle = "Normale verdeling N(75, 10) met selectiegrenzen op 65% en 80%",
    x       = "Toetsscore (%)",
    y       = "Dichtheid",
    fill    = "Categorie"
  ) +
  scale_x_continuous(breaks = seq(30, 120, by = 10)) +
  scale_fill_manual(values = c("#ff9999", "#ffcc99", "#99ff99")) +
  theme_minimal(base_size = 14) +
  theme(
    plot.title    = element_text(hjust = 0.5, face = "bold"),
    plot.subtitle = element_text(hjust = 0.5),
    legend.position = "top",
    panel.background = element_rect(fill = "white", colour = "white"),
    plot.background = element_rect(fill = "white", colour = "white")
  )

# Toon de plot
print(p2)

# Hoge resolutie opslaan voor Dodona
ggsave("voetbalacademie_scores.png",
       plot = p2, width = 10, height = 6, dpi = 300,
       bg = "white")

cat("Plot gegenereerd en opgeslagen als 'voetbalacademie_scores.png'\n")
# OEFENING 5 – Leeftijdsverdeling Gevangenis (GEEN SPOILERS)
# ---------------------------------
# Leeftijden ~ N(37.8, 5.6) 
# Schone verdeling zonder antwoord te tonen

library(ggplot2)

mu_age <- 37.8
sd_age <- 5.6

# Data voor de curve (geen grens berekenen - dat moeten studenten doen!)
x_age <- seq(mu_age - 4 * sd_age, mu_age + 4 * sd_age, length.out = 1000)
dens_age <- dnorm(x_age, mean = mu_age, sd = sd_age)

df5 <- data.frame(
  leeftijd  = x_age,
  dichtheid = dens_age
)

# Plot ZONDER antwoord te tonen
p5 <- ggplot(df5, aes(x = leeftijd, y = dichtheid)) +
  # Alleen de schone normale curve
  geom_line(linewidth = 1.5, colour = "#1f77b4") +
  
  # Gemiddelde lijn ter referentie
  geom_vline(xintercept = mu_age, colour = "black", linewidth = 1, linetype = "solid") +
  
  # Label voor gemiddelde (offset naar rechts om overlap te vermijden)
  annotate("text", x = mu_age + 1.5, y = max(df5$dichtheid) * 0.9,
           label = "μ = 37.8 jaar", hjust = 0, size = 4, fontface = "bold") +
  
  # Titels en assen
  labs(
    title = "Leeftijdsverdeling in de gevangenispopulatie",
    subtitle = "Normale verdeling N(37.8, 5.6)",
    x = "Leeftijd (jaar)",
    y = "Dichtheid"
  ) +
  
  scale_x_continuous(breaks = seq(15, 60, by = 5)) +
  theme_minimal(base_size = 14) +
  theme(
    plot.title    = element_text(hjust = 0.5, face = "bold"),
    plot.subtitle = element_text(hjust = 0.5),
    panel.background = element_rect(fill = "white", colour = "white"),
    plot.background = element_rect(fill = "white", colour = "white")
  )

# Plot tonen
print(p5)

# Hoge resolutie opslaan voor Dodona
ggsave("leeftijdsverdeling_clean.png",
       plot = p5, width = 10, height = 6, dpi = 300,
       bg = "white")

cat("Schone leeftijdsverdeling plot gegenereerd als 'leeftijdsverdeling_clean.png'\n")
cat("GEEN antwoord-spoilers: geen shaded gebied, geen percentiel-lijnen\n")
cat("Studenten moeten zelf berekenen welke leeftijd bij oudste 10% hoort\n")
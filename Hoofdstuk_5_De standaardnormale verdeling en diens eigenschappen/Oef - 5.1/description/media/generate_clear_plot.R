# OEFENING 5.1 – Verbeterde Verkeersboetes Plot
# ---------------------------------
# Normale verdeling van verkeersboetes N(42.5, 7.5)
# Hoge kwaliteit plot met duidelijke visualisatie

library(ggplot2)

# Parameters
mu <- 42.5      # Gemiddelde boete in €
sigma <- 7.5    # Standaardafwijking in €

# Data voor de curve
x_vals <- seq(mu - 4*sigma, mu + 4*sigma, length.out = 1000)
dens <- dnorm(x_vals, mean = mu, sd = sigma)

df <- data.frame(
  bedrag = x_vals,
  dichtheid = dens
)

# Verschillende zones definiëren voor betere visualisatie
df$zone <- cut(
  df$bedrag,
  breaks = c(-Inf, 20, 25, 32, 50, Inf),
  labels = c(
    "Zeer laag (< 20€)",
    "Laag (20-25€)", 
    "Gemiddeld laag (25-32€)",
    "Gemiddeld hoog (32-50€)",
    "Hoog (> 50€)"
  )
)

# Plot maken
p1 <- ggplot(df, aes(x = bedrag, y = dichtheid)) +
  # Hoofdcurve
  geom_line(linewidth = 1.5, colour = "#1f77b4") +
  
  # Gemiddelde lijn (μ = 42.5)
  geom_vline(xintercept = mu, colour = "black", linewidth = 1.2, linetype = "solid") +
  
  # ±1σ lijnen voor referentie
  geom_vline(xintercept = mu - sigma, colour = "red", linewidth = 1, linetype = "dashed") +
  geom_vline(xintercept = mu + sigma, colour = "red", linewidth = 1, linetype = "dashed") +
  
  # Belangrijke punten uit de vraagstelling markeren
  geom_vline(xintercept = 20, colour = "orange", linewidth = 0.8, linetype = "dotted") +
  geom_vline(xintercept = 25, colour = "orange", linewidth = 0.8, linetype = "dotted") +
  geom_vline(xintercept = 32, colour = "green", linewidth = 0.8, linetype = "dotted") +
  geom_vline(xintercept = 29, colour = "purple", linewidth = 0.8, linetype = "dotted") +
  
  # Labels voor belangrijke punten
  annotate("text", x = mu, y = max(df$dichtheid) * 1.05,
           label = "μ = 42,5€", hjust = 0.5, size = 4, fontface = "bold") +
  annotate("text", x = mu - sigma, y = max(df$dichtheid) * 0.15,
           label = "35€\n(-1σ)", hjust = 0.5, size = 3, colour = "red") +
  annotate("text", x = mu + sigma, y = max(df$dichtheid) * 0.15,
           label = "50€\n(+1σ)", hjust = 0.5, size = 3, colour = "red") +
  
  # Labels voor vraagstelling punten
  annotate("text", x = 22.5, y = max(df$dichtheid) * 0.8,
           label = "20-25€\n(vraag a)", hjust = 0.5, size = 2.8, colour = "orange") +
  annotate("text", x = 32, y = max(df$dichtheid) * 0.9,
           label = "< 32€\n(vraag b)", hjust = 0.5, size = 2.8, colour = "green") +
  annotate("text", x = 29, y = max(df$dichtheid) * 0.7,
           label = "> 29€\n(vraag c)", hjust = 0.5, size = 2.8, colour = "purple") +
  
  # Titels en assen
  labs(
    title = "Normale verdeling van verkeersboetes",
    subtitle = "μ = 42,5€, σ = 7,5€ | Belangrijke grenzen uit vraagstelling gemarkeerd",
    x = "Boetebedrag (€)",
    y = "Dichtheid"
  ) +
  
  scale_x_continuous(breaks = seq(15, 70, by = 5)) +
  
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold", size = 16),
    plot.subtitle = element_text(hjust = 0.5, size = 12),
    panel.background = element_rect(fill = "white", colour = "white"),
    plot.background = element_rect(fill = "white", colour = "white"),
    panel.grid.minor = element_blank(),
    panel.grid.major = element_line(colour = "grey90", linewidth = 0.5)
  )

# Plot tonen
print(p1)

# Hoge resolutie opslaan voor Dodona
ggsave("verkeersboetes_clear.png",
       plot = p1, width = 10, height = 6, dpi = 300,
       bg = "white")

cat("Verbeterde plot gegenereerd en opgeslagen als 'verkeersboetes_clear.png'\n")
cat("Specifieke punten uit de vraagstelling zijn gemarkeerd:\n")
cat("- Oranje: 20-25€ interval (vraag a)\n")
cat("- Groen: 32€ grens (vraag b)\n")
cat("- Paars: 29€ grens (vraag c)\n")
cat("- Rood: ±1σ grenzen (35€ en 50€)\n")
# OEFENING 5 – Oudste 10% gevangenen
# ---------------------------------
# Leeftijden ~ N(37.8, 5.6)
# We tonen de grens van de oudste 10% (ongeveer 45 jaar) als rechterstaart.

library(ggplot2)

mu_age <- 37.8
sd_age <- 5.6

# Bovenste 10% → 90ste percentiel
leeftijd_grens <- qnorm(0.90, mean = mu_age, sd = sd_age)

# Data voor de curve
x_age <- seq(mu_age - 4 * sd_age, mu_age + 4 * sd_age, length.out = 1000)
dens_age <- dnorm(x_age, mean = mu_age, sd = sd_age)

df5 <- data.frame(
  leeftijd  = x_age,
  dichtheid = dens_age
)

# Staartgebied: oudste 10% (rechts van grensleeftijd)
df5$dichtheid_staart <- ifelse(df5$leeftijd >= leeftijd_grens,
                               df5$dichtheid, NA)

# Plot
p5 <- ggplot(df5, aes(x = leeftijd, y = dichtheid)) +
  # Staartgebied inkleuren (oudste 10%)
  geom_area(aes(y = dichtheid_staart),
            fill = "tomato", alpha = 0.6) +
  
  # Volledige normale curve
  geom_line(size = 1.2, colour = "black") +
  
  # Verticale lijn bij grensleeftijd
  geom_vline(xintercept = leeftijd_grens,
             linetype = "dashed", colour = "black", linewidth = 1) +
  
  # Tekstlabel bij de grens
  annotate("text",
           x = leeftijd_grens + 0.3,
           y = max(df5$dichtheid) * 0.8,
           label = sprintf("Grens oudste 10%%\n≈ %.1f jaar", leeftijd_grens),
           hjust = 0, size = 4) +
  
  # Titels en assen
  labs(
    title    = "Leeftijden in de gevangenispopulatie",
    subtitle = "Normale verdeling N(37.8, 5.6) – oudste 10% in rood",
    x        = "Leeftijd (jaar)",
    y        = "Dichtheid"
  ) +
  scale_x_continuous(breaks = seq(20, 60, by = 5)) +
  theme_minimal(base_size = 14) +
  theme(
    plot.title    = element_text(hjust = 0.5, face = "bold"),
    plot.subtitle = element_text(hjust = 0.5),
    panel.background = element_rect(fill = "white", colour = "white"),
    plot.background = element_rect(fill = "white", colour = "white")
  )

# Toon de plot
print(p5)

# Hoge resolutie opslaan voor Dodona
ggsave("oudste_10_procent_gevangenen.png",
       plot = p5, width = 10, height = 6, dpi = 300,
       bg = "white")

cat("Plot gegenereerd en opgeslagen als 'oudste_10_procent_gevangenen.png'\n")
cat(sprintf("Grensleeftijd voor oudste 10%%: %.2f jaar\n", leeftijd_grens))
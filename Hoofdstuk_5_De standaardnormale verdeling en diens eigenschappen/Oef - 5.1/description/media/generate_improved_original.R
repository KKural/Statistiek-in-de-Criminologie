# OEFENING 5.1 – Original Design with Improved Quality
# ---------------------------------
# Exact same design as before, just higher quality
# Normal distribution N(42.5, 7.5) with shaded 1σ region

library(ggplot2)

# Parameters (same as original)
mu <- 42.5      # Mean traffic fine in €
sigma <- 7.5    # Standard deviation in €

# Data for density curve (same as original)
x <- seq(mu - 4*sigma, mu + 4*sigma, length.out = 2000)
dens <- dnorm(x, mean = mu, sd = sigma)
df <- data.frame(x = x, y = dens)

# Highlight region inside 1 SD (same as original design)
df$inside <- ifelse(df$x >= (mu - sigma) & df$x <= (mu + sigma), df$y, NA)

# Generate axis breaks (same as original)
x_breaks <- seq(15, 70, by = 5)
y_breaks <- seq(0, max(df$y) + 0.01, by = 0.01)

# Create the ggplot (exactly same design as original)
p <- ggplot(df, aes(x, y)) +
  
  # Shaded zone between mu - sigma and mu + sigma (same color)
  geom_area(aes(y = inside), fill = "#c6dbef", alpha = 0.8) +
  
  # Full normal curve (same style)
  geom_line(linewidth = 1.3, colour = "#2171b5") +
  
  # Mean line (μ = 42.5) - same as original
  geom_vline(xintercept = mu, colour = "black", linewidth = 1.2) +
  annotate("text", x = mu, y = max(df$y) * 1.08,
           label = "Gemiddelde μ = 42,5 €", fontface = "bold", size = 4) +
  
  # ±1σ dashed lines (same as original)
  geom_vline(xintercept = mu - sigma, linetype = "dashed",
             colour = "red4", linewidth = 0.9) +
  geom_vline(xintercept = mu + sigma, linetype = "dashed",
             colour = "red4", linewidth = 0.9) +
  
  # Rotated text labels for sigma lines (same as original)
  annotate("text", x = mu - sigma, y = max(df$y) * 0.8,
           label = "-1σ (35 €)", colour = "red4", angle = 90, vjust = -0.5, size = 3.5) +
  annotate("text", x = mu + sigma, y = max(df$y) * 0.8,
           label = "+1σ (50 €)", colour = "red4", angle = 90, vjust = -0.5, size = 3.5) +
  
  # Titles and axis labels (same as original)
  labs(
    title = "Normale verdeling van verkeersboetes",
    subtitle = "Met gemiddelde μ = 42,5 € en standaardafwijking σ = 7,5 €",
    x = "Boetebedrag (€)",
    y = "Dichtheid (density)"
  ) +
  
  # Readable ticks (same as original)
  scale_x_continuous(breaks = x_breaks) +
  scale_y_continuous(breaks = y_breaks) +
  
  # Theme (same as original, but with white background for clarity)
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold", size = 16),
    plot.subtitle = element_text(hjust = 0.5, size = 12),
    panel.grid.minor = element_blank(),
    panel.grid.major.x = element_line(colour = "grey85"),
    panel.grid.major.y = element_line(colour = "grey90"),
    panel.background = element_rect(fill = "white", colour = "white"),
    plot.background = element_rect(fill = "white", colour = "white")
  )

# Show the plot
print(p)

# Generate high-resolution PNG (300 DPI for better quality)
ggsave("normal_distribution_improved.png", plot = p, 
       width = 8, height = 5.33, dpi = 300, units = "in",
       bg = "white")

# Verify file creation
if (file.exists("normal_distribution_improved.png")) {
  file_info <- file.info("normal_distribution_improved.png")
  cat("✅ SUCCESS: Original design with improved quality created!\n")
  cat("📁 File: normal_distribution_improved.png\n")
  cat("📊 Resolution: 8×5.33 inches at 300 DPI\n")
  cat("📏 File size:", round(file_info$size/1024, 1), "KB\n")
  cat("🎯 Same design as original, just higher quality\n")
} else {
  cat("❌ ERROR: File not created!\n")
}
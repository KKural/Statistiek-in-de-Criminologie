# High-resolution normal distribution plot for Exercise 5.1 - Traffic Fines
# Parameters: μ = 42.5€, σ = 7.5€
# Location: Oef - 5.1/description/media/
# Using ggplot2 for professional visualization

library(ggplot2)

# Print current working directory for verification
cat("Working directory:", getwd(), "\n")

# Exercise 5.1 parameters
mu <- 42.5      # Mean traffic fine in €
sigma <- 7.5    # Standard deviation in €

# Data for density curve
x <- seq(mu - 4*sigma, mu + 4*sigma, length.out = 2000)
dens <- dnorm(x, mean = mu, sd = sigma)
df <- data.frame(x = x, y = dens)

# Highlight region inside 1 SD (mu - sigma to mu + sigma)
df$inside <- ifelse(df$x >= (mu - sigma) & df$x <= (mu + sigma), df$y, NA)

# Generate x-axis ticks (every 5 euros)
x_breaks <- seq(15, 70, by = 5)

# Generate y-axis ticks
y_breaks <- seq(0, max(df$y) + 0.01, by = 0.01)

# Create the ggplot
p <- ggplot(df, aes(x, y)) +
  
  # Shaded zone between mu - sigma and mu + sigma
  geom_area(aes(y = inside), fill = "#c6dbef", alpha = 0.8) +
  
  # Full normal curve
  geom_line(linewidth = 1.3, colour = "#2171b5") +
  
  # Mean line (μ = 42.5)
  geom_vline(xintercept = mu, colour = "black", linewidth = 1.2) +
  annotate("text", x = mu, y = max(df$y) * 1.08,
           label = "Gemiddelde μ = 42,5 €", fontface = "bold", size = 4) +
  
  # ±1σ dashed lines
  geom_vline(xintercept = mu - sigma, linetype = "dashed",
             colour = "red4", linewidth = 0.9) +
  geom_vline(xintercept = mu + sigma, linetype = "dashed",
             colour = "red4", linewidth = 0.9) +
  
  # Rotated text labels for sigma lines
  annotate("text", x = mu - sigma, y = max(df$y) * 0.8,
           label = "-1σ (35 €)", colour = "red4", angle = 90, vjust = -0.5, size = 3.5) +
  annotate("text", x = mu + sigma, y = max(df$y) * 0.8,
           label = "+1σ (50 €)", colour = "red4", angle = 90, vjust = -0.5, size = 3.5) +
  
  # Titles and axis labels
  labs(
    title = "Normale verdeling van verkeersboetes",
    subtitle = "Met gemiddelde μ = 42,5 € en standaardafwijking σ = 7,5 €",
    x = "Boetebedrag (€)",
    y = "Dichtheid (density)"
  ) +
  
  # Readable ticks
  scale_x_continuous(breaks = x_breaks) +
  scale_y_continuous(breaks = y_breaks) +
  
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold", size = 16),
    plot.subtitle = element_text(hjust = 0.5, size = 12),
    panel.grid.minor = element_blank(),
    panel.grid.major.x = element_line(colour = "grey85"),
    panel.grid.major.y = element_line(colour = "grey90")
  )

# Generate high-resolution PNG (300 DPI for print quality)
ggsave("normal_distribution_plot.png", plot = p, 
       width = 8, height = 5.33, dpi = 300, units = "in")

# Verify the file was created
if (file.exists("normal_distribution_plot.png")) {
  file_info <- file.info("normal_distribution_plot.png")
  cat("✅ SUCCESS: High-resolution ggplot2 visualization created!\n")
  cat("📁 Location:", file.path(getwd(), "normal_distribution_plot.png"), "\n")
  cat("📊 Resolution: 8×5.33 inches at 300 DPI (2400×1600 pixels)\n")
  cat("📏 File size:", round(file_info$size/1024, 1), "KB\n")
  cat("🎯 Parameters: μ = 42.5€, σ = 7.5€\n")
  cat("🎨 Features: Shaded 1σ region, clean labels, professional styling\n")
} else {
  cat("❌ ERROR: Plot file not created!\n")
  cat("Current directory:", getwd(), "\n")
  cat("Files in directory:", paste(list.files(), collapse = ", "), "\n")
  cat("💡 Make sure ggplot2 is installed: install.packages('ggplot2')\n")
}
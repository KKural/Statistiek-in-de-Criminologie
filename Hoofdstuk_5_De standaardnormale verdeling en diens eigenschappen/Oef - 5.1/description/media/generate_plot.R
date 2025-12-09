# High-resolution normal distribution plot for Exercise 5.1 - Traffic Fines
# Parameters: μ = 42.5€, σ = 7.5€
# Location: Oef - 5.1/description/media/

# Ensure we're in the correct directory (media folder)
# This script should be run from the media folder where it's located

# Print current working directory for verification
cat("Working directory:", getwd(), "\n")

# Generate high-resolution PNG (300 DPI for print quality)
png("normal_distribution_plot.png", width = 2400, height = 1600, res = 300)

# Exercise 5.1 parameters
mu <- 42.5      # Mean traffic fine in €
sigma <- 7.5    # Standard deviation in €

# Generate x values for smooth curve (4 standard deviations on each side)
x <- seq(mu - 4*sigma, mu + 4*sigma, length.out = 500)
y <- dnorm(x, mean = mu, sd = sigma)

# Create the main plot
plot(
  x, y, type = "l", lwd = 3, col = "steelblue",
  xlab = "Boetebedrag (€)",
  ylab = "Dichtheid (density)",
  main = "Normale verdeling van verkeersboetes (μ = 42.5€, σ = 7.5€)",
  cex.main = 1.2,
  cex.lab = 1.1,
  cex.axis = 1.0
)

# Add vertical lines for mean and standard deviations
abline(v = mu, col = "red", lwd = 2)
abline(v = mu + sigma, col = "grey40", lty = 2, lwd = 1.5)
abline(v = mu - sigma, col = "grey40", lty = 2, lwd = 1.5)
abline(v = mu + 2*sigma, col = "grey60", lty = 3)
abline(v = mu - 2*sigma, col = "grey60", lty = 3)

# Add text labels
text(mu, max(y)*0.95, "μ = 42.5€", col = "red", pos = 3, cex = 1.1, font = 2)
text(mu + sigma, max(y)*0.7, "+1σ (50€)", col = "grey40", pos = 3, cex = 0.9)
text(mu - sigma, max(y)*0.7, "-1σ (35€)", col = "grey40", pos = 3, cex = 0.9)
text(mu + 2*sigma, max(y)*0.4, "+2σ (57.5€)", col = "grey60", pos = 3, cex = 0.8)
text(mu - 2*sigma, max(y)*0.4, "-2σ (27.5€)", col = "grey60", pos = 3, cex = 0.8)

# Add grid for better readability
grid(col = "lightgray", lty = 3)

# Finish the plot
dev.off()

# Verify the file was created
if (file.exists("normal_distribution_plot.png")) {
  file_info <- file.info("normal_distribution_plot.png")
  cat("✅ SUCCESS: High-resolution plot created!\n")
  cat("📁 Location:", file.path(getwd(), "normal_distribution_plot.png"), "\n")
  cat("📊 Resolution: 2400x1600 pixels at 300 DPI\n")
  cat("📏 File size:", round(file_info$size/1024, 1), "KB\n")
  cat("🎯 Parameters: μ = 42.5€, σ = 7.5€\n")
} else {
  cat("❌ ERROR: Plot file not created!\n")
  cat("Current directory:", getwd(), "\n")
  cat("Files in directory:", paste(list.files(), collapse = ", "), "\n")
}
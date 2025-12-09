# =================================================================
# IMAGE SIZING METHODS TEMPLATE FOR DODONA EXERCISES
# =================================================================
# This script demonstrates different methods to control image sizes
# in Dodona exercise descriptions. Use this as a reference template
# for future exercises in Hoofdstuk 5.
#
# Created: December 2025
# Purpose: Avoid copy-paste workflow for large images
# =================================================================

library(ggplot2)

# =================================================================
# EXAMPLE: Anesthesia Risk Analysis Visualization
# =================================================================

# Parameters for the example plot
mu_eff <- 45   # gemiddelde effectieve dosis (mg)
sd_eff <- 9    # standaardafwijking effectieve dosis
mu_let <- 100  # gemiddelde letale dosis (mg)
sd_let <- 18   # standaardafwijking letale dosis
dosis_92 <- qnorm(0.92, mean = mu_eff, sd = sd_eff)

# Generate data
x_vals <- seq(0, 160, length.out = 1000)
df <- data.frame(
  dosis = x_vals,
  dichtheid_effectief = dnorm(x_vals, mean = mu_eff, sd = sd_eff),
  dichtheid_leta      = dnorm(x_vals, mean = mu_let, sd = sd_let)
)
df$dichtheid_leta_gebied <- ifelse(df$dosis >= dosis_92, df$dichtheid_leta, NA)

# Create the plot
p <- ggplot(df, aes(x = dosis)) +
  geom_ribbon(aes(ymin = 0, ymax = dichtheid_leta_gebied),
              fill = "red", alpha = 0.25) +
  geom_line(aes(y = dichtheid_effectief,
                colour = "Effectieve dosis N(45, 9)"),
            linewidth = 1.3) +
  geom_line(aes(y = dichtheid_leta,
                colour = "Letale dosis N(100, 18)"),
            linewidth = 1.3) +
  geom_vline(xintercept = dosis_92,
             linetype = "dashed", colour = "black", linewidth = 1) +
  annotate("text",
           x = dosis_92 + 2,
           y = max(df$dichtheid_effectief) * 0.8,
           label = sprintf("92%% effectieve dosis\n≈ %.1f mg", dosis_92),
           hjust = 0, size = 4) +
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
  scale_x_continuous(breaks = seq(0, 160, by = 20)) +
  theme_minimal(base_size = 14) +
  theme(
    plot.title  = element_text(hjust = 0.5, face = "bold"),
    legend.position = "top",
    plot.background = element_rect(fill = "white", color = NA),
    panel.background = element_rect(fill = "white", color = NA)
  )

# =================================================================
# IMAGE GENERATION WITH DIFFERENT SIZES
# =================================================================

cat("Generating images with different sizes...\n")

# Large version (for HTML sizing methods) - HIGH QUALITY
ggsave("image_large.png", plot = p, 
       width = 10, height = 6, dpi = 300)
cat("✅ Large: image_large.png (10×6 in, 300 DPI)\n")

# Medium version - BALANCED QUALITY/SIZE
ggsave("image_medium.png", plot = p, 
       width = 6, height = 3.6, dpi = 200)
cat("✅ Medium: image_medium.png (6×3.6 in, 200 DPI)\n")

# Small version - WEB OPTIMIZED
ggsave("image_small.png", plot = p, 
       width = 4, height = 2.4, dpi = 150)
cat("✅ Small: image_small.png (4×2.4 in, 150 DPI)\n")

# Thumbnail version - VERY COMPACT
ggsave("image_thumb.png", plot = p, 
       width = 3, height = 1.8, dpi = 100)
cat("✅ Thumbnail: image_thumb.png (3×1.8 in, 100 DPI)\n")

# =================================================================
# MARKDOWN METHODS FOR DODONA DESCRIPTIONS
# =================================================================

cat("\n" %+% "=".repeat(60) %+% "\n")
cat("COPY-PASTE INTO YOUR DESCRIPTION.NL.MD FILE:\n")
cat("=".repeat(60) %+% "\n\n")

# Method 1: Standard Markdown (uses native file size)
cat("<!-- METHOD 1: Standard Markdown -->\n")
cat("![Description](media/image_medium.png)\n\n")

# Method 2: HTML with fixed width (RECOMMENDED - works in Dodona)
cat("<!-- METHOD 2: HTML with fixed width (RECOMMENDED) -->\n")
cat('<img src="media/image_large.png" alt="Description" width="600">\n\n')

# Method 3: HTML with smaller width
cat("<!-- METHOD 3: HTML with smaller width -->\n")
cat('<img src="media/image_large.png" alt="Description" width="400">\n\n')

# Method 4: CSS responsive sizing (works in Dodona)
cat("<!-- METHOD 4: CSS responsive sizing -->\n")
cat('<img src="media/image_large.png" alt="Description" style="width: 60%; max-width: 500px;">\n\n')

# Method 5: CSS fixed width (works in Dodona)
cat("<!-- METHOD 5: CSS fixed width -->\n")
cat('<img src="media/image_large.png" alt="Description" style="width: 450px;">\n\n')

# Method 6: Small file without constraints
cat("<!-- METHOD 6: Small file, no size constraints -->\n")
cat("![Description](media/image_small.png)\n\n")

# =================================================================
# RECOMMENDATIONS FOR DIFFERENT USE CASES
# =================================================================

cat("=".repeat(60) %+% "\n")
cat("RECOMMENDATIONS:\n")
cat("=".repeat(60) %+% "\n")
cat("🎯 For most exercises: METHOD 2 with width='600'\n")
cat("📱 For mobile-friendly: METHOD 4 with responsive CSS\n") 
cat("💾 For fast loading: METHOD 6 with small files\n")
cat("🔍 For detailed views: METHOD 2 with width='800'\n")
cat("📄 For inline diagrams: METHOD 3 with width='400'\n\n")

cat("✅ All images generated successfully!\n")
cat("📁 Place images in: description/media/\n")
cat("📝 Copy desired method into description.nl.md\n")

# =================================================================
# FILE SIZE INFORMATION
# =================================================================

cat("\n" %+% "FILE SIZES:\n")
if (file.exists("image_large.png")) {
  size_large <- round(file.info("image_large.png")$size / 1024, 1)
  cat(sprintf("📊 Large: %s KB\n", size_large))
}
if (file.exists("image_medium.png")) {
  size_medium <- round(file.info("image_medium.png")$size / 1024, 1)
  cat(sprintf("📊 Medium: %s KB\n", size_medium))
}
if (file.exists("image_small.png")) {
  size_small <- round(file.info("image_small.png")$size / 1024, 1)
  cat(sprintf("📊 Small: %s KB\n", size_small))
}
if (file.exists("image_thumb.png")) {
  size_thumb <- round(file.info("image_thumb.png")$size / 1024, 1)
  cat(sprintf("📊 Thumbnail: %s KB\n", size_thumb))
}
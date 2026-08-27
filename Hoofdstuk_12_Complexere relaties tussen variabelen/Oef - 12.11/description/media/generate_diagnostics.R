# Genereert de acht diagnostische figuren voor Oef - 12.11.
# Voer dit script uit vanuit deze map met: Rscript generate_diagnostics.R

blue <- "#1E64C8"
red <- "#D62828"
dark <- "#243447"
grid <- "#D9DEE7"

open_png <- function(filename) {
  png(filename, width = 1050, height = 675, res = 150, bg = "white")
  par(
    mar = c(4.5, 5.0, 3.3, 1.1),
    mgp = c(2.8, 0.8, 0),
    las = 1,
    bty = "l",
    family = "sans",
    col.axis = dark,
    col.lab = dark,
    col.main = dark
  )
}

draw_residual_plot <- function(filename, panel, residuals, fitted) {
  open_png(filename)
  plot(
    fitted, residuals,
    pch = 21, bg = adjustcolor(blue, alpha.f = 0.70), col = blue,
    cex = 1.05, lwd = 1.1,
    xlab = "Geschatte waarden",
    ylab = "Residuen",
    main = paste0("Figuur ", panel, ": lineariteit"),
    ylim = c(-16, 16)
  )
  abline(h = 0, col = "#7A7A7A", lty = 2, lwd = 1.3)
  lines(lowess(fitted, residuals, f = 0.65), col = red, lwd = 2.6)
  dev.off()
}

draw_scale_location <- function(filename, panel, spread, fitted) {
  open_png(filename)
  plot(
    fitted, spread,
    pch = 21, bg = adjustcolor(blue, alpha.f = 0.70), col = blue,
    cex = 1.05, lwd = 1.1,
    xlab = "Geschatte waarden",
    ylab = "Wortel van absolute gestandaardiseerde residuen",
    main = paste0("Figuur ", panel, ": homoscedasticiteit"),
    ylim = c(0, 2.2)
  )
  lines(lowess(fitted, spread, f = 0.70), col = red, lwd = 2.6)
  dev.off()
}

draw_qq <- function(filename, panel, observed) {
  observed <- sort(observed)
  theoretical <- qnorm(ppoints(length(observed)))
  quartiles_y <- quantile(observed, c(0.25, 0.75), names = FALSE)
  quartiles_x <- qnorm(c(0.25, 0.75))
  slope <- diff(quartiles_y) / diff(quartiles_x)
  intercept <- quartiles_y[[1L]] - slope * quartiles_x[[1L]]

  open_png(filename)
  plot(
    theoretical, observed,
    pch = 21, bg = adjustcolor(blue, alpha.f = 0.70), col = blue,
    cex = 1.05, lwd = 1.1,
    xlab = "Theoretische normale kwantielen",
    ylab = "Geobserveerde residukwantielen",
    main = paste0("Figuur ", panel, ": normaliteit")
  )
  abline(intercept, slope, col = red, lwd = 2.2)
  dev.off()
}

draw_vif <- function(filename, panel, values) {
  open_png(filename)
  positions <- barplot(
    values,
    names.arg = c("Predictor X1", "Predictor X2"),
    col = c(blue, "#5AA9E6"), border = NA,
    ylim = c(0, 12),
    ylab = "VIF",
    main = paste0("Figuur ", panel, ": multicollineariteit")
  )
  abline(h = 10, col = red, lty = 2, lwd = 2)
  text(positions, values + 0.35, labels = format(values, nsmall = 1), col = dark, font = 2)
  text(max(positions), 10.35, "probleemgrens 10", pos = 2, col = red, cex = 0.83)
  dev.off()
}

set.seed(12011)
n <- 72L
fitted <- seq(25, 75, length.out = n)

# Lineariteit: A is passend; B bevat een duidelijke U-vorm.
residuals_a <- rnorm(n, mean = 0, sd = 4.2)
residuals_b <- 0.017 * (fitted - 50)^2 - 4.3 + rnorm(n, mean = 0, sd = 2.6)
draw_residual_plot("resfit_a.png", "A", residuals_a, fitted)
draw_residual_plot("resfit_b.png", "B", residuals_b, fitted)

# Homoscedasticiteit: A heeft toenemende spreiding; B blijft ongeveer constant.
spread_a <- pmax(0.05, 0.35 + 0.027 * (fitted - 25) + rnorm(n, 0, 0.16))
spread_b <- pmax(0.05, 1.00 + rnorm(n, 0, 0.19))
draw_scale_location("scaleloc_a.png", "A", spread_a, fitted)
draw_scale_location("scaleloc_b.png", "B", spread_b, fitted)

# Normaliteit: beide figuren tonen een andere systematische afwijking.
p <- ppoints(n)
qq_heavy_tails <- as.numeric(scale(qt(p, df = 2.4)))
qq_right_skew <- as.numeric(scale(qexp(p, rate = 1)))
draw_qq("qq_a.png", "A", qq_heavy_tails)
draw_qq("qq_b.png", "B", qq_right_skew)

# Multicollineariteit: beide modellen blijven onder de afgesproken probleemgrens.
draw_vif("vif_a.png", "A", c(2.4, 3.1))
draw_vif("vif_b.png", "B", c(4.2, 4.8))

message("Acht diagnostische PNG-bestanden gegenereerd.")

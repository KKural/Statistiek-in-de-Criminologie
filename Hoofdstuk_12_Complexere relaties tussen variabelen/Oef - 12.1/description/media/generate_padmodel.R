args <- commandArgs(trailingOnly = FALSE)
file_arg <- sub("^--file=", "", args[grepl("^--file=", args)])
script_dir <- if (length(file_arg)) dirname(normalizePath(file_arg[[1L]])) else getwd()
output_file <- file.path(script_dir, "padmodel.png")

png(output_file, width = 1500, height = 820, res = 140, bg = "white")
par(mar = c(0.4, 0.4, 0.8, 0.4), xpd = NA, family = "sans")
plot.new()
plot.window(xlim = c(0, 12), ylim = c(0, 7), asp = 1)

edge_colour <- "#23445D"
draw_edge <- function(x0, y0, x1, y1) {
  arrows(x0, y0, x1, y1, length = 0.10, angle = 22, code = 2,
         lwd = 2.2, col = edge_colour)
}
draw_path <- function(x, y) {
  if (length(x) > 2L) lines(x[-length(x)], y[-length(y)], lwd = 2.2,
                             col = edge_colour)
  arrows(x[length(x) - 1L], y[length(y) - 1L], x[length(x)], y[length(y)],
         length = 0.10, angle = 22, code = 2, lwd = 2.2, col = edge_colour)
}
draw_coefficient <- function(x, y, label) {
  width <- max(0.55, 0.12 * nchar(label) + 0.25)
  rect(x - width / 2, y - 0.20, x + width / 2, y + 0.20,
       col = "white", border = "#8AA0AE", lwd = 1.2)
  text(x, y, label, cex = 0.85, font = 2, col = "#172B3A")
}
draw_ellipse <- function(x, y, width, height, label, fill) {
  angle <- seq(0, 2 * pi, length.out = 240L)
  polygon(x + width / 2 * cos(angle), y + height / 2 * sin(angle),
          col = fill, border = "#23445D", lwd = 2)
  text(x, y, label, cex = 0.88, font = 2, col = "#172B3A")
}
draw_box <- function(x, y, width, height, label, fill) {
  rect(x - width / 2, y - height / 2, x + width / 2, y + height / 2,
       col = fill, border = "#23445D", lwd = 2)
  text(x, y, label, cex = 0.88, font = 2, col = "#172B3A")
}

title("Padmodel: empathie, morele intuities en moreel oordeel",
      cex.main = 1.25, col.main = "#172B3A", line = -0.1)

# Paden worden eerst getekend, zodat knooppunten de lijnuiteinden netjes afdekken.
draw_edge(2.05, 5.45, 3.15, 5.65)                         # bezorgdheid -> individualiserend
draw_edge(2.00, 1.60, 3.30, 5.15)                         # perspectief -> individualiserend
draw_edge(2.05, 5.10, 3.35, 1.95)                         # bezorgdheid -> groepsgericht
draw_edge(2.05, 1.45, 3.15, 1.35)                         # perspectief -> groepsgericht
draw_edge(5.15, 5.65, 6.25, 5.45)                         # individualiserend -> schuld
draw_edge(5.15, 1.35, 6.25, 1.65)                         # groepsgericht -> boosheid
draw_edge(8.35, 5.20, 9.55, 3.85)                         # schuld -> oordeel
draw_edge(8.35, 1.80, 9.55, 3.15)                         # boosheid -> oordeel
draw_path(c(2.00, 2.45, 5.75, 6.25), c(5.85, 6.55, 6.55, 5.80)) # direct bezorgdheid -> schuld
draw_path(c(2.00, 4.80, 5.75, 6.25), c(1.85, 3.55, 3.55, 4.95)) # direct perspectief -> schuld

draw_coefficient(2.58, 5.76, "0.48***")
draw_coefficient(2.72, 3.82, "0.21***")
draw_coefficient(2.72, 3.05, "0.21***")
draw_coefficient(2.58, 1.22, "-0.11**")
draw_coefficient(5.70, 5.78, "0.18***")
draw_coefficient(5.72, 1.38, "0.30***")
draw_coefficient(8.92, 4.78, "0.24***")
draw_coefficient(8.90, 2.20, "0.48***")
draw_coefficient(4.35, 6.72, "0.34***")
draw_coefficient(4.80, 3.75, "0.18***")

draw_ellipse(1.20, 5.45, 1.65, 0.92, "Empathische\nbezorgdheid", "#D7EAF7")
draw_ellipse(1.20, 1.50, 1.65, 1.02, "Empathische\nperspectiefneming", "#D7EAF7")
draw_ellipse(4.15, 5.65, 2.00, 1.02, "Morele intuities\n(individualiserend)", "#FFF0C2")
draw_ellipse(4.15, 1.35, 2.00, 1.02, "Morele intuities\n(groepsgericht)", "#FFF0C2")
draw_box(7.30, 5.35, 1.95, 1.02, "Geanticipeerde\nschuld", "#DFF2D8")
draw_box(7.30, 1.70, 1.95, 0.92, "Morele boosheid", "#DFF2D8")
draw_box(10.55, 3.50, 2.05, 1.22, "Moreel oordeel\n(stelen is OK)", "#FAD8D3")

text(4.15, 6.35, "Verklaard: 38%", cex = 0.84, font = 2, col = "#35586D")
text(4.15, 0.62, "Verklaard: 2%", cex = 0.84, font = 2, col = "#35586D")
text(7.30, 6.05, "Verklaard: 24%", cex = 0.84, font = 2, col = "#35586D")
text(7.30, 1.05, "Verklaard: 14%", cex = 0.84, font = 2, col = "#35586D")
text(10.55, 4.32, "Verklaard: 43%", cex = 0.84, font = 2, col = "#35586D")

text(1.20, 0.42, "Exogene variabelen", cex = 0.76, col = "#35586D")
text(5.70, 0.42, "Intermediaire variabelen", cex = 0.76, col = "#35586D")
text(10.55, 2.58, "Uiteindelijke uitkomst", cex = 0.76, col = "#35586D")

dev.off()

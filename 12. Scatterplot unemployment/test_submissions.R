# Basic correct solution
plot(werkloosheid, criminaliteitscijfers)

# Solution with named parameters
# plot(x = werkloosheid, y = criminaliteitscijfers)

# Solution with reversed variables
# plot(criminaliteitscijfers, werkloosheid)

# Solution with all options
# plot(werkloosheid, criminaliteitscijfers, 
#      main = "Verband tussen werkloosheid en criminaliteit",
#      xlab = "Werkloosheidspercentage", 
#      ylab = "Criminaliteitscijfers per 1.000 inwoners",
#      col = "blue", pch = 19)

# Formula syntax
# plot(criminaliteitscijfers ~ werkloosheid)

# Plot with additional styling
# plot(werkloosheid, criminaliteitscijfers)
# title(main = "Verband tussen werkloosheid en criminaliteit", 
#       xlab = "Werkloosheidspercentage", 
#       ylab = "Criminaliteitscijfers per 1.000 inwoners")

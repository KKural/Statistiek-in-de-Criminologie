# Frequentietabel - Energiedrankjes consumptie
# 
# Instructies:
# 1. Bekijk de frequentietabel in de opgave zorgvuldig
# 2. Beantwoord alle 6 vragen 
# 3. Sla je antwoorden op in de vector 'antwoorden'

# Gegeven frequentietabel:
# | Categorie | Absolute frequentie | Cumulatieve absolute frequentie | Proportie | Cumulatieve proportie |
# |-----------|---------------------|--------------------------------|-----------|----------------------|
# | Nooit     | 190                 | 190                            | 0,6129    | 0,6129               |
# | Zelden    | 35                  | 225                            | 0,1129    | 0,7258               |
# | Af en toe | 20                  | 245                            | 0,0645    | 0,7903               |
# | Dikwijls  | 10                  | 255                            | 0,0323    | 0,8226               |
# | Zeer vaak | 55                  | 310                            | 0,1774    | 1                    |
# | N         | 310                 |                                | 1         |                      |

# JOUW ANTWOORDEN HIER:
# Vraag 1: Hoeveel studenten drinken "dikwijls" energiedrankjes?
vraag1 <- # Vul hier je antwoord in

# Vraag 2: Hoeveel procent is dat?
vraag2 <- # Vul hier je antwoord in (bijvoorbeeld 3.23)

# Vraag 3: Hoeveel procent drinkt zelden of nooit energiedrankjes?
vraag3 <- # Vul hier je antwoord in (bijvoorbeeld 72.58)

# Vraag 4: Welke proportie drinkt minstens "dikwijls" energiedrankjes?
vraag4 <- # Vul hier je antwoord in (bijvoorbeeld 0.2097)

# Vraag 5: Effect missing data - welk antwoord (1, 2, 3, of 4)?
vraag5 <- # Vul hier je antwoord in (1, 2, 3 of 4)

# Vraag 6: Hoeveel drinken hoogstens "af en toe" energiedrankjes?
vraag6 <- # Vul hier je antwoord in

# Combineer alle antwoorden in één vector (NIET VERANDEREN)
antwoorden <- c(vraag1, vraag2, vraag3, vraag4, vraag5, vraag6)

# Controleer je antwoorden
print("Je antwoorden:")
print(paste("1.", vraag1, "studenten"))
print(paste("2.", vraag2, "%"))
print(paste("3.", vraag3, "%"))
print(paste("4.", vraag4, "(proportie)"))
print(paste("5.", vraag5, "(welk scenario)"))
print(paste("6.", vraag6, "studenten"))
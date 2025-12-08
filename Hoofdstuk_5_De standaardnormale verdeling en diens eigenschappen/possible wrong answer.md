# Possible Wrong Answers - Chapter 5 Exercises

This document contains common incorrect answers for testing the diagnostic feedback systems in Chapter 5 exercises.

---

## Exercise 5.1 - Traffic Fine Probability (Normal Distribution)

### Question A - Detailed Steps

#### z1_a (correct answer: -3)
- `3` → sign error
- `-22.5` → forgot to divide by σ
- `22.5` → forgot division and wrong sign
- `-0.4` → divided by wrong value

#### z2_a (correct answer: -2.33)
- `2.33` → sign error
- `-17.5` → forgot to divide by σ
- `-0.31` → divided by wrong value

#### p_z1_a (correct answer: 0.0013)
- `0.9987` → complement error
- `0.13` → percentage instead of decimal
- `1.3` → comma/dot confusion

#### p_z2_a (correct answer: 0.0099)
- `0.9901` → complement error
- `0.99` → percentage instead of decimal
- `9.9` → comma/dot confusion

#### verschil_a (correct answer: 0.0086)
- `-0.0086` → wrong order subtraction
- `0.0112` → added instead of subtracted
- `0.0013` → used only first probability
- `0.0099` → used only second probability

### Final Answers

#### vraag_a (correct answer: 0.86)
- `0.0086` → forgot to convert to percentage
- `86` → multiplied by 100 too many times
- `0.13` → calculation error

#### vraag_b (correct answer: 8.08)
- `0.0808` → correct probability but not converted to percentage
- `91.92` → complement error - calculated P(X > 32)
- `80.8` → multiplied by 100 twice

#### vraag_c (correct answer: 96.41)
- `0.9641` → correct probability but not converted to percentage
- `3.59` → forgot to take complement
- `103.59` → added instead of taking complement
- `964.1` → multiplied by 100 twice

**Note:** These should trigger all the different diagnostic messages in the feedback system!

---

## Exercise 5.4 - Trappist Beer Quality Control (N(33,2))

### Question A - P(32 ≤ X ≤ 34) (correct answer: 38.30%)

#### Common Wrong Answers:
- `0.3830` → correct probability but not converted to percentage
- `0.383` → correct probability, not converted, slight rounding
- `61.70` → complement error - calculated 100% - 38.30%
- `0.6170` → complement as decimal
- `19.15` → used only one tail (half the interval)
- `76.60` → doubled the correct answer
- `68.30` → confused with empirical rule percentages
- `50.00` → assumed symmetric around mean
- `-38.30` → negative percentage (impossible)
- `138.30` → added instead of proper calculation

### Question B - P(X > 35) (correct answer: 15.87%)

#### Common Wrong Answers:
- `0.1587` → correct probability but not converted to percentage
- `84.13` → complement error - calculated P(X ≤ 35) instead of P(X > 35)
- `0.8413` → complement as decimal
- `31.74` → doubled the correct answer
- `7.935` → used half value
- `50.00` → assumed 50% for anything above mean
- `34.13` → used wrong Z-table value
- `68.27` → confused with empirical rule
- `-15.87` → negative percentage (impossible)
- `115.87` → calculation error

### Testing Values for Diagnostic System:

**For vraag_a:**
```r
vraag_a <- 0.3830    # Should trigger: "decimaalvorm" message
vraag_a <- 61.70     # Should trigger: "complementaire kans" message  
vraag_a <- 0.6170    # Should trigger: "complementaire kans" message
vraag_a <- -5        # Should trigger: "kleiner dan 0%" message
vraag_a <- 150       # Should trigger: "groter dan 100%" message
vraag_a <- 25.5      # Should trigger: generic wrong answer message
```

**For vraag_b:**
```r
vraag_b <- 0.1587    # Should trigger: "decimaalvorm" message
vraag_b <- 84.13     # Should trigger: "P(X ≤ 35) in plaats van P(X > 35)" message
vraag_b <- 0.8413    # Should trigger: "P(X ≤ 35) in plaats van P(X > 35)" message  
vraag_b <- -10       # Should trigger: "kleiner dan 0%" message
vraag_b <- 120       # Should trigger: "groter dan 100%" message
vraag_b <- 25.0      # Should trigger: generic wrong answer message
```

---

## Exercise 5.2 - [To be added]

*Reserved for Exercise 5.2 possible wrong answers*

---

## Exercise 5.3 - [To be added]

*Reserved for Exercise 5.3 possible wrong answers*

---

## Additional Exercises - [To be added]

*Reserved for future exercises in Chapter 5*
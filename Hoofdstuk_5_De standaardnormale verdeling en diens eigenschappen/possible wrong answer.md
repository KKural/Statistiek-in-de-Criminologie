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

## Exercise 5.2 - Football Academy Scores N(75, 10)

### Question A - Z-scores for 65% and 80% (correct answers: -1.0 and 0.5)

#### Common Wrong Answers for Z-score 65%:
- `1.0` → sign error (forgot negative)
- `-10` → forgot to divide by σ
- `10` → forgot division and wrong sign
- `-0.1` → divided by wrong value (100 instead of 10)
- `0.1` → wrong value and sign
- `-65` → used raw score without transformation

#### Common Wrong Answers for Z-score 80%:
- `-0.5` → sign error
- `5` → forgot to divide by σ
- `-5` → forgot division, wrong sign
- `0.05` → divided by wrong value
- `80` → used raw score without transformation

### Question B - Percentage between 65% and 79% (correct answer: 53.28%)

#### Common Wrong Answers:
- `0.5328` → correct probability but not converted to percentage
- `46.72` → complement error - calculated outside the interval
- `0.4672` → complement as decimal
- `26.64` → used only one tail (half the interval)
- `106.56` → doubled the correct answer
- `68.26` → confused with empirical rule (68% within 1σ)
- `50.00` → assumed 50% for central region
- `-53.28` → negative percentage (impossible)
- `153.28` → calculation error

### Question C - Percentage 80% or higher (correct answer: 30.85%)

#### Common Wrong Answers:
- `0.3085` → correct probability but not converted to percentage
- `69.15` → complement error - calculated P(X ≤ 80) instead of P(X > 80)
- `0.6915` → complement as decimal
- `61.70` → doubled the correct answer
- `15.425` → used half value
- `50.00` → assumed 50% above mean
- `84.13` → used wrong Z-table value
- `-30.85` → negative percentage (impossible)
- `130.85` → calculation error

---

## Exercise 5.3 - Anesthesia Risk Analysis (correct answer: 2 = 0.9%)

### Multiple Choice Analysis - Mortality Risk

#### Common Wrong Choice Patterns:

**Choice 1 (0.3%) - Too Low:**
- Used wrong Z-value for 92% (possibly Z = 1.645 for 95% instead of Z = 1.405)
- Calculation error in effective dose (got ~52 mg instead of ~57.6 mg)
- Wrong Z-table lookup for mortality calculation
- Used P(Z ≥ z) instead of P(Z ≤ z) for lethal distribution

**Choice 2 (0.9%) - CORRECT:**
- Step 1: Z₉₂% = 1.405 → X = 1.405×9+45 = 57.65 mg
- Step 2: Z = (57.65-100)/18 = -2.36 → P(Z ≤ -2.36) = 0.0091 = 0.9%

**Choice 3 (1.4%) - Too High:**
- Used Z = 1.645 for 95% instead of Z = 1.405 for 92%
- Calculation errors in dose conversion
- Wrong complement calculation (used 1 + P instead of P)
- Confused percentiles (used 95% instead of 92%)

**Choice 4 (2.8%) - Much Too High:**
- Double-counting error somewhere in calculation
- Used wrong Z-table section (possibly positive instead of negative)
- Used P(|Z| ≥ 2.36) instead of P(Z ≤ -2.36)
- Calculation error: approximately double the correct answer

### Testing Values for Diagnostic System:

```r
evaluationResult <- 1    # Should trigger: "Te laag - controleer Z-waarde en dose berekening"
evaluationResult <- 2    # Should trigger: "Correct! 0.9% mortality risk"  
evaluationResult <- 3    # Should trigger: "Te hoog - mogelijk 95% gebruikt i.p.v. 92%"
evaluationResult <- 4    # Should trigger: "Veel te hoog - dubbeltelling of verkeerde Z-tabel"
```

### Detailed Wrong Answer Patterns:

#### Step 1 Errors (Effective Dose Calculation):
- `52.0 mg` → Used Z = 1.645 (95%) instead of Z = 1.405 (92%)
- `60.0 mg` → Arithmetic error in Z×σ calculation
- `45.0 mg` → Forgot to add mean (only calculated Z×σ)
- `62.6 mg` → Used wrong Z-value from table

#### Step 2 Errors (Mortality Calculation):
- `2.8%` → Used P(|Z| ≥ 2.36) (two-tailed) instead of P(Z ≤ -2.36)
- `97.2%` → Complement error: calculated P(Z ≥ -2.36) = 1 - 0.0091
- `1.4%` → Wrong Z-table lookup or interpolation error
- `0.3%` → Combined errors from both steps

---

## Additional Exercises - [To be added]

*Reserved for future exercises in Chapter 5*
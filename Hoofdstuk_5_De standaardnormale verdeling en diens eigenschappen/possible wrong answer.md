# Chapter 5 - Common Wrong Answers & Diagnostic Testing

This document contains systematically organized incorrect answers for testing the diagnostic feedback systems in Chapter 5 exercises.

---

## 📊 Error Pattern Categories

### 1. **Z-Score Calculation Errors**
- Sign errors (positive instead of negative)
- Formula errors (forgot to subtract μ, forgot to divide by σ)
- Decimal/percentage confusion
- Wrong denominator usage

### 2. **Probability Calculation Errors**  
- Complement errors (calculated 1-P instead of P)
- Percentage vs decimal confusion
- Wrong tail calculations
- Z-table lookup mistakes

### 3. **Interval Probability Errors**
- Used only one boundary (single tail instead of interval)
- Added probabilities instead of subtracting
- Complement of interval instead of interval itself

### 4. **Percentage Conversion Errors**
- Forgot to multiply by 100
- Multiplied by 100 twice
- Negative percentages (impossible values)
- Percentages > 100% (impossible values)

---

## 🎯 Exercise 5.1 - Traffic Fine Probability N(22.5, 7.5)

**Correct Answers:** vraag_a = 0.86%, vraag_b = 8.08%, vraag_c = 96.41%

### Common Wrong Answers by Type:

#### **Z-Score Errors:**
```r
# For z1_a (correct: -3.0)
z1_a <- 3.0      # Sign error
z1_a <- -22.5    # Forgot to divide by σ  
z1_a <- -0.4     # Wrong denominator

# For z2_a (correct: -2.33)  
z2_a <- 2.33     # Sign error
z2_a <- -17.5    # Forgot to divide by σ
z2_a <- -0.31    # Wrong denominator
```

#### **Probability & Final Answer Errors:**
```r
# Question A (correct: 0.86%)
vraag_a <- 0.0086    # Forgot percentage conversion
vraag_a <- 86.0      # Multiplied by 100 twice
vraag_a <- -0.86     # Negative percentage (impossible)

# Question B (correct: 8.08%)
vraag_b <- 0.0808    # Forgot percentage conversion  
vraag_b <- 91.92     # Complement error
vraag_b <- 808.0     # Multiplied by 100 twice

# Question C (correct: 96.41%)
vraag_c <- 0.9641    # Forgot percentage conversion
vraag_c <- 3.59      # Complement error
vraag_c <- 103.59    # Invalid percentage > 100%
```

---

## 🍺 Exercise 5.2 - Football Academy Selection N(75, 10)

**Correct Answers:** z_65 = -1.0, z_80 = 0.5, percentage_trainen = 53.28%, percentage_spelen = 30.85%, aantal_trainen = 27, aantal_spelen = 15

### Common Wrong Answers by Question:

#### **A. Z-Score Calculations:**
```r
# Z-score for 65% (correct: -1.0)
z_65 <- 1.0      # Sign error (most common)
z_65 <- -10.0    # Forgot to divide by σ
z_65 <- 6.5      # Used X/σ instead of (X-μ)/σ  
z_65 <- 0.65     # Decimal confusion (65% → 0.65)

# Z-score for 80% (correct: 0.5)
z_80 <- -0.5     # Sign error
z_80 <- 5.0      # Forgot to divide by σ
z_80 <- 8.0      # Used X/σ instead of (X-μ)/σ
```

#### **B. Training Percentage 65-79% (correct: 53.28%):**
```r
percentage_trainen <- 0.5328     # Forgot percentage conversion
percentage_trainen <- 84.13      # Complement error (outside interval)
percentage_trainen <- 65.54      # Only upper tail P(Z≤0.4)
percentage_trainen <- 15.87      # Only lower tail P(Z≤-1.0)
percentage_trainen <- 68.0       # Empirical rule confusion
```

#### **C. Playing Percentage ≥80% (correct: 30.85%):**
```r  
percentage_spelen <- 0.3085      # Forgot percentage conversion
percentage_spelen <- 69.15       # Wrong tail P(Z≤0.5) instead of P(Z≥0.5)
percentage_spelen <- 50.0        # Assumed 50% above mean
percentage_spelen <- 15.87       # Used wrong Z-score
```

#### **D. Player Counts (correct: 27 trainen, 15 spelen):**
```r
aantal_trainen <- 26        # Correct calculation but rounded down
aantal_spelen <- 15         # Usually correct if percentages right
```

---

## 🍺 Exercise 5.4 - Trappist Beer Quality Control N(33, 2)

**Correct Answers:** vraag_a = 38.30%, vraag_b = 15.87%

### Common Wrong Answers by Question:

#### **A. Interval P(32 ≤ X ≤ 34) (correct: 38.30%):**
```r
vraag_a <- 0.3830      # Correct but forgot percentage conversion
vraag_a <- 61.70       # Complement error (100% - 38.30%)
vraag_a <- 0.6170      # Complement as decimal
vraag_a <- 19.15       # Half interval (single tail)
vraag_a <- 76.60       # Double counting error
vraag_a <- 68.30       # Empirical rule confusion  
vraag_a <- 50.0        # Assumed symmetry
vraag_a <- -38.30      # Negative percentage (impossible)
vraag_a <- 138.30      # > 100% (impossible)
```

#### **B. Right Tail P(X > 35) (correct: 15.87%):**
```r
vraag_b <- 0.1587      # Correct but forgot percentage conversion
vraag_b <- 84.13       # Complement error P(X≤35) instead of P(X>35)
vraag_b <- 0.8413      # Complement as decimal
vraag_b <- 31.74       # Double counting
vraag_b <- 50.0        # Assumed 50% above mean
vraag_b <- -15.87      # Negative percentage (impossible)
vraag_b <- 115.87      # > 100% (impossible)
```

---

## 💊 Exercise 5.3 - Anesthesia Risk Analysis (Multiple Choice)

**Correct Answer:** Choice 2 (0.9% mortality risk)

### Wrong Answer Patterns by Choice:

#### **Choice 1 (0.3%) - Too Low:**
```
Error Pattern: Used wrong Z-value for 92% effectiveness
- Possibly used Z = 1.645 (95% percentile) instead of Z = 1.405 (92%)
- Effective dose calculation: ~52 mg instead of ~57.6 mg  
- Wrong Z-table lookup for mortality calculation
```

#### **Choice 3 (1.4%) - Too High:**
```
Error Pattern: Percentile confusion or calculation errors
- Used Z = 1.645 for 95% instead of Z = 1.405 for 92%
- Wrong complement calculation
- Dose conversion errors
```

#### **Choice 4 (2.8%) - Much Too High:**  
```
Error Pattern: Major calculation error
- Double-counting somewhere in process
- Used two-tailed probability P(|Z| ≥ 2.36) instead of P(Z ≤ -2.36)
- Wrong Z-table section (positive instead of negative)
```

### Detailed Step-by-Step Errors:

#### **Step 1: Effective Dose Calculation (correct: ~57.6 mg)**
```r
# Wrong effective doses that lead to wrong answers:
dose <- 52.0    # Used Z = 1.645 instead of 1.405  
dose <- 60.0    # Arithmetic error in calculation
dose <- 45.0    # Forgot to add mean (only Z×σ)
dose <- 62.6    # Wrong Z-table interpolation
```

#### **Step 2: Mortality Risk Calculation (correct: 0.9%)**
```r
# Wrong mortality calculations:
mortality <- 2.8     # Two-tailed error P(|Z| ≥ 2.36)
mortality <- 97.2    # Complement error P(Z ≥ -2.36) 
mortality <- 1.4     # Wrong Z-table lookup
mortality <- 0.3     # Combined errors from both steps
```

---

## 🎯 Exercise 5.5 - Prison Population Age Analysis (Multiple Choice)

**Correct Answer:** Choice B (26 years - 75th percentile threshold)

### Wrong Answer Patterns by Choice:

#### **Choice A (25 years) - Too Low:**
```
Error Pattern: Approximation or rounding error
- Used Z ≈ 0.67 instead of exact Z = 0.6745
- Minor calculation error in age conversion
- Rounded intermediate results too early
```

#### **Choice C (27 years) - Too High:**  
```
Error Pattern: Wrong percentile or Z-value
- Possibly confused 75th with 80th percentile
- Used approximate Z = 0.84 instead of 0.6745
- Calculation error in final conversion
```

#### **Choice D (28 years) - Much Too High:**
```  
Error Pattern: Major calculation error
- Wrong percentile interpretation
- Used Z = 1.0 or higher
- Sign error in calculation
```

---

## 📋 Testing Protocol for Diagnostic Systems

### **Exercise 5.1 Test Values:**
```r
# Test all major error patterns:
vraag_a <- 0.0086    # Percentage conversion error
vraag_a <- -0.86     # Negative percentage (impossible) 
vraag_a <- 860       # Multiplication error

vraag_b <- 91.92     # Complement error
vraag_c <- 3.59      # Complement error  
vraag_c <- 964.1     # Double multiplication
```

### **Exercise 5.2 Test Values:**
```r  
# Z-score errors:
z_65 <- 1.0          # Sign error (most common)
z_65 <- -10.0        # Division error

# Percentage errors:
percentage_trainen <- 84.13   # Complement error
percentage_spelen <- 69.15    # Wrong tail error
```

### **Exercise 5.4 Test Values:**
```r
# Comprehensive error testing:
vraag_a <- 0.3830    # Decimal vs percentage
vraag_a <- 61.70     # Complement error
vraag_a <- -38.30    # Impossible negative
vraag_a <- 138.30    # Impossible > 100%

vraag_b <- 84.13     # Wrong tail  
vraag_b <- 0.1587    # Decimal vs percentage
```

### **Multiple Choice Test Values:**
```r
# Exercise 5.3:
evaluationResult <- 1    # Too low (wrong Z-value)
evaluationResult <- 3    # Too high (percentile confusion)  
evaluationResult <- 4    # Much too high (major error)

# Exercise 5.5:
evaluationResult <- 1    # Approximation error
evaluationResult <- 3    # Wrong percentile
evaluationResult <- 4    # Major calculation error
```

---

## 🔍 Error Pattern Summary

| **Error Type** | **Common in** | **Diagnostic Keywords** |
|---|---|---|
| Sign errors | Z-scores | "negatief/positief", "onder/boven gemiddelde" |
| Division omitted | Z-scores | "vergat delen door σ" |
| Complement errors | All percentages | "complement", "verkeerde staart" |
| Decimal/% confusion | Final answers | "vermenigvuldig met 100", "decimaal" |
| Interval errors | 5.2, 5.4 | "interval", "beide grenzen" |
| Impossible values | All | "tussen 0% en 100%", "kans kan niet" |
| Empirical rule confusion | Intervals | "68-95-99.7", "empirische regel" |
| Table lookup errors | All | "Z-tabel", "verkeerde waarde" |

This organization provides clear testing pathways for all diagnostic feedback systems!
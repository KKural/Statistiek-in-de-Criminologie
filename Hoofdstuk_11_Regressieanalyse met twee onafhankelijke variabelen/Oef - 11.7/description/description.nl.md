Beantwoord de volgende **vaste meerkeuzevragen** over de interpretatie van meervoudige regressie.

Vul voor elke vraag het nummer van je antwoord in (bijv. `vraag1 <- 2`).

---

## **Vragen**

**1) Wat is het verschil tussen een voorspelde waarde (`Ŷ`) en een residu (`e`)?**

1. `Ŷ` is het geobserveerde gemiddelde, residu is de standaardfout
2. `Ŷ` is de door het model voorspelde score, residu is `Y - Ŷ`
3. `Ŷ` is altijd groter dan `Y`, residu altijd positief
4. Er is geen verschil; beide betekenen hetzelfde


---

**2) Wat betekent het als het 95%-betrouwbaarheidsinterval van een coëfficiënt de 0 bevat?**

1. Het effect is zeker positief
2. Het effect is zeker negatief
3. Het effect is op 5%-niveau niet statistisch significant
4. Het model is ongeldig


---

**3) Wat betekent een niet-significante regressiecoëfficiënt?**

1. Dat de predictor nooit relevant kan zijn
2. Dat er onvoldoende statistisch bewijs is voor een effect verschillend van 0 (gegeven het model)
3. Dat de data fout zijn ingevoerd
4. Dat de predictor verwijderd moet worden uit elk model


---

**4) Kan een niet-significante predictor toch nuttig zijn?**

1. Nee, nooit
2. Ja, bijvoorbeeld als controlevariabele of bij theoretische relevantie
3. Alleen bij n kleiner dan 30
4. Alleen als R² exact 0.50 is


---

**5) Waarom kunnen regressiecoëfficiënten veranderen wanneer je predictors toevoegt?**

1. Omdat software willekeurig herberekent
2. Omdat elk effect in meervoudige regressie een partieel effect is (gecontroleerd voor andere variabelen)
3. Omdat intercept en hellingen altijd gelijk blijven
4. Omdat standaardisatie verplicht verandert


---

**6) Waarom kan een predictor bivariaat significant zijn, maar niet meer in een multivariaat model?**

1. Door overlap/gedeelde variantie met andere predictors (multicollineariteit of confounding)
2. Omdat p-waarden in multivariaat altijd groter dan .50 zijn
3. Omdat bivariate analyse altijd fout is
4. Omdat R² dan negatief wordt


---

**7) Waarom “straft” adjusted R² extra predictors, maar R² niet?**

1. Adjusted R² corrigeert voor modelcomplexiteit (aantal predictors en steekproefgrootte)
2. Omdat adjusted R² altijd groter is dan R²
3. Omdat R² alleen werkt bij 1 predictor
4. Omdat adjusted R² de intercept verwijdert


---

**8) Wat is de kernbetekenis van multicollineariteit?**

1. Predictors zijn sterk onderling gecorreleerd, waardoor schattingen instabieler en standaardfouten groter kunnen worden
2. Residuen zijn normaal verdeeld
3. Y is perfect voorspeld
4. Er zijn geen outliers


---

**9) Wat betekent ΔR² in modelvergelijking?**

1. Het verschil in verklaarde variantie tussen twee geneste modellen
2. De absolute waarde van het residu
3. Het verschil tussen b en β
4. De p-waarde van het intercept


---

**10) Hoe interpreteer je een ongestandaardiseerde coëfficiënt `b1` ceteris paribus?**

1. Een toename van 1 in `X1` verandert `Y` gemiddeld met `b1`, terwijl andere predictors constant worden gehouden
2. `b1` is de correlatie tussen `X1` en `Y`
3. `b1` is alleen interpreteerbaar als `X1 = 0`
4. `b1` geeft altijd een procentuele verandering


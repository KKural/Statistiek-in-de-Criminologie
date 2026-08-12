context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        2,
        comparator = function(generated, expected, ...) {
          feedbacks <- list(
            "1" = paste0(
              "\u274c Fout. **Waarschijnlijke redenering:** je hebt mogelijk kleine lokale schommelingen in Figuur A ",
              "als een systematische kromming geïnterpreteerd. De LOESS-lijn blijft daar echter nagenoeg horizontaal rond nul.\n\n",
              "**Beslisregel:** een lineariteitsschending blijkt uit een duidelijk systematisch gebogen patroon in de smoother, ",
              "niet uit losse spreiding van residuen.\n\n",
              "**Volgende stap:** vergelijk de rode lijn met de horizontale nullijn. Alleen in Figuur B vormt ze een duidelijke boog.\n\n",
              "**Correct antwoord:** 2"
            ),
            "2" = paste0(
              "\u2705 Juist! **Figuur B** toont een schending van de lineariteitsassumptie. De rode LOESS-smoother ",
              "vertoont een duidelijke boog in de residuen, wat aangeeft dat een rechte lijn het verband ",
              "niet goed beschrijft.\n\n",
              "**Figuur A** is correct: de residuen liggen willekeurig verspreid rond nul \u2014 geen systematisch patroon."
            ),
            "3" = paste0(
              "\u274c Fout. **Waarschijnlijke redenering:** je hebt mogelijk elke zichtbare spreiding rond nul als niet-lineariteit beschouwd. ",
              "Willekeurige spreiding is op zichzelf geen schending.\n\n",
              "**Beslisregel:** beoordeel de vorm van de LOESS-smoother per figuur: ongeveer vlak is passend; systematische kromming wijst op niet-lineariteit.\n\n",
              "**Volgende stap:** beoordeel A en B afzonderlijk. A is nagenoeg vlak; alleen B is duidelijk gebogen.\n\n",
              "**Correct antwoord:** 2"
            ),
            "4" = paste0(
              "\u274c Fout. **Waarschijnlijke redenering:** je hebt mogelijk vooral gekeken of de punten gemiddeld rond nul liggen ",
              "en daardoor de vorm van de rode lijn in Figuur B gemist.\n\n",
              "**Beslisregel:** ook wanneer residuen rond nul liggen, signaleert een systematisch gebogen smoother dat een rechte lijn een patroon mist.\n\n",
              "**Volgende stap:** volg de rode lijn van links naar rechts in B; de duidelijke boog maakt B de schending.\n\n",
              "**Correct antwoord:** 2"
            )
          )
          key <- as.character(generated)
          msg <- feedbacks[[key]] %||% "\u274c Geef een getal tussen 1 en 4 in."
          get_reporter()$add_message(msg, type = "markdown")
          generated == expected
        }
      )
    }
  )
})

context({
  testcase(
    "",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        3, # Correct answer: Q8 from your rotation pattern
        comparator = function(generated, expected, ...) {
          key <- as.character(generated)
          option_feedback <- list(
            "1" = paste0(
              "### **Optie 1**\n\n",
              "**Waarom klopt dit niet?**\n",
              "Een **negatief verband** bewijst niet dat verlichting de daling **veroorzaakt**. **Buurtwelvaart** of **politie-inzet** kan beide variabelen beïnvloeden.\n\n",
              "**Controleer:** Werden de **tijdsvolgorde** en **derde variabelen** onderzocht?\n\n",
              "**Probeer:** Vervang **veroorzaakt** door **hangt samen met**."
            ),
            "2" = paste0(
              "### **Optie 2**\n\n",
              "**Waarom klopt dit niet?**\n",
              "**Omgekeerde causaliteit** is mogelijk, maar niet bewezen. We weten niet welke variabele eerst veranderde.\n\n",
              "**Controleer:** Een mogelijke verklaring is nog geen **aangetoonde verklaring**.\n\n",
              "**Probeer:** Teken beide richtingen: verlichting -> criminaliteit en criminaliteit -> verlichting."
            ),
            "3" = paste0(
              "### **Optie 3**\n\n",
              "**Juist.**\n",
              "Het resultaat toont een **samenhang**, maar bepaalt niet wat de **oorzaak** is. Beide richtingen en **derde variabelen** blijven mogelijk.\n\n",
              "**Onthoud:** Laat de sterkte van je conclusie aansluiten bij de **onderzoeksopzet**.\n\n",
              "**Verdieping:** Welk aanvullend onderzoek kan de **causale richting** bepalen?"
            ),
            "4" = paste0(
              "### **Optie 4**\n\n",
              "**Waarom klopt dit niet?**\n",
              "Ook een **sterke correlatie** kan door een **derde variabele** ontstaan. **Buurtwelvaart** kan bijvoorbeeld samenhangen met meer verlichting en betere criminaliteitspreventie.\n\n",
              "**Controleer:** Correlatiesterkte toont **hoe sterk** variabelen samenhangen, niet **waarom**.\n\n",
              "**Probeer:** Teken **buurtwelvaart** als mogelijke oorzaak van beide variabelen."
            )
          )

          if (!key %in% names(option_feedback)) {
            msg <- paste0(
              "**Controleer je invoer:** je invoer lijkt niet overeen te komen met één van de aangeboden optienummers; dit kan een typefout of een andere invoerinterpretatie zijn.\n\n",
              "**Waarom dit niet klopt:** de evaluator kan alleen een inhoudelijke optie beoordelen wanneer één geldig optienummer is ingevoerd.\n\n",
              "**Denkregel:** koppel eerst elke antwoordoptie aan haar nummer en voer uitsluitend dat ene nummer in.\n\n",
              "**Volgende stap:** lees de opties opnieuw, kies het nummer dat bij je redenering hoort en dien alleen dat nummer in."
            )
          } else {
            msg <- option_feedback[[key]]
          }
          get_reporter()$add_message(msg, type = "markdown")

          generated == expected
        }
      )
    }
  )
})

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
              "### **Optie 1: Rechtstreekse causaliteit**\n\n",
              "> **Meer straatverlichting veroorzaakt minder criminaliteit, omdat de variabelen negatief samenhangen.**\n\n",
              "**Wat je antwoord suggereert**\n\n",
              "Je beschouwt het gevonden **verband** als bewijs dat straatverlichting de daling in criminaliteit heeft **veroorzaakt**.\n\n",
              "**Waarom deze conclusie niet volgt**\n\n",
              "De vergelijking toont niet wat er in dezelfde buurten gebeurd zou zijn zonder extra straatverlichting. We weten ook niet welke variabele eerst veranderde. **Buurtwelvaart**, **politieaanwezigheid** of **publieke investeringen** kunnen zowel meer verlichting als minder criminaliteit veroorzaken. Het onderzoek toont daarom een **samenhang**, maar nog geen **causaal effect**.\n\n",
              "**Controleer je redenering**\n\n",
              "Gebruik het woord **veroorzaakt** alleen wanneer:\n\n",
              "1. De veronderstelde oorzaak eerder plaatsvond.\n",
              "2. Belangrijke derde variabelen werden gecontroleerd.\n",
              "3. Andere causale richtingen werden onderzocht.\n\n",
              "**Herformuleer de conclusie**\n\n",
              "Schrijf de conclusie zonder een causaal werkwoord:\n\n",
              "> \"Meer straatverlichting hangt samen met minder criminaliteit.\"\n\n",
              "Noem daarna één mogelijke **derde variabele**."
            ),
            "2" = paste0(
              "### **Optie 2: Omgekeerde causaliteit**\n\n",
              "> **Meer criminaliteit zorgt ervoor dat overheden extra straatverlichting plaatsen; dit is daarom de juiste richting.**\n\n",
              "**Wat je antwoord suggereert**\n\n",
              "Je herkent **omgekeerde causaliteit** als een mogelijkheid, maar behandelt die mogelijkheid vervolgens als een bewezen verklaring.\n\n",
              "**Waarom deze conclusie niet volgt**\n\n",
              "Hetzelfde verband past bij verschillende verklaringen. Straatverlichting kan criminaliteit beïnvloeden, criminaliteit kan beslissingen over verlichting beïnvloeden, of een **derde variabele** kan beide beïnvloeden. Zonder informatie over de **tijdsvolgorde** kan het onderzoek niet bepalen welke verklaring correct is.\n\n",
              "**Controleer je redenering**\n\n",
              "Een mogelijke causale verklaring is een **hypothese**, geen conclusie. Voor een causale richting is informatie nodig over de **tijdsvolgorde** of over een gerichte interventie.\n\n",
              "**Vergelijk de verklaringen**\n\n",
              "Teken beide mogelijkheden:\n\n",
              "- Straatverlichting -> criminaliteit\n",
              "- Criminaliteit -> straatverlichting\n\n",
              "Vraag vervolgens:\n\n",
              "> **Welke gegevens over veranderingen doorheen de tijd kunnen deze verklaringen van elkaar onderscheiden?**"
            ),
            "3" = paste0(
              "### **Optie 3: Correcte interpretatie**\n\n",
              "> **Straatverlichting en criminaliteit hangen samen, maar het resultaat bepaalt niet welke causale verklaring correct is.**\n\n",
              "**Waarom dit correct is**\n\n",
              "Dit antwoord past bij het beschikbare bewijs. Het beschrijft de gevonden **samenhang** zonder te beweren dat de ene variabele de andere heeft veroorzaakt. Het houdt ook rekening met **omgekeerde causaliteit** en mogelijke **derde variabelen**.\n\n",
              "Het antwoord zegt niet dat causaliteit onmogelijk is. Het zegt dat dit onderzoeksresultaat **onvoldoende bewijs** levert om causaliteit vast te stellen.\n\n",
              "**Controleer je redenering**\n\n",
              "De sterkte van de conclusie moet passen bij de **onderzoeksopzet**:\n\n",
              "- Observationeel verband -> \"hangt samen met\"\n",
              "- Sterke causale onderzoeksopzet -> \"veroorzaakt een verandering in\"\n\n",
              "**Verdiep je redenering**\n\n",
              "Bedenk welk aanvullend onderzoek een sterkere conclusie mogelijk maakt. Vergelijk bijvoorbeeld de verandering in criminaliteit na een gefaseerde invoering van straatverlichting met vergelijkbare buurten die nog geen nieuwe verlichting kregen."
            ),
            "4" = paste0(
              "### **Optie 4: Een sterk verband bewijst causaliteit**\n\n",
              "> **Een sterke samenhang sluit derde variabelen voldoende uit en maakt een causale conclusie betrouwbaar.**\n\n",
              "**Wat je antwoord suggereert**\n\n",
              "Je beschouwt de **sterkte van de correlatie** als bewijs dat het verband causaal moet zijn.\n\n",
              "**Waarom deze conclusie niet volgt**\n\n",
              "De sterkte van een correlatie beschrijft hoe nauw twee variabelen samen veranderen. Ze verklaart niet **waarom** dat gebeurt. Een **derde variabele** kan ook een sterke samenhang veroorzaken.\n\n",
              "Rijkere buurten kunnen bijvoorbeeld investeren in zowel straatverlichting als criminaliteitspreventie. Daardoor kan een sterke samenhang tussen verlichting en criminaliteit ontstaan, zelfs wanneer de verlichting zelf weinig effect heeft.\n\n",
              "**Controleer je redenering**\n\n",
              "De correlatiesterkte beantwoordt:\n\n",
              "> **Hoe sterk hangen de variabelen samen?**\n\n",
              "De onderzoeksopzet beantwoordt:\n\n",
              "> **Waarom hangen de variabelen samen?**\n\n",
              "**Toets een derde verklaring**\n\n",
              "Teken het volgende model:\n\n",
              "- Buurtwelvaart -> meer straatverlichting\n",
              "- Buurtwelvaart -> meer criminaliteitspreventie\n",
              "- Meer criminaliteitspreventie -> minder criminaliteit\n\n",
              "Bepaal daarna of de oorspronkelijke correlatie dit model kan onderscheiden van een rechtstreeks effect van straatverlichting."
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

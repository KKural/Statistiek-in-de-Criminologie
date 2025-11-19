context({
  testcase(
    "Favoriete keuze voor online onderzoek",
    {
      testEqual(
        "Categorisch",
        if(exists("antwoorden") && "favoriete_keuze" %in% names(antwoorden)) {
          tolower(antwoorden$favoriete_keuze)
        } else "niet gevonden",
        "categorisch"
      )
    }
  )
  
  testcase(
    "Leeftijd",
    {
      testEqual(
        "Kwantitatief", 
        if(exists("antwoorden") && "leeftijd" %in% names(antwoorden)) {
          tolower(antwoorden$leeftijd)
        } else "niet gevonden",
        "kwantitatief"
      )
    }
  )
  
  testcase(
    "Geslacht",
    {
      testEqual(
        "Categorisch",
        if(exists("antwoorden") && "geslacht" %in% names(antwoorden)) {
          tolower(antwoorden$geslacht)
        } else "niet gevonden",
        "categorisch"
      )
    }
  )
  
  testcase(
    "Studierichting", 
    {
      testEqual(
        "Categorisch",
        if(exists("antwoorden") && "studierichting" %in% names(antwoorden)) {
          tolower(antwoorden$studierichting)
        } else "niet gevonden",
        "categorisch"
      )
    }
  )
  
  testcase(
    "Label (studentnummer)",
    {
      testEqual(
        "Identificatie",
        if(exists("antwoorden") && "studentnummer" %in% names(antwoorden)) {
          tolower(antwoorden$studentnummer)
        } else "niet gevonden",
        "identificatie"
      )
    }
  )
})
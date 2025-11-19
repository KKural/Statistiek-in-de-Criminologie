context({
  testcase(
    "Favoriete keuze voor online onderzoek",
    {
      testEqual(
        "Nominaal",
        if(exists("favoriete_keuze")) tolower(favoriete_keuze) else "niet gevonden",
        "nominaal"
      )
    }
  )
  
  testcase(
    "Leeftijd",
    {
      testEqual(
        "Ratio", 
        if(exists("leeftijd")) tolower(leeftijd) else "niet gevonden",
        "ratio"
      )
    }
  )
  
  testcase(
    "Geslacht",
    {
      testEqual(
        "Nominaal",
        if(exists("geslacht")) tolower(geslacht) else "niet gevonden",
        "nominaal"
      )
    }
  )
  
  testcase(
    "Studierichting", 
    {
      testEqual(
        "Nominaal",
        if(exists("studierichting")) tolower(studierichting) else "niet gevonden",
        "nominaal"
      )
    }
  )
  
  testcase(
    "Studentnummer",
    {
      testEqual(
        "Nominaal",
        if(exists("studentnummer")) tolower(studentnummer) else "niet gevonden",
        "nominaal"
      )
    }
  )
})
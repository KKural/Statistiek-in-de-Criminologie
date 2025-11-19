context({
  testcase(
    "Favoriete keuze voor online onderzoek",
    {
      testEqual(
        "nominaal",
        if(exists("favoriete_keuze")) tolower(favoriete_keuze) else "niet gevonden"
      )
    }
  )
  
  testcase(
    "Leeftijd",
    {
      testEqual(
        "ratio", 
        if(exists("leeftijd")) tolower(leeftijd) else "niet gevonden"
      )
    }
  )
  
  testcase(
    "Geslacht",
    {
      testEqual(
        "nominaal",
        if(exists("geslacht")) tolower(geslacht) else "niet gevonden"
      )
    }
  )
  
  testcase(
    "Studierichting", 
    {
      testEqual(
        "nominaal",
        if(exists("studierichting")) tolower(studierichting) else "niet gevonden"
      )
    }
  )
  
  testcase(
    "Studentnummer",
    {
      testEqual(
        "nominaal",
        if(exists("studentnummer")) tolower(studentnummer) else "niet gevonden"
      )
    }
  )
})
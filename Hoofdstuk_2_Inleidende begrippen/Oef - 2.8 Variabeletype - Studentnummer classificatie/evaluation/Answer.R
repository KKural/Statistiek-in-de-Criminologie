context({
  testcase(
    "Favoriete keuze voor online onderzoek",
    {
      testEqual(
        expected = "nominaal",
        actual = if(exists("favoriete_keuze")) tolower(favoriete_keuze) else "niet gevonden"
      )
    }
  )
  
  testcase(
    "Leeftijd",
    {
      testEqual(
        expected = "ratio", 
        actual = if(exists("leeftijd")) tolower(leeftijd) else "niet gevonden"
      )
    }
  )
  
  testcase(
    "Geslacht",
    {
      testEqual(
        expected = "nominaal",
        actual = if(exists("geslacht")) tolower(geslacht) else "niet gevonden"
      )
    }
  )
  
  testcase(
    "Studierichting", 
    {
      testEqual(
        expected = "nominaal",
        actual = if(exists("studierichting")) tolower(studierichting) else "niet gevonden"
      )
    }
  )
  
  testcase(
    "Studentnummer",
    {
      testEqual(
        expected = "nominaal",
        actual = if(exists("studentnummer")) tolower(studentnummer) else "niet gevonden"
      )
    }
  )
})
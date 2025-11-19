context({
  testcase(
    description = "Favoriete keuze voor online onderzoek",
    {
      testEqual(
        expected = "nominaal",
        actual = if(exists("favoriete_keuze")) tolower(favoriete_keuze) else "niet gevonden"
      )
    }
  )
  
  testcase(
    description = "Leeftijd",
    {
      testEqual(
        expected = "ratio", 
        actual = if(exists("leeftijd")) tolower(leeftijd) else "niet gevonden"
      )
    }
  )
  
  testcase(
    description = "Geslacht",
    {
      testEqual(
        expected = "nominaal",
        actual = if(exists("geslacht")) tolower(geslacht) else "niet gevonden"
      )
    }
  )
  
  testcase(
    description = "Studierichting", 
    {
      testEqual(
        expected = "nominaal",
        actual = if(exists("studierichting")) tolower(studierichting) else "niet gevonden"
      )
    }
  )
  
  testcase(
    description = "Studentnummer",
    {
      testEqual(
        expected = "nominaal",
        actual = if(exists("studentnummer")) tolower(studentnummer) else "niet gevonden"
      )
    }
  )
})
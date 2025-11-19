context({
  testcase(
    description = "Favoriete keuze voor online onderzoek",
    code = {
      testEqual(
        expected = "nominaal",
        actual = if(exists("favoriete_keuze")) tolower(favoriete_keuze) else "niet gevonden"
      )
    }
  )
  
  testcase(
    description = "Leeftijd",
    code = {
      testEqual(
        expected = "ratio", 
        actual = if(exists("leeftijd")) tolower(leeftijd) else "niet gevonden"
      )
    }
  )
  
  testcase(
    description = "Geslacht",
    code = {
      testEqual(
        expected = "nominaal",
        actual = if(exists("geslacht")) tolower(geslacht) else "niet gevonden"
      )
    }
  )
  
  testcase(
    description = "Studierichting", 
    code = {
      testEqual(
        expected = "nominaal",
        actual = if(exists("studierichting")) tolower(studierichting) else "niet gevonden"
      )
    }
  )
  
  testcase(
    description = "Studentnummer",
    code = {
      testEqual(
        expected = "nominaal",
        actual = if(exists("studentnummer")) tolower(studentnummer) else "niet gevonden"
      )
    }
  )
})
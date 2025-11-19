context({
  testcase({
    testEqual(
      "nominaal",
      if(exists("favoriete_keuze")) tolower(favoriete_keuze) else "niet gevonden"
    )
  })
  
  testcase({
    testEqual(
      "ratio", 
      if(exists("leeftijd")) tolower(leeftijd) else "niet gevonden"
    )
  })
  
  testcase({
    testEqual(
      "nominaal",
      if(exists("geslacht")) tolower(geslacht) else "niet gevonden"
    )
  })
  
  testcase({
    testEqual(
      "nominaal",
      if(exists("studierichting")) tolower(studierichting) else "niet gevonden"
    )
  })
  
  testcase({
    testEqual(
      "nominaal",
      if(exists("studentnummer")) tolower(studentnummer) else "niet gevonden"
    )
  })
})
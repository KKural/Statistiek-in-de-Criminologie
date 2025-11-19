context({
  testcase(
    "Favoriete keuze voor online onderzoek",
    {
      testEqual(
        "Categorisch",
        tolower(favoriete_keuze),
        "categorisch"
      )
    }
  )
  
  testcase(
    "Leeftijd",
    {
      testEqual(
        "Kwantitatief", 
        tolower(leeftijd),
        "kwantitatief"
      )
    }
  )
  
  testcase(
    "Geslacht",
    {
      testEqual(
        "Categorisch",
        tolower(geslacht),
        "categorisch"
      )
    }
  )
  
  testcase(
    "Studierichting", 
    {
      testEqual(
        "Categorisch",
        tolower(studierichting),
        "categorisch"
      )
    }
  )
  
  testcase(
    "Label (studentnummer)",
    {
      testEqual(
        "Identificatie",
        tolower(studentnummer),
        "identificatie"
      )
    }
  )
})
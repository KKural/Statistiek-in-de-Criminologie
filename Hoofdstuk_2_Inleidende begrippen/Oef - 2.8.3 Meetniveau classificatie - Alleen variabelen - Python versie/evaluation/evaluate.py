import json
import sys

# Execute the student's code
try:
    exec(open('solution.py', 'r', encoding='utf-8').read())
except Exception as e:
    print(json.dumps({
        "accepted": False,
        "status": "compilation error",
        "description": f"Fout bij uitvoeren code: {str(e)}"
    }))
    sys.exit(1)

# Check if all required variables exist
required_vars = ['favoriete_keuze', 'leeftijd',
                 'geslacht', 'studierichting', 'studentnummer']
missing_vars = []
for var in required_vars:
    if var not in locals():
        missing_vars.append(var)

if missing_vars:
    print(json.dumps({
        "accepted": False,
        "status": "wrong",
        "description": f"Ontbrekende variabelen: {', '.join(missing_vars)}"
    }))
    sys.exit(1)

# Expected answers
expected = {
    'favoriete_keuze': 'Nominaal',
    'leeftijd': 'Ratio',
    'geslacht': 'Nominaal',
    'studierichting': 'Nominaal',
    'studentnummer': 'Nominaal'
}

# Check answers
wrong_answers = []
for var, expected_value in expected.items():
    actual_value = locals()[var]
    if actual_value != expected_value:
        wrong_answers.append(
            f"{var}: verwacht '{expected_value}', gekregen '{actual_value}'")

if wrong_answers:
    feedback = "Foutieve classificaties:\n" + "\n".join(wrong_answers)
    feedback += "\n\nUitleg:\n"
    feedback += "• favoriete_keuze = Nominaal (categorieën zonder rangorde)\n"
    feedback += "• leeftijd = Ratio (numeriek met echt nulpunt, verhoudingen zinvol)\n"
    feedback += "• geslacht = Nominaal (categorieën zonder hiërarchie)\n"
    feedback += "• studierichting = Nominaal (vakgebieden zonder rangorde)\n"
    feedback += "• studentnummer = Nominaal (identificatielabels)"

    print(json.dumps({
        "accepted": False,
        "status": "wrong",
        "description": feedback
    }))
else:
    print(json.dumps({
        "accepted": True,
        "status": "correct",
        "description": "Alle meetniveaus correct geclassificeerd! Goed gedaan."
    }))

def evaluate_classification():
    """
    Sophisticated evaluation function that provides detailed feedback
    similar to the R version, with markdown formatting support.
    """
    import sys

    # Expected answers (case insensitive)
    expected_answers = {
        'favoriete_keuze': 'nominaal',
        'leeftijd': 'ratio',
        'geslacht': 'nominaal',
        'studierichting': 'nominaal',
        'studentnummer': 'nominaal'
    }

    # Variable display names
    variable_names = {
        'favoriete_keuze': 'Favoriete keuze',
        'leeftijd': 'Leeftijd',
        'geslacht': 'Geslacht',
        'studierichting': 'Studierichting',
        'studentnummer': 'Studentnummer'
    }

    # Check each variable
    results = {}
    all_correct = True

    for var_name, expected in expected_answers.items():
        if var_name in globals():
            student_answer = str(globals()[var_name]).lower().strip()
            results[var_name] = {
                'exists': True,
                'value': globals()[var_name],
                'correct': student_answer == expected,
                'expected': expected.capitalize()
            }
            if not results[var_name]['correct']:
                all_correct = False
        else:
            results[var_name] = {
                'exists': False,
                'value': None,
                'correct': False,
                'expected': expected.capitalize()
            }
            all_correct = False

    # Generate detailed feedback
    feedback_parts = ["## **Resultaten per variabele:**\n"]

    counter = 1
    for var_key in expected_answers.keys():
        var_display = variable_names[var_key]
        result = results[var_key]

        if not result['exists']:
            feedback_parts.append(
                f"{counter}. **{var_display}**: *Ontbreekt* ❌")
        elif result['correct']:
            feedback_parts.append(
                f"{counter}. **{var_display}**: {result['value']} ✅")
        else:
            feedback_parts.append(
                f"{counter}. **{var_display}**: {result['value']} ❌")
        counter += 1

    if all_correct:
        feedback_parts.append(
            "\n✅ **Alle variabelen correct geclassificeerd.**")
        feedback_parts.append(
            "\n**Uitstekend!** Je begrijpt de verschillende meetniveaus goed.")
    else:
        # Add specific feedback for incorrect answers
        incorrect_vars = [k for k, v in results.items() if not v['correct']]
        if incorrect_vars:
            feedback_parts.append(
                "**📚 Uitleg waarom deze antwoorden fout zijn:**")

            for var_key in incorrect_vars:
                result = results[var_key]
                var_display = variable_names[var_key]

                if not result['exists']:
                    feedback_parts.append(
                        f"• **{var_display}**: ❌ Variabele niet gevonden. Vergeet je de variabele te definiëren? Gebruik: `{var_key} = \"{result['expected']}\"`")
                else:
                    student_answer = str(result['value']).lower()
                    feedback_parts.append(get_specific_feedback(
                        var_key, student_answer, var_display))

    # Always add educational content
    feedback_parts.append("**Meetniveaus uitleg:**")
    feedback_parts.append(
        "• **Nominaal**: Categorieën zonder ordening (bijv. kleuren, geslacht)")
    feedback_parts.append(
        "• **Ordinaal**: Categorieën met ordening (bijv. schoolcijfers: slecht < goed < uitstekend)")
    feedback_parts.append(
        "• **Interval**: Getallen met gelijke afstanden, geen echt nulpunt (bijv. temperatuur in °C)")
    feedback_parts.append(
        "• **Ratio**: Getallen met gelijke afstanden én echt nulpunt (bijv. leeftijd, gewicht)")

    # Print the feedback as markdown
    print("\n\n".join(feedback_parts))

    return all_correct


def get_specific_feedback(var_key, student_answer, var_display):
    """Generate specific feedback based on the student's wrong answer"""

    if var_key == 'favoriete_keuze':
        if student_answer == 'ordinaal':
            return f"• **{var_display}**: Je koos 'Ordinaal', maar dit is fout. Ordinaal betekent dat categorieën een rangorde hebben. Google, Bibliotheek, Wikipedia zijn gewoon verschillende keuzes zonder dat één 'beter' is dan de ander → **Nominaal**"
        elif student_answer == 'interval':
            return f"• **{var_display}**: Je koos 'Interval', maar dit is fout. Interval betekent numerieke waarden met gelijke afstanden. Dit zijn categorieën (Google, Bibliotheek, Wikipedia), geen getallen → **Nominaal**"
        elif student_answer == 'ratio':
            return f"• **{var_display}**: Je koos 'Ratio', maar dit is fout. Ratio betekent numerieke waarden met een echt nulpunt. Dit zijn categorieën (Google, Bibliotheek, Wikipedia), geen getallen → **Nominaal**"
        else:
            return f"• **{var_display}**: Google, Bibliotheek, Wikipedia zijn verschillende categorieën zonder rangorde → **Nominaal**"

    elif var_key == 'leeftijd':
        if student_answer == 'nominaal':
            return f"• **{var_display}**: Je koos 'Nominaal', maar dit is fout. Nominaal betekent categorieën zonder ordening. Leeftijd bestaat uit getallen waarmee je kunt rekenen (17, 18, 19 jaar) → **Ratio**"
        elif student_answer == 'ordinaal':
            return f"• **{var_display}**: Je koos 'Ordinaal', maar dit is fout. Ordinaal heeft wel ordening maar geen gelijke afstanden. Leeftijd heeft wel gelijke afstanden (1 jaar verschil is altijd hetzelfde) én een echt nulpunt (0 jaar = geen leeftijd) → **Ratio**"
        elif student_answer == 'interval':
            return f"• **{var_display}**: Je koos 'Interval', maar dit is fout. Interval heeft geen echt nulpunt. Leeftijd heeft wel een echt nulpunt: 0 jaar betekent echt 'geen leeftijd' → **Ratio**"
        else:
            return f"• **{var_display}**: Leeftijd heeft een echt nulpunt (0 jaar = geen leeftijd) en betekenisvolle verhoudingen (20 jaar is twee keer zo oud als 10 jaar) → **Ratio**"

    elif var_key == 'geslacht':
        if student_answer == 'ordinaal':
            return f"• **{var_display}**: Je koos 'Ordinaal', maar dit is fout. Ordinaal betekent dat categorieën een rangorde hebben (bijv. slecht < goed < uitstekend). Man en vrouw hebben geen rangorde - er is geen 'hoger' of 'lager' geslacht → **Nominaal**"
        elif student_answer == 'interval':
            return f"• **{var_display}**: Je koos 'Interval', maar dit is fout. Interval betekent numerieke waarden met gelijke afstanden. Geslacht bestaat uit categorieën (man/vrouw), niet uit getallen → **Nominaal**"
        elif student_answer == 'ratio':
            return f"• **{var_display}**: Je koos 'Ratio', maar dit is fout. Ratio betekent numerieke waarden met een echt nulpunt. Geslacht bestaat uit categorieën (man/vrouw), niet uit getallen → **Nominaal**"
        else:
            return f"• **{var_display}**: Man en vrouw zijn verschillende categorieën zonder rangorde. Er is geen 'hoger' of 'lager' geslacht → **Nominaal**"

    elif var_key == 'studierichting':
        if student_answer == 'ordinaal':
            return f"• **{var_display}**: Je koos 'Ordinaal', maar dit is fout. Ordinaal betekent dat categorieën een rangorde hebben. Statistiek, wiskunde, techniek, Engels hebben geen rangorde - geen richting is 'hoger' dan een andere → **Nominaal**"
        elif student_answer == 'interval':
            return f"• **{var_display}**: Je koos 'Interval', maar dit is fout. Interval betekent numerieke waarden met gelijke afstanden. Studierichtingen zijn categorieën (statistiek, wiskunde, techniek), geen getallen → **Nominaal**"
        elif student_answer == 'ratio':
            return f"• **{var_display}**: Je koos 'Ratio', maar dit is fout. Ratio betekent numerieke waarden met een echt nulpunt. Studierichtingen zijn categorieën (statistiek, wiskunde, techniek), geen getallen → **Nominaal**"
        else:
            return f"• **{var_display}**: Verschillende richtingen zonder rangorde. Geen richting is 'beter' dan een andere → **Nominaal**"

    elif var_key == 'studentnummer':
        if student_answer == 'ordinaal':
            return f"• **{var_display}**: Je koos 'Ordinaal', maar dit is fout. Ordinaal betekent rangorde. Studentnummer 100 is niet 'hoger' of 'beter' dan nummer 50 - het zijn alleen labels → **Nominaal**"
        elif student_answer == 'interval':
            return f"• **{var_display}**: Je koos 'Interval', maar dit is fout. Interval betekent dat je kunt rekenen met de getallen. Je kunt niet zeggen dat student 100 '50 meer' is dan student 50 - het zijn alleen labels → **Nominaal**"
        elif student_answer == 'ratio':
            return f"• **{var_display}**: Je koos 'Ratio', maar dit is fout. Ratio betekent dat verhoudingen betekenis hebben. Student 100 is niet 'twee keer meer' dan student 50 - het zijn alleen labels voor identificatie → **Nominaal**"
        else:
            return f"• **{var_display}**: Nummers 1-552 zijn alleen labels voor identificatie. Student 100 is niet 'twee keer meer' dan student 50 → **Nominaal**"

    return f"• **{var_display}**: Controleer je antwoord en probeer opnieuw."

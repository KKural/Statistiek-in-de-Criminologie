hypothesis = input()

# Check key terms
has_unemployment = any(word in hypothesis.lower() for word in [
                       'werkloosheid', 'werkloos', 'unemployment', 'jobless'])
has_crime = any(word in hypothesis.lower() for word in [
                'criminaliteit', 'crime', 'diefstal', 'inbraak', 'geweld', 'misdrijf', 'eigendom'])
has_relationship = any(word in hypothesis.lower() for word in [
                       'leidt', 'verhoogt', 'vermindert', 'correleert', 'verband', 'relatie'])

if has_unemployment and has_crime and has_relationship and len(hypothesis) > 20:
    print("Goede hypothese! Je hebt een duidelijke relatie beschreven tussen werkloosheid en criminaliteit.")
else:
    print("Je hypothese mist belangrijke elementen. Zorg voor een duidelijke relatie tussen werkloosheid en criminaliteit.")

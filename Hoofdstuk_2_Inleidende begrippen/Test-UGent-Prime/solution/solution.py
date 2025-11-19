# Read all input lines
lines = []
while True:
    try:
        line = input()
        lines.append(line)
    except EOFError:
        break

# Find and report special characters (not . or 8)
for row_num, line in enumerate(lines, 1):
    for col_num, char in enumerate(line, 1):
        if char not in '.8':
            print(
                f"character '{char}' only occurs at row {row_num} and column {col_num}")

def check_brackets(string):
    brackets = []
    for char in string:
        if char in "([{":
            brackets.append(char)
        elif char in ")]}":
            if not brackets:
                return False
            if char == ")" and brackets[-1] != "(":
                return False
            if char == "]" and brackets[-1] != "[":
                return False
            if char == "}" and brackets[-1] != "{":
                return False
            brackets.pop()
    return not brackets

print(check_brackets("(([{}]))")) # True
print(check_brackets("([{)}")) # False

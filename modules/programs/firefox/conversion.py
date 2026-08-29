#!/usr/bin/env python3
import re

def strip_line_comment(line):
    in_str = False
    for i, ch in enumerate(line):
        if ch == '"':
            in_str = not in_str
        elif not in_str and line[i:i+2] == '//':
            return line[:i]
    return line

with open("user.js") as f:
    text = f.read()

# Remove /* */ block comments
text = re.sub(r'/\*.*?\*/', '', text, flags=re.DOTALL)

out = []
for line in text.splitlines():
    line = strip_line_comment(line).strip()
    if not line:
        continue
    m = re.match(r'(\w+_pref)\("([^"]+)",\s*(.+?)\);', line)
    if m:
        name, value = m.group(2), m.group(3).strip()
        out.append(f'"{name}" = {value};')
    else:
        out.append(line)

with open("_prefs.nix", "w") as f:
    f.write("{\n")
    f.write("\n".join(f"  {line}" for line in out))
    f.write("\n}\n")   

import os
import re

text_dir = 'source'
regex = r'^SBS Volume \d+'
ignore_case = False

# Regex to find SBS Volume in the file content
compiled_pattern = re.compile(regex, re.IGNORECASE if ignore_case else 0)

# Regex to extract volume number from filename like vol-4.txt
volume_number_pattern = re.compile(r'vol[ _-](\d+)', re.IGNORECASE)

filesToEdit = []

# LOOK FOR FILES WITH MISSING VOLUME
for dirpath, dirnames, filenames in os.walk(text_dir):
    for filename in filenames:
        if filename.lower().endswith('.txt'):
            file_path = os.path.join(dirpath, filename)
            # print(file_path)
            with open(file_path, 'r', encoding='utf-8') as f:
                text = f.read()
                if not compiled_pattern.search(text):
                    print(f"Pattern not found: {file_path}")
                    filesToEdit.append((file_path, filename))

# For each file missing the pattern, add the correct first line
for file_path, filename in filesToEdit:
    match = volume_number_pattern.search(filename)
    if match:
        volume_num = match.group(1)
        new_first_line = f"SBS Volume {volume_num}\n"
    else:
        print(f"⚠️ Could not extract volume number from filename: {filename}")
        new_first_line = "SBS Volume 0\n"  # Fallback or placeholder

    with open(file_path, 'r', encoding='utf-8') as f:
        original_text = f.read()

    with open(file_path, 'w', encoding='utf-8') as f:
        f.write(new_first_line + original_text)

    print(f"✅ Inserted line '{new_first_line.strip()}' into: {file_path}")




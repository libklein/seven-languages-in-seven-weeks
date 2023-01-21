# I was impressed by the conciseness of the grep implementation in ruby
# and was wondering how wordy an equivalent python program would be (since
# thats the language I use for any scripting tasks too complex for bash).
# Turns out it's not that much more:

import re
from sys import argv

regexp = re.compile(argv[2])
with open(argv[1]) as fs:
    for line_num, line in enumerate(fs.readlines()):
        if regexp.search(line):
            print(f"{line_num}: {line}", end="")

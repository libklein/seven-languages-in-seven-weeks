import re
from sys import argv

regexp = re.compile(argv[2])
with open(argv[1]) as fs:
    for line_num, line in enumerate(fs.readlines()):
        if regexp.search(line):
            print(f"{line_num}: {line}", end="")

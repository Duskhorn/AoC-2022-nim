import strutils, sugar

let contents = readFile("input")

## part 1

let parsed = collect:
    for pair in contents.splitLines():
        let ranges = collect:
            for elf in pair.split(","):
                for c in elf.split("-"):
                        c.parseInt
        ranges

var overlaps = 0
for ranges in parsed:
    if (ranges[0] >= ranges[2] and ranges[1] <= ranges[3]) or (ranges[0] <= ranges[2] and ranges[1] >= ranges[3]):
        inc overlaps

echo overlaps

## part 2

var partial_overlaps = 0
for ranges in parsed:
    if (ranges[2] <= ranges[1] and ranges[0] <= ranges[3]) or (ranges[1] <= ranges[2] and ranges[3] <= ranges[0]):
        echo ranges
        inc partial_overlaps

echo partial_overlaps

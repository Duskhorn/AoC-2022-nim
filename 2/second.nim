import strutils

let content = readFile("input")

proc convert(c: char): int =
    case c
    of 'A', 'X':
        return 1
    of 'B', 'Y':
        return 2
    of 'C', 'Z':
        return 3
    else: return -10

var res = 0
for line in content.splitLines():
    let 
        op = line[0].convert
        el = line[2].convert
    
    res += el
    
    if op == el:
        res += 3
    elif (op == 1 and el == 2) or (op == 2 and el == 3) or (op == 3 and el == 1):
        res += 6

echo res
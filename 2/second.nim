import strutils

let content = readFile("input")

## part 1
proc convert(c: char): int =
    case c
    of 'A', 'X':
        return 1
    of 'B', 'Y':
        return 2
    of 'C', 'Z':
        return 3
    else: discard

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


## part 2
type Ending = enum 
    Loss,
    Draw,
    Win

proc points(val: int, ending: Ending): int =
    result += val + 3 * ending.int  

proc output(c: char): Ending =
    case c
    of 'X': result = Loss
    of 'Y': result = Draw
    of 'Z': result = Win
    else: discard

var res2 = 0
for line in content.splitLines():
    let 
        opp = line[0].convert
        strat = line[2].output
    
    let elf = case strat 
        of Draw: 
            opp
        of Loss: 
            case opp
            of 1: 3
            of 2: 1
            of 3: 2
            else: 0
        of Win:
            case opp:
            of 1: 2
            of 2: 3
            of 3: 1
            else: 0
    
    res2 += points(elf, strat)

echo res2
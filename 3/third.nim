import strutils, sugar, sets, sequtils

let content = readFile("input")

## part 1
let 
    sacks = splitLines(content)
    organized = collect:
        for s in sacks:
            let hl = int(len(s)/2)
            (s[0..<hl], s[hl..^1])

var priorities_sum = 0
for (first, second) in organized:
    var common = first.toHashSet * second.toHashSet # intersection
    let c = common.pop()
    priorities_sum += (if c.isLowerAscii(): c.int - 65 - 31 else: c.int - 65 + 27)

echo priorities_sum

## part 2
let groups = sacks.distribute(int(len(sacks)/3), false)

var badge_sums = 0
for g in groups:
    var common = g[0].toHashSet * g[1].toHashSet * g[2].toHashSet
    let c = common.pop()
    badge_sums += (if c.isLowerAscii(): c.int - 65 - 31 else: c.int - 65 + 27)

echo badge_sums

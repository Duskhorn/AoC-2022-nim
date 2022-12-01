import strutils

## part 1
let content = readFile("input")

var 
    data = newSeq[int](1)
    idx = 0

for line in splitLines(content):
    if line.isEmptyOrWhitespace():
        inc idx
        data.add(0)
    else:
        data[idx] += line.parseInt

echo max(data)

## part 2
var topThree = 0
for index in 0..2:
    let 
        num = max(data)
        found = data.find(num)
    topThree += num
    data.delete(found)

echo topThree

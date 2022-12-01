import strutils

## first part
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

## second part
var topThree = 0
for index in 0..2:
    let 
        num = max(data)
        found = data.find(num)
    topThree += num
    data.delete(found)

echo topThree

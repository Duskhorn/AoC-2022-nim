import std/tables, strutils, sequtils, sugar

const initial = {
    1: "NRGP".toSeq,
    2: "JTBLFGDC".toSeq,
    3: "MSV".toSeq,
    4: "LSRCZP".toSeq,
    5: "PSLVCWDQ".toSeq,
    6: "CTNWDMS".toSeq,
    7: "HDGWP".toSeq,
    8: "ZLPHSCMV".toSeq,
    9: "RPFLWGZ".toSeq
}.toTable

let contents = readFile("input").splitLines()[10..^1]
var crates = initial.deepCopy()

## part 1

for line in contents:
    let 
        newLine = line.split(" ")
        number = newLine[1].parseInt
        crate1 = newLine[3].parseInt
        crate2 = newLine[5].parseInt

    for n in 1..number:
        let crate = crates[crate1].pop()
        crates[crate2].add(crate)


let result1 = collect:
    for idx in 1..9: 
        crates[idx][^1]

echo result1.join

## part 2

crates = initial.deepCopy()
for line in contents:
    let 
        newLine = line.split(" ")
        number = newLine[1].parseInt
        crate1 = newLine[3].parseInt
        crate2 = newLine[5].parseInt
        
    let pickup = crates[crate1][^number..^1] # this is so fucking cool

    for _ in 1..number: discard crates[crate1].pop()
    crates[crate2] &= pickup 

let result2 = collect:
    for idx in 1..9: 
        crates[idx][^1]

echo result2.join

import std/packedsets

let contents = readFile("input")

## part 1
 
var marker_pos = 4
for idx in 0..(contents.len-4):
    if contents[idx..idx+3].toPackedSet.len == 4:
        break
    inc marker_pos

echo marker_pos

## part 2

var message_pos = 14
for idx in 0..(contents.len-14):
    if contents[idx..idx+13].toPackedSet.len == 14:
        break
    inc message_pos

echo message_pos
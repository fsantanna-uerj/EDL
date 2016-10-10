import Html exposing (text)
import Stack

s1 = Stack.create
s2 = Stack.push 10 s1
s3 = Stack.push 20 s2
s4 = Stack.pop s3

--main = text (toString s3)
--main = text (toString s4)
main = text (toString Stack.pop(Stack.pop s4))

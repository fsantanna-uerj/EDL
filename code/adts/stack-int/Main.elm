import Html exposing (text)
import M_Stack

s1 = M_Stack.create
s2 = M_Stack.push 10 s1

main = text (toString s2)
--main = text (toString M_Stack.pop(M_Stack.pop s4))

import Html exposing (text, ul, li)
import M_Stack

--s1 : List number
--s1 : M_Stack.Stack number
s1 = M_Stack.create
s2 = M_Stack.push 10 s1

s3 = M_Stack.create
s4 = M_Stack.push "ola"   s3
s5 = M_Stack.push "mundo" s4

main = ul []
        [ li [] [text (toString s2)]
        , li [] [text (toString s5)]
        ]
--main = text (toString M_Stack.pop(M_Stack.pop s4))

import Html exposing (text)
import M_Queue

q1 : M_Queue.Queue Int
q1 = M_Queue.create
q2 = M_Queue.insert 10 q1
q3 = M_Queue.insert 11 q2

--main = text (toString q3)
main = text (toString (M_Queue.remove q3))

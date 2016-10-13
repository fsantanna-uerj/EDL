module M_Stack exposing (create, empty, top, push, pop)
--module M_Stack exposing (Stack, create, empty, top, push, pop)

type alias Stack a = List a

create : Stack a
create = []

empty : Stack a -> Bool
empty s = List.isEmpty s

top : Stack a -> Maybe a
top s = List.head s

push : a -> Stack a -> Stack a
push x s = (x :: s)

pop : Stack a -> Maybe (Stack a)
pop s =
    case s of
        [] ->
            Nothing
        _ :: rest ->
            Just rest

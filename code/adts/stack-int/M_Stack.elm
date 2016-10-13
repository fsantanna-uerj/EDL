module M_Stack exposing (create, empty, top, push, pop)

type alias Stack = List Int

create : Stack
create = []

empty : Stack -> Bool
empty s = List.isEmpty s

top : Stack -> Maybe Int
top s = List.head s

push : Int -> Stack -> Stack
push x s = (x :: s)

pop : Stack -> Maybe Stack
pop s =
    case s of
        [] ->
            Nothing
        _ :: rest ->
            Just rest

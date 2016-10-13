--module M_Stack exposing (Stack, create, empty, top, push, pop)
module M_Stack exposing (Stack, create, empty, top, push, pop)

type Stack a = Stack (List a)

create : Stack a
create = Stack []

empty : Stack a -> Bool
empty (Stack l) = List.isEmpty l

top : Stack a -> Maybe a
top (Stack l) = List.head l

push : a -> Stack a -> Stack a
push x (Stack l) = Stack (x :: l)

pop : Stack a -> Maybe (Stack a)
pop (Stack l) =
    case l of
        [] ->
            Nothing
        _ :: rest ->
            Just (Stack rest)

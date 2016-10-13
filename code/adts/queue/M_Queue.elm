module M_Queue exposing (Queue, create, empty, examine, insert, remove)

type Queue a = Queue (List a)

create : Queue a
create = Queue []

empty : Queue a -> Bool
empty (Queue l) = List.isEmpty l

examine : Queue a -> Maybe a
examine (Queue l) =
    case l of
        []      -> Nothing
        h::[]   -> Just h
        _::tail -> examine (Queue tail)

insert : a -> Queue a -> Queue a
insert x (Queue l) = Queue (x :: l)

remove : Queue a -> Maybe (Queue a)
remove (Queue l) =
    case l of
        []      -> Nothing
        h::[]   -> Just (Queue [])
        h::tail ->
            case (remove (Queue tail)) of
                Nothing         -> Just (Queue (h::[]))
                Just (Queue l') -> Just (Queue (h::l'))

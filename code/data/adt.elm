import Html exposing (text)

type User = Anonymous | Named String

u1 = Anonymous
u2 = Named "Francisco"

toName: User -> String
toName u =
    case u of
        Anonymous -> "anon"
        (Named x) -> x

--main = text (toString u1)
--main = text (toString u2)
main = text (toName u2)

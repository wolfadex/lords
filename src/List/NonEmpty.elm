module List.NonEmpty exposing (NonEmptyList, fromPair, singleton, toList)


type NonEmptyList a
    = NonEmptyList a (List a)


singleton : a -> NonEmptyList a
singleton item =
    NonEmptyList item []


fromPair : ( a, List a ) -> NonEmptyList a
fromPair ( first, rest ) =
    NonEmptyList first rest


toList : NonEmptyList a -> List a
toList (NonEmptyList first rest) =
    first :: rest

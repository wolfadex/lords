module Follower exposing
    ( Follower
    , Followers
    , createFollowers
    , new
    , toggleView
    , viewMany
    )

import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import Gui.Color as Color
import Random exposing (Generator)


toggleView : Followers -> Followers
toggleView ({ format } as followers) =
    { followers
        | format =
            case format of
                FormatCount ->
                    FormatList

                FormatList ->
                    FormatCount
    }


type Follower
    = Follower Model


type alias Followers =
    { format : FollowerFormat
    , followers : List Follower
    }


type FollowerFormat
    = FormatCount
    | FormatList


type alias Model =
    { allegiance : Int
    , name : String
    , age : Int
    }


new : Generator Follower
new =
    let
        ( nameFirst, nameRest ) =
            possibleNames
    in
    Random.int 1 3
        |> Random.andThen
            (\nameCount ->
                Random.map2
                    (\names age ->
                        Follower
                            { name = String.join " " names
                            , allegiance = 0
                            , age = age
                            }
                    )
                    (Random.list nameCount (Random.uniform nameFirst nameRest))
                    (Random.int 5 50)
            )


createFollowers : List Follower -> Followers
createFollowers followers =
    { format = FormatCount, followers = followers }


possibleNames : ( String, List String )
possibleNames =
    ( "Carl"
    , [ "Jonathan"
      , "Nandi"
      , "Rebekah"
      , "Wolfgang"
      , "Carey"
      , "Sarah"
      , "Liesje"
      , "Timothy"
      , "Kelby"
      , "Uriah"
      , "Bruce"
      , "Dorothy"
      , "Elizabeth"
      , "Laura"
      , "Thomas"
      , "Stephen"
      ]
    )


viewMany :
    { followers : Followers
    , onToggle : msg
    , onSelectFollower : Follower -> msg
    }
    -> Element msg
viewMany { followers, onToggle, onSelectFollower } =
    case followers.format of
        FormatCount ->
            followers.followers
                |> List.length
                |> String.fromInt
                |> (++) "Followers: "
                |> text
                |> (\textEl ->
                        Input.button
                            []
                            { label = textEl
                            , onPress = Just onToggle
                            }
                   )

        FormatList ->
            followers.followers
                |> List.map
                    (\follower ->
                        Input.button []
                            { label = view follower
                            , onPress = Just (onSelectFollower follower)
                            }
                    )
                |> (::)
                    (Input.button
                        []
                        { label = text "Collapse"
                        , onPress = Just onToggle
                        }
                    )
                |> row
                    [ Background.color Color.secondary
                    , spacing 16
                    , width (fill |> maximum 400)
                    , scrollbarX
                    ]


view : Follower -> Element msg
view (Follower { name, age, allegiance }) =
    column
        [ spacing 8
        , Border.solid
        , Border.widthEach
            { top = 0
            , bottom = 0
            , left = 2
            , right = 0
            }
        , padding 8
        ]
        [ text name
        , age
            |> String.fromInt
            |> text
        , allegiance
            |> String.fromInt
            |> (++) "Allegiance: "
            |> text

        -- , follower
        --     |> getImage
        --     |> (\img -> image [] { description = "follower " ++ Follower.getName follower, src = img })
        ]

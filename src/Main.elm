module Main exposing (main)

import Browser exposing (Document)
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import Follower exposing (Follower, Followers)
import God exposing (Error(..), God)
import Gui
import Gui.Color as Color
import List.NonEmpty exposing (NonEmptyList)
import Random exposing (Seed)
import Update.Pipeline as Up


main : Program Int Model Msg
main =
    Browser.document
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


type alias Model =
    { seed : Seed
    , game : Game
    }


type Game
    = MainMenu
    | NewGame NewGameModel
    | Playing PlayingModel


type alias NewGameModel =
    { name : String
    , description : String
    }


type alias PlayingModel =
    { yourKingdom : Kingdom
    , opposingKingdoms : List Kingdom
    , unassignedFollowers : Followers
    , spells : NonEmptyList Spell
    }


type Spell
    = CastAll
    | CastYours
    | CastSpecific


type alias Kingdom =
    { god : God
    , followers : Followers
    }


init : Int -> ( Model, Cmd Msg )
init i =
    Up.save
        { seed = Random.initialSeed i
        , game = MainMenu
        }


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



---- UPDATE ----


type Msg
    = CreateNewGame
    | SetName String
    | SetDescriptions String
    | BeginGame
    | ToggleUnassignedFollowers
    | SelectUnassignedFollower Follower
    | ToggleYourKingdomFollowers
    | SelectYourKingdomFollower Follower
    | ToggleOpposingFollowers
    | SelectOpposingFollower Follower


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case model.game of
        MainMenu ->
            updateMainMenu msg model

        NewGame m ->
            updateNewGame msg model m

        Playing m ->
            updatePlaying msg model m


updateMainMenu : Msg -> Model -> ( Model, Cmd Msg )
updateMainMenu msg model =
    case msg of
        CreateNewGame ->
            Up.save { model | game = NewGame { name = "", description = "" } }

        SetName _ ->
            Up.save model

        SetDescriptions _ ->
            Up.save model

        BeginGame ->
            Up.save model

        ToggleUnassignedFollowers ->
            Up.save model

        SelectUnassignedFollower _ ->
            Up.save model

        ToggleYourKingdomFollowers ->
            Up.save model

        SelectYourKingdomFollower _ ->
            Up.save model

        ToggleOpposingFollowers ->
            Up.save model

        SelectOpposingFollower _ ->
            Up.save model


updateNewGame : Msg -> Model -> NewGameModel -> ( Model, Cmd Msg )
updateNewGame msg model newGameModel =
    case msg of
        CreateNewGame ->
            Up.save model

        SetName name ->
            Up.save { model | game = NewGame { newGameModel | name = name } }

        SetDescriptions description ->
            Up.save { model | game = NewGame { newGameModel | description = description } }

        BeginGame ->
            case God.create newGameModel of
                Ok yourGod ->
                    let
                        ( unassignedFollowers, nextSeed ) =
                            Random.step
                                (Random.list 50 Follower.new)
                                model.seed
                    in
                    Up.save
                        { model
                            | game =
                                Playing
                                    { yourKingdom =
                                        { god = yourGod
                                        , followers = Follower.createFollowers []
                                        }
                                    , opposingKingdoms = []
                                    , unassignedFollowers = Follower.createFollowers unassignedFollowers
                                    , spells = List.NonEmpty.singleton CastAll
                                    }
                            , seed = nextSeed
                        }

                Err err ->
                    Debug.todo "handle god creaetion err"

        ToggleUnassignedFollowers ->
            Up.save model

        SelectUnassignedFollower _ ->
            Up.save model

        ToggleYourKingdomFollowers ->
            Up.save model

        SelectYourKingdomFollower _ ->
            Up.save model

        ToggleOpposingFollowers ->
            Up.save model

        SelectOpposingFollower _ ->
            Up.save model


updatePlaying : Msg -> Model -> PlayingModel -> ( Model, Cmd Msg )
updatePlaying msg model playingModel =
    case msg of
        CreateNewGame ->
            Up.save model

        SetName _ ->
            Up.save model

        SetDescriptions _ ->
            Up.save model

        BeginGame ->
            Up.save model

        ToggleUnassignedFollowers ->
            Up.save
                { model
                    | game =
                        Playing
                            { playingModel
                                | unassignedFollowers = Follower.toggleView playingModel.unassignedFollowers
                            }
                }

        SelectUnassignedFollower _ ->
            Debug.todo "follower shit"

        ToggleYourKingdomFollowers ->
            Up.save
                { model
                    | game =
                        Playing
                            { playingModel
                                | yourKingdom = kingdomToggleFollowres playingModel.yourKingdom
                            }
                }

        SelectYourKingdomFollower _ ->
            Debug.todo "follower shit"

        ToggleOpposingFollowers ->
            Debug.todo "follower shit"

        SelectOpposingFollower _ ->
            Debug.todo "follower shit"


kingdomToggleFollowres : Kingdom -> Kingdom
kingdomToggleFollowres kingdom =
    { kingdom | followers = Follower.toggleView kingdom.followers }



---- VIEW ----


view : Model -> Document Msg
view model =
    { title = "Lords"
    , body =
        [ viewGame model
            |> layout
                [ height fill
                , width fill
                , Background.color Color.light
                ]
        ]
    }


viewGame : Model -> Element Msg
viewGame model =
    case model.game of
        MainMenu ->
            viewMainMenu

        NewGame m ->
            viewNewGame m

        Playing m ->
            viewPlaying m


viewMainMenu : Element Msg
viewMainMenu =
    column
        [ centerX
        , centerY
        , spacing 64
        ]
        [ text "Lords"
            |> el [ Font.size 48 ]
        , column
            [ centerX, spacing 16 ]
            [ Gui.menuButton
                { label = "New Game"
                , onPress = Just CreateNewGame
                }
            , Gui.menuButton
                { label = "Quit"
                , onPress = Nothing
                }
            ]
        ]


viewNewGame : NewGameModel -> Element Msg
viewNewGame model =
    column
        [ centerX, centerY, spacing 16 ]
        [ Input.text
            []
            { label = text "What is your name?" |> Input.labelAbove []
            , text = model.name
            , placeholder =
                text "Cthulhu"
                    |> Input.placeholder []
                    |> Just
            , onChange = SetName
            }
        , Input.text
            []
            { label = text "Description?" |> Input.labelAbove []
            , text = model.description
            , placeholder =
                text "Devourer of souls."
                    |> Input.placeholder []
                    |> Just
            , onChange = SetDescriptions
            }
        , Gui.menuButton
            { label = "Begin Your Reign"
            , onPress =
                if String.isEmpty model.name then
                    Nothing

                else if String.isEmpty model.description then
                    Nothing

                else
                    Just BeginGame
            }
        ]


viewPlaying : PlayingModel -> Element Msg
viewPlaying { yourKingdom, opposingKingdoms, unassignedFollowers } =
    column
        [ padding 16
        , spacing 8
        , width fill
        ]
        [ row
            [ width fill, height fill ]
            [ column
                [ spacing 8 ]
                [ God.view yourKingdom.god
                , Follower.viewMany
                    { followers = yourKingdom.followers
                    , onToggle = ToggleYourKingdomFollowers
                    , onSelectFollower = SelectYourKingdomFollower
                    }
                ]
            , Follower.viewMany
                { followers = unassignedFollowers
                , onToggle = ToggleUnassignedFollowers
                , onSelectFollower = SelectUnassignedFollower
                }
                |> el [ alignTop ]
            ]
        , opposingKingdoms
            |> List.map viewOpposingKingdom
            |> wrappedRow []
        ]


viewOpposingKingdom : Kingdom -> Element Msg
viewOpposingKingdom { god, followers } =
    column
        []
        [ God.view god
        , Follower.viewMany
            { followers = followers
            , onToggle = ToggleOpposingFollowers
            , onSelectFollower = SelectOpposingFollower
            }
        ]

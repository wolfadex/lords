module Main exposing (main)

import Browser exposing (Document)
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import Gui
import Gui.Color as Color
import Random exposing (Seed)
import Update.Pipeline as Up


main : Program () Model Msg
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
    , image : String
    }


type alias PlayingModel =
    { yourKingdom : Kingdom
    , opossingKingdoms : List Kingdom
    }


type alias Kingdom =
    { name : String
    , image : String
    , followers : Int
    }


init : () -> ( Model, Cmd Msg )
init _ =
    Up.save
        { seed = Random.initialSeed 0
        , game = MainMenu
        }


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



---- UPDATE ----


type Msg
    = CreateNewGame
    | SetName String
    | SetImage String
    | BeginGame


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
            Up.save { model | game = NewGame { name = "", image = "" } }

        SetName _ ->
            Up.save model

        SetImage _ ->
            Up.save model

        BeginGame ->
            Up.save model


updateNewGame : Msg -> Model -> NewGameModel -> ( Model, Cmd Msg )
updateNewGame msg model newGameModel =
    case msg of
        CreateNewGame ->
            Up.save model

        SetName name ->
            Up.save { model | game = NewGame { newGameModel | name = name } }

        SetImage image ->
            Up.save { model | game = NewGame { newGameModel | image = image } }

        BeginGame ->
            Up.save
                { model
                    | game =
                        Playing
                            { yourKingdom =
                                { name = newGameModel.name
                                , image = newGameModel.image
                                , followers = 0
                                }
                            , opossingKingdoms = []
                            }
                }


updatePlaying : Msg -> Model -> PlayingModel -> ( Model, Cmd Msg )
updatePlaying msg model playingModel =
    Up.save model



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
            { label = text "What do you look like?" |> Input.labelAbove []
            , text = model.image
            , placeholder =
                text "https://vignette.wikia.nocookie.net/lovecraft/images/c/cf/Screenshot_20171018-093500.jpg/revision/latest/scale-to-width-down/1000?cb=20171020174137"
                    |> Input.placeholder []
                    |> Just
            , onChange = SetImage
            }
        , image
            [ width (fill |> maximum 200)
            , height (fill |> maximum 200)
            ]
            { description = "Image of you"
            , src = model.image
            }
        , Gui.menuButton
            { label = "Begin Your Reign"
            , onPress =
                if String.isEmpty model.name then
                    Nothing

                else if String.isEmpty model.image then
                    Nothing

                else
                    Just BeginGame
            }
        ]


viewPlaying : PlayingModel -> Element Msg
viewPlaying model =
    text "playing"

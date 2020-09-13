module Gui exposing (menuButton)

import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import Gui.Color as Color


menuButton : { label : String, onPress : Maybe msg } -> Element msg
menuButton { label, onPress } =
    let
        color =
            if onPress == Nothing then
                Color.secondary

            else
                Color.primary
    in
    Input.button
        [ Border.solid
        , Border.width 3
        , paddingXY 24 8
        , Border.color color
        , Font.color color
        ]
        { onPress = onPress
        , label = text label
        }

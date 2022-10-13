module Main exposing (..)
import Browser
import Html exposing (Html, text)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

-- MAIN

main : Program () Model Msg
main =
    Browser.element
        { init = \_ -> init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }

-- MODEL

type alias Model =
    { song : String, play : Bool }

init : ( Model, Cmd Msg )
init = ({ song = "", play = False }, Cmd.none)

-- UPDATE

type Msg = Play

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Play ->
            ({ model | play = True }, Cmd.none)

-- VIEW

view : Model -> Html Msg
view model =
    Html.div [
        style "background-color" (if model.play then "#aa2727" else "#85cfff"),
        style "height" "100vh",
        style "width" "100%",
        style "margin" "0px",
        style "display" "flex",
        style "align-items" "center",
        style "justify-content" "center",
        style "flex-direction" "column",
        style "font-family" "Arial, sans-serif",
        style "user-select" "none",
        style "cursor" "pointer",
        onClick Play
    ] [
        Html.span [
            style "font-size" "64px"
        ] [
            Html.b [] [ text "airhorn" ]
        ],
        Html.span [
            style "font-size" "32px"
        ] [ text (if model.play then "endless air horn 🤡" else "click anywhere") ],
        Html.audio [
            src "../assets/sounds/airhorn_default.wav",
            loop True,
            autoplay model.play
        ] []
    ]
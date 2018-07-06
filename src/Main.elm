module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

---- MODEL ----
type alias Model = {}
type alias Recode = { name: String, power: Int }
myLists =
    [ 
        { name = "Chuck Norris", power = 0 }
        , { name = "Bruce Lee", power = 9000 }
        , { name = "Jackie Chan", power = 7000 }
        , { name = "Jet Li", power = 8000 }
    ]

init : ( Model, Cmd Msg )
init =
    ( {}, Cmd.none )



---- UPDATE ----


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

---- VIEW ----
toTableRow : Recode -> Html Msg
toTableRow myListItem =
    tr []
        [ td [] [ text myListItem.name ]
        , td [] [ text (toString myListItem.power) ]
        ]

view : Model -> Html Msg
view model =
        div []
            [
                label []
                    [input [ type_ "text", placeholder "search"] []
                    , text "Search"
                    ]
                , table []
                    (
                        [ thead []
                            [ th [][text "Name"]
                            , th [][text "Power"]
                            ]
                        ]
                        ++ List.map toTableRow myLists
                    )
            ]

---- PROGRAM ----


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }

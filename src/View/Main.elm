module View.Main exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Model.Types exposing (Model, Msg(..))
import View.Task exposing (viewTask)


view : Model -> Html Msg
view model =
    div [ class "container" ]
        [ h1 [] [ text "Teado List" ]
        , div [ class "input-container" ]
            [ input
                [ type_ "text"
                , placeholder "Add a new task..."
                , value model.newTask
                , onInput UpdateNewTask
                ]
                []
            , button [ onClick AddTask ] [ text "Add" ]
            ]
        , ul [ class "task-list" ]
            (List.map viewTask model.tasks)
        ]

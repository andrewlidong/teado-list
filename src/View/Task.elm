module View.Task exposing (viewTask)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Model.Task exposing (Task)
import Model.Types exposing (Msg(..))


viewTask : Task -> Html Msg
viewTask task =
    li [ class "task-item" ]
        [ input
            [ type_ "checkbox"
            , checked task.completed
            , onClick (ToggleTask task.id)
            ]
            []
        , span
            [ classList
                [ ( "completed", task.completed )
                ]
            ]
            [ text task.description ]
        , button
            [ class "delete-button"
            , onClick (DeleteTask task.id)
            ]
            [ text "Delete" ]
        ]

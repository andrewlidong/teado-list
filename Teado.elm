module Teado exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

-- MODEL

type alias Task =
    { id : Int
    , description : String
    , completed : Bool
    }

type alias Model =
    { tasks : List Task
    , newTask : String
    , nextId : Int
    }

init : Model
init =
    { tasks = []
    , newTask = ""
    , nextId = 0
    }

-- UPDATE

type Msg
    = AddTask
    | UpdateNewTask String
    | ToggleTask Int
    | DeleteTask Int

update : Msg -> Model -> Model
update msg model =
    case msg of
        AddTask ->
            if String.isEmpty model.newTask then
                model
            else
                { model
                    | tasks = model.tasks ++ [ Task model.nextId model.newTask False ]
                    , newTask = ""
                    , nextId = model.nextId + 1
                }

        UpdateNewTask description ->
            { model | newTask = description }

        ToggleTask id ->
            { model
                | tasks =
                    List.map
                        (\task ->
                            if task.id == id then
                                { task | completed = not task.completed }
                            else
                                task
                        )
                        model.tasks
            }

        DeleteTask id ->
            { model
                | tasks = List.filter (\task -> task.id /= id) model.tasks
            }

-- VIEW

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

-- MAIN

main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , view = view
        , update = update
        }
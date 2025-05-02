module Model.Types exposing (Model, Msg(..), init)

import Model.Task exposing (Task)



-- MODEL


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



-- MSG


type Msg
    = AddTask
    | UpdateNewTask String
    | ToggleTask Int
    | DeleteTask Int

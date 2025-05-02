module Update.Update exposing (update)

import Model.Task as Task
import Model.Types exposing (Model, Msg(..))


update : Msg -> Model -> Model
update msg model =
    case msg of
        AddTask ->
            if String.isEmpty model.newTask then
                model

            else
                { model
                    | tasks = model.tasks ++ [ Task.new model.nextId model.newTask ]
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

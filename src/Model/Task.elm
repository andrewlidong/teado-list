module Model.Task exposing (Task, new)

-- MODEL


type alias Task =
    { id : Int
    , description : String
    , completed : Bool
    }



-- CONSTRUCTORS


new : Int -> String -> Task
new id description =
    { id = id
    , description = description
    , completed = False
    }

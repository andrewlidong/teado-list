module Main exposing (main)

import Browser
import Model.Types exposing (Model, Msg, init)
import Update.Update exposing (update)
import View.Main exposing (view)


main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , view = view
        , update = update
        }

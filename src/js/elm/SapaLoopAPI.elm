module SapaLoopAPI where

import Model exposing (Model, Direction(..))
import Update exposing (update, Action(..))
import View exposing (view)

import Effects exposing (Never, Effects)
import Task
import Json.Decode
import Signal exposing (..)
import StartApp exposing(..)


app =
    let
        scrollDetectSignal =
            incrementScroll
                |> Signal.map IncrementScroll
    in
        StartApp.start
          { init = (Model.init, Effects.none)
          , update = Update.update scrollResetMailbox.address
          , view = View.view
          , inputs = [scrollDetectSignal]
          }

main =
    app.html

port tasks : Signal (Task.Task Never ())
port tasks =
    app.tasks

scrollResetMailbox : Signal.Mailbox Bool
scrollResetMailbox =
    Signal.mailbox True


port requestScrollReset : Signal Bool
port requestScrollReset =
    scrollResetMailbox.signal

port incrementScroll : Signal Json.Decode.Value

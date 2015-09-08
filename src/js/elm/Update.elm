module Update where

import Model exposing (..)

import Effects exposing (Never, Effects)
import Task exposing (Task)
import Json.Decode exposing (..)
import Signal exposing (..)

update : Address Bool -> Action -> Model -> (Model, Effects Action)
update scrollResetMailbox action model =
    case action of
        IncrementScroll rawValue ->
            let
                decoder =
                    customDecoder
                        string <|
                        \str ->
                          case str of
                              "UP" -> Result.Ok Up
                              "DOWN" -> Result.Ok Down

                decodedDirection =
                    Json.Decode.decodeValue (decoder) rawValue

            in
                case decodedDirection of
                    Ok direction ->
                        let
                            newDistanceScrolled =
                                case direction of
                                    Up -> model.distanceScrolled + 1
                                    Down -> model.distanceScrolled - 1
                                    None -> model.distanceScrolled
                        in
                            { model | distanceScrolled <- newDistanceScrolled }
                              => Effects.task (resetScroll scrollResetMailbox)
                    Err _ ->
                        model
                            => Effects.task (resetScroll scrollResetMailbox)

        NoOp ->
            model
              => Effects.none


type Action
    = IncrementScroll Json.Decode.Value
    | NoOp


resetScroll : Address Bool ->  Task Never Action
resetScroll scrollResetMailbox =
    Signal.send scrollResetMailbox True
        |> Task.map (always NoOp)

(=>) = (,)

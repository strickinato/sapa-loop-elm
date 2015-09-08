module Model where

type alias Model =
    { distanceScrolled : Int }


init : Model
init =
     { distanceScrolled = 0 }


type Direction
    = Up
    | Down
    | None

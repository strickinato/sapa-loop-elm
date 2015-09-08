module View where

import Model exposing (..)
import Update exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import Json.Decode
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Signal exposing (..)

view : Address Action -> Model -> Html
view address model =
    div
        [ class "hi" ]
        [ Svg.text (toString model.distanceScrolled)
        , Svg.svg
            [Svg.Attributes.width "1440px", Svg.Attributes.height "1024px" ]
            [(Svg.node "path" [ Svg.Attributes.d "M144.5,774 L277.5,492", Svg.Attributes.stroke "#000", Svg.Attributes.strokeWidth "4" ][])]
        ]




  -- <svg width="1440px" height="1024px" viewBox="0 0 1440 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:sketch="http://www.bohemiancoding.com/sketch/ns">
  --     <!-- Generator: Sketch 3.3.3 (12081) - http://www.bohemiancoding.com/sketch -->
  --     <title>Desktop HD Copy 2</title>
  --     <desc>Created with Sketch.</desc>
  --     <defs></defs>
  --     <g sketch:type="MSArtboardGroup">
  --         <path class="the" d="M144.5,774 L277.5,492" id="hanoi-sapa" stroke="#979797" stroke-width="4" sketch:type="MSShapeGroup"></path>
  --     </g>
  -- </svg>

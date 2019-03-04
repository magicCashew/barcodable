{-
   Barcodable.com API
   Barcodable.com API

   OpenAPI spec version: 1.5.0
   Contact: support@barcodable.com

   NOTE: This file is auto generated by the openapi-generator.
   https://github.com/openapitools/openapi-generator.git
   Do not edit this file manually.
-}


module Data.InvalidCode exposing (InvalidCode, decoder, encode)

import Dict exposing (Dict)
import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline exposing (optional, required)
import Json.Encode as Encode


type alias InvalidCode =
    { message : Maybe (String)
    , status : Maybe (Int)
    }


decoder : Decoder InvalidCode
decoder =
    Decode.succeed InvalidCode
        |> optional "message" (Decode.nullable Decode.string) Nothing
        |> optional "status" (Decode.nullable Decode.int) Nothing



encode : InvalidCode -> Encode.Value
encode model =
    Encode.object
        [ ( "message", Maybe.withDefault Encode.null (Maybe.map Encode.string model.message) )
        , ( "status", Maybe.withDefault Encode.null (Maybe.map Encode.int model.status) )

        ]


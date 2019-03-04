# NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
# https://openapi-generator.tech
# Do not edit the class manually.

defmodule BarcodableComAPI.Model.InlineResponse200 do
  @moduledoc """
  
  """

  @derive [Poison.Encoder]
  defstruct [
    :"upcs",
    :"eans",
    :"asins",
    :"message"
  ]

  @type t :: %__MODULE__{
    :"upcs" => [String.t] | nil,
    :"eans" => [String.t] | nil,
    :"asins" => [String.t] | nil,
    :"message" => String.t | nil
  }
end

defimpl Poison.Decoder, for: BarcodableComAPI.Model.InlineResponse200 do
  def decode(value, _options) do
    value
  end
end


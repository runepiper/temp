defmodule Temp.Enum.AgeLevel do
  use Ecto.Schema
  import Ecto.Changeset

  schema "agelevels" do
    field :agelevel, :string

    timestamps()
  end

  @doc false
  def changeset(age_level, attrs) do
    age_level
    |> cast(attrs, [:agelevel])
    |> validate_required([:agelevel])
  end
end

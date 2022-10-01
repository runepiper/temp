defmodule Temp.Enum.Sport do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sport" do
    field :sport, :string

    timestamps()
  end

  @doc false
  def changeset(sport, attrs) do
    sport
    |> cast(attrs, [:sport])
    |> validate_required([:sport])
  end
end

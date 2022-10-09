defmodule Temp.Enum.League do
  use Ecto.Schema
  import Ecto.Changeset

  schema "leagues" do
    field :league, :string

    timestamps()
  end

  @doc false
  def changeset(league, attrs) do
    league
    |> cast(attrs, [:league])
    |> validate_required([:league])
  end
end

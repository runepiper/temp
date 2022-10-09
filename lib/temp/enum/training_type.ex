defmodule Temp.Enum.TrainingType do
  use Ecto.Schema
  import Ecto.Changeset

  schema "trainingtypes" do
    field :trainingtype, :string

    timestamps()
  end

  @doc false
  def changeset(training_type, attrs) do
    training_type
    |> cast(attrs, [:trainingtype])
    |> validate_required([:trainingtype])
  end
end

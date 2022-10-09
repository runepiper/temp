defmodule Temp.Repo.Migrations.CreateTrainingtypes do
  use Ecto.Migration

  def change do
    create table(:trainingtypes) do
      add :trainingtype, :string

      timestamps()
    end

    create unique_index(:trainingstypes, [:trainingtype])
  end
end

defmodule Temp.Repo.Migrations.CreateAgelevels do
  use Ecto.Migration

  def change do
    create table(:agelevels) do
      add :agelevel, :string

      timestamps()
    end

    create unique_index(:agelevels, [:agelevel])
  end
end

defmodule Temp.Repo.Migrations.CreateSport do
  use Ecto.Migration

  def change do
    create table(:sport) do
      add :sport, :string

      timestamps()
    end

    create unique_index(:sport, [:sport])
  end
end

defmodule Temp.Repo.Migrations.CreateLeagues do
  use Ecto.Migration

  def change do
    create table(:leagues) do
      add :league, :string

      timestamps()
    end

    create unique_index(:leagues, [:league])
  end
end

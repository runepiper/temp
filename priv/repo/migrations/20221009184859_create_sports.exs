defmodule Temp.Repo.Migrations.CreateSports do
  use Ecto.Migration

  def change do
    create table(:sports) do
      add :sport, :string

      timestamps()
    end

    create unique_index(:sports, [:sport])
  end
end

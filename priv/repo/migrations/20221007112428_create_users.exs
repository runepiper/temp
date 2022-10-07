defmodule Temp.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :username, :string
      add :mail, :string
      add :password_hash, :string
      add :role, :string

      timestamps()
    end

    create unique_index(:users, [:username])
  end
end
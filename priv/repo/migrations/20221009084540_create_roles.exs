defmodule Temp.Repo.Migrations.CreateRoles do
  use Ecto.Migration

  def change do
    create table(:roles) do
      add :role, :string
    end

    create unique_index(:roles, [:role])
  end
end

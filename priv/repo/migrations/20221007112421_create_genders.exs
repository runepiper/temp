defmodule Temp.Repo.Migrations.CreateGenders do
  use Ecto.Migration

  def change do
    create table(:genders) do
      add :gender, :string
    end

    create unique_index(:genders, [:gender])
  end
end
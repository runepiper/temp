defmodule Temp.Repo.Migrations.AddGenderIdToUser do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :gender_id, references(:genders)
    end
  end
end

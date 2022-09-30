defmodule Temp.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  #user db schema for parsing data
  schema "users" do
    field :name, :string
    field :username, :string
    field :mail, :string
    field :password, :string
    field :role, :string

    timestamps()
  end

  #changeset for user
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :username, :mail, :password, :role])
    |> validate_required([:name, :username, :mail, :password, :role])
    |> validate_length(:username, min: 1, max: 20)
  end
end

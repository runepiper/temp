defmodule Temp.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  #user db schema for parsing data
  schema "users" do
    field :name, :string
    field :username, :string
    field :mail, :string
    field :password, :string, virtual: true
    field :password_hash, :string
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

  #registration changeset for a new user
  def registration_changeset(user, params) do
    user
    |> changeset(params)
    |> cast(params, [:name, :mail, :password, :role])
    |> validate_required([:name, :username, :mail, :password, :role])
    |> validate_length(:username, min: 1, max: 20)
    |> validate_length(:password, min: 8, max: 256)
    |> put_pass_hash()
  end

  defp put_pass_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password_hash, Pbkdf2.hash_pwd_salt(pass))
      _->
        changeset
    end
  end
end

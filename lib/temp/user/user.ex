defmodule Temp.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Temp.Accounts.{Gender, Role}

  #user db schema for parsing data
  schema "users" do
    field :name, :string
    field :username, :string
    field :mail, :string
    field :password, :string, virtual: true
    field :password_hash, :string

    belongs_to :gender, Gender
    belongs_to :role, Role

    timestamps()
  end

  #changeset for user
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :username, :mail, :password, :gender_id, :role_id])
    |> validate_required([:name, :username, :mail, :password])
    |> unique_constraint(:username)
  end

  #registration changeset for a new user
  def registration_changeset(user, params) do
    user
    |> changeset(params)
    |> cast(params, [:name, :mail, :password, :gender_id, :role_id])
    |> validate_required([:name, :username, :mail, :password])
    |> validate_length(:username, min: 1, max: 20)
    |> validate_length(:password, min: 6, max: 20)
    |> unique_constraint(:username)
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

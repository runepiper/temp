defmodule Temp.Accounts do
  @moduledoc """
  The Accounts context.
  """
  alias Temp.Repo
  alias Temp.Accounts.User

  # List all users
  def list_users do
    Repo.all(User)
  end

  # get a single user
  def get_user(id) do
    Repo.get(User, id)
  end

  # get a single user ?!
  def get_user!(id) do
    Repo.get!(User, id)
  end

  #get a single user by params
  def get_user_by(params) do
    Repo.get_by(User, params)
  end

  #create a new user
  def create_user(attrs \\ %{}) do
    %User{}
    |>User.changeset(attrs)
    |>Repo.insert()
  end

  #change registration user
  def change_registration(%User{} = user, params) do
    User.registration_changeset(user, params)
  end

  #registration of a new user
  def register_user(attrs \\ %{}) do
    %User{}
    |> User.registration_changeset(attrs)
    |> Repo.insert()
  end

  #change a user
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  #authenticate a user by params
  def authenticate_by_username_and_pass(username, given_pass) do
    user = get_user_by(username: username)

    cond do
      user && Pbkdf2.verify_pass(given_pass, user.password_hash) ->
        {:ok, user}

      user ->
        {:error, :unauthorized}

      true ->
        Pbkdf2.no_user_verify()
        {:error, :not_found}
    end
  end
end

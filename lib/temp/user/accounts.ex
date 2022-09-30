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

  # get asingle user ?!
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

  #change a user
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end
end

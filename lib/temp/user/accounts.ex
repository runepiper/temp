defmodule Temp.Accounts do
  @moduledoc """
  The Accounts context.
  """
  alias Temp.Repo
  alias Temp.Accounts.User
  alias Temp.Accounts.Gender
  alias Temp.Accounts.Role

  @doc """
    Returns the list of users.
  """
  def list_users do
    Repo.all(User)
  end

  @doc """
    Gets a single user.
  """
  def get_user(id) do
    Repo.get(User, id)
  end

  # get a single user ?!
  def get_user!(id) do
    Repo.get!(User, id)
  end

  @doc """
    Gets a single user by params.
  """
  def get_user_by(params) do
    Repo.get_by(User, params)
  end

  @doc """
    Creates a new user.
  """
  def create_user(attrs \\ %{}) do
    %User{}
    |>User.changeset(attrs)
    |>Repo.insert()
  end

  @doc """
    Get the changeset for changing an existing user.
  """
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  @doc """
    update function for changing an existing user.
  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
    delete function for an existing user in database.
  """
  def delete_user(%User{} = user) do
    user
    |> Repo.delete()
  end

  @doc """
    user-registration functions.
  """
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



  @doc """
    user-authentication function with name & password.
  """
  #authenticate a user by params
  def authenticate_by_mail_and_pass(mail, given_pass) do
  user = get_user_by(mail: mail)
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

  @doc """
    Gender Area
  """
  @doc """
  Returns the list of genders.
  ## Examples
      iex> list_genders()
      [%Gender{}, ...]
  """
  def list_genders do
    Repo.all(Gender)
  end

  @doc """
  Gets a single gender.
  Raises `Ecto.NoResultsError` if the Gender does not exist.
  ## Examples
      iex> get_gender!(123)
      %Gender{}
      iex> get_gender!(456)
      ** (Ecto.NoResultsError)
  """
  def get_gender!(id), do: Repo.get!(Gender, id)

  @doc """
  Creates a gender.
  ## Examples
      iex> create_gender(%{field: value})
      {:ok, %Gender{}}
      iex> create_gender(%{field: bad_value})
      {:error, %Ecto.Changeset{}}
  """
  def create_gender(attrs \\ %{}) do
    %Gender{}
    |> Gender.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Creates a gender with common data.
  ## Examples
      iex> create_gender!(%{field: value})
      {:ok, %Gender{}}
      iex> create_gender!(%{field: bad_value})
      {:error, %Ecto.Changeset{}}
  """
  def create_gender!(gender) do
    Repo.insert(%Gender{gender: gender}, on_conflict: :nothing)
  end

  @doc """
  Updates a gender.
  ## Examples
      iex> update_gender(gender, %{field: new_value})
      {:ok, %Gender{}}
      iex> update_gender(gender, %{field: bad_value})
      {:error, %Ecto.Changeset{}}
  """
  def update_gender(%Gender{} = gender, attrs) do
    gender
    |> Gender.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a gender.
  ## Examples
      iex> delete_gender(gender)
      {:ok, %Gender{}}
      iex> delete_gender(gender)
      {:error, %Ecto.Changeset{}}
  """
  def delete_gender(%Gender{} = gender) do
    Repo.delete(gender)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking gender changes.
  ## Examples
      iex> change_gender(gender)
      %Ecto.Changeset{data: %Gender{}}
  """
  def change_gender(%Gender{} = gender, attrs \\ %{}) do
    Gender.changeset(gender, attrs)
  end

  @doc """
  Returns all Enumerable objects sorted alphabetical.
  """
  def list_alphabetical_genders do
    Gender
    |> Gender.alphabetical()
    |> Repo.all()
  end

  @doc """
    Role Area
  """
  @doc """
  Returns the list of roles.
  ## Examples
      iex> list_genders()
      [%Role{}, ...]
  """
  def list_roles do
    Repo.all(Role)
  end

  @doc """
  Gets a single role.
  Raises `Ecto.NoResultsError` if the Role does not exist.
  ## Examples
      iex> get_role!(123)
      %Role{}
      iex> get_role!(456)
      ** (Ecto.NoResultsError)
  """
  def get_role!(id), do: Repo.get!(Role, id)

  @doc """
  Creates a role.
  ## Examples
      iex> create_role(%{field: value})
      {:ok, %Role{}}
      iex> create_role(%{field: bad_value})
      {:error, %Ecto.Changeset{}}
  """
  def create_role(attrs \\ %{}) do
    %Role{}
    |> Role.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Creates a role with common data.
  ## Examples
      iex> create_role!(%{field: value})
      {:ok, %Role{}}
      iex> create_role!(%{field: bad_value})
      {:error, %Ecto.Changeset{}}
  """
  def create_role!(role) do
    Repo.insert(%Role{role: role}, on_conflict: :nothing)
  end

  @doc """
  Updates a role.
  ## Examples
      iex> update_role(role, %{field: new_value})
      {:ok, %Role{}}
      iex> update_role(role, %{field: bad_value})
      {:error, %Ecto.Changeset{}}
  """
  def update_role(%Role{} = role, attrs) do
    role
    |> Role.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a role.
  ## Examples
      iex> delete_role(role)
      {:ok, %Role{}}
      iex> delete_role(role)
      {:error, %Ecto.Changeset{}}
  """
  def delete_role(%Role{} = role) do
    Repo.delete(role)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking gender changes.
  ## Examples
      iex> change_role(role)
      %Ecto.Changeset{data: %Role{}}
  """
  def change_role(%Role{} = role, attrs \\ %{}) do
    Role.changeset(role, attrs)
  end

  @doc """
  Returns all Enumerable objects sorted alphabetical.
  """
  def list_alphabetical_roles do
    Role
    |> Role.alphabetical()
    |> Repo.all()
  end
end

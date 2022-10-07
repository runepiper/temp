defmodule Temp.Enum do
  @moduledoc """
  The Enum context.
  """

  import Ecto.Query, warn: false
  alias Temp.Repo
  alias Temp.Enum.Sport

  @doc """
  Returns the list of sport.

  ## Examples

      iex> list_sport()
      [%Sport{}, ...]

  """
  def list_sport do
    Repo.all(Sport)
  end

  @doc """
  Gets a single sport.

  Raises `Ecto.NoResultsError` if the Sport does not exist.

  ## Examples

      iex> get_sport!(123)
      %Sport{}

      iex> get_sport!(456)
      ** (Ecto.NoResultsError)

  """
  def get_sport!(id), do: Repo.get!(Sport, id)

  @doc """
  Creates a sport.

  ## Examples

      iex> create_sport(%{field: value})
      {:ok, %Sport{}}

      iex> create_sport(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_sport(attrs \\ %{}) do
    %Sport{}
    |> Sport.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a sport.

  ## Examples

      iex> update_sport(sport, %{field: new_value})
      {:ok, %Sport{}}

      iex> update_sport(sport, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_sport(%Sport{} = sport, attrs) do
    sport
    |> Sport.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a sport.

  ## Examples

      iex> delete_sport(sport)
      {:ok, %Sport{}}

      iex> delete_sport(sport)
      {:error, %Ecto.Changeset{}}

  """
  def delete_sport(%Sport{} = sport) do
    Repo.delete(sport)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking sport changes.

  ## Examples

      iex> change_sport(sport)
      %Ecto.Changeset{data: %Sport{}}

  """
  def change_sport(%Sport{} = sport, attrs \\ %{}) do
    Sport.changeset(sport, attrs)
  end

  alias Temp.Enum.Gender

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
end

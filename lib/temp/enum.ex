defmodule Temp.Enum do
  @moduledoc """
  The Enum context.
  """

  import Ecto.Query, warn: false
  alias Temp.Repo

  alias Temp.Enum.Sport

  @doc """
  Returns the list of sports.

  ## Examples

      iex> list_sports()
      [%Sport{}, ...]

  """
  def list_sports do
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

  alias Temp.Enum.AgeLevel

  @doc """
  Returns the list of agelevels.

  ## Examples

      iex> list_agelevels()
      [%AgeLevel{}, ...]

  """
  def list_age_levels do
    Repo.all(AgeLevel)
  end

  @doc """
  Gets a single age_level.

  Raises `Ecto.NoResultsError` if the Age level does not exist.

  ## Examples

      iex> get_age_level!(123)
      %AgeLevel{}

      iex> get_age_level!(456)
      ** (Ecto.NoResultsError)

  """
  def get_age_level!(id), do: Repo.get!(AgeLevel, id)

  @doc """
  Creates a age_level.

  ## Examples

      iex> create_age_level(%{field: value})
      {:ok, %AgeLevel{}}

      iex> create_age_level(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_age_level(attrs \\ %{}) do
    %AgeLevel{}
    |> AgeLevel.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a age_level.

  ## Examples

      iex> update_age_level(age_level, %{field: new_value})
      {:ok, %AgeLevel{}}

      iex> update_age_level(age_level, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_age_level(%AgeLevel{} = age_level, attrs) do
    age_level
    |> AgeLevel.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a age_level.

  ## Examples

      iex> delete_age_level(age_level)
      {:ok, %AgeLevel{}}

      iex> delete_age_level(age_level)
      {:error, %Ecto.Changeset{}}

  """
  def delete_age_level(%AgeLevel{} = age_level) do
    Repo.delete(age_level)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking age_level changes.

  ## Examples

      iex> change_age_level(age_level)
      %Ecto.Changeset{data: %AgeLevel{}}

  """
  def change_age_level(%AgeLevel{} = age_level, attrs \\ %{}) do
    AgeLevel.changeset(age_level, attrs)
  end

  alias Temp.Enum.TrainingType

  @doc """
  Returns the list of trainingtypes.

  ## Examples

      iex> list_trainingtypes()
      [%TrainingType{}, ...]

  """
  def list_training_types do
    Repo.all(TrainingType)
  end

  @doc """
  Gets a single training_type.

  Raises `Ecto.NoResultsError` if the Training type does not exist.

  ## Examples

      iex> get_training_type!(123)
      %TrainingType{}

      iex> get_training_type!(456)
      ** (Ecto.NoResultsError)

  """
  def get_training_type!(id), do: Repo.get!(TrainingType, id)

  @doc """
  Creates a training_type.

  ## Examples

      iex> create_training_type(%{field: value})
      {:ok, %TrainingType{}}

      iex> create_training_type(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_training_type(attrs \\ %{}) do
    %TrainingType{}
    |> TrainingType.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a training_type.

  ## Examples

      iex> update_training_type(training_type, %{field: new_value})
      {:ok, %TrainingType{}}

      iex> update_training_type(training_type, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_training_type(%TrainingType{} = training_type, attrs) do
    training_type
    |> TrainingType.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a training_type.

  ## Examples

      iex> delete_training_type(training_type)
      {:ok, %TrainingType{}}

      iex> delete_training_type(training_type)
      {:error, %Ecto.Changeset{}}

  """
  def delete_training_type(%TrainingType{} = training_type) do
    Repo.delete(training_type)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking training_type changes.

  ## Examples

      iex> change_training_type(training_type)
      %Ecto.Changeset{data: %TrainingType{}}

  """
  def change_training_type(%TrainingType{} = training_type, attrs \\ %{}) do
    TrainingType.changeset(training_type, attrs)
  end

  alias Temp.Enum.League

  @doc """
  Returns the list of leagues.

  ## Examples

      iex> list_leagues()
      [%League{}, ...]

  """
  def list_leagues do
    Repo.all(League)
  end

  @doc """
  Gets a single league.

  Raises `Ecto.NoResultsError` if the League does not exist.

  ## Examples

      iex> get_league!(123)
      %League{}

      iex> get_league!(456)
      ** (Ecto.NoResultsError)

  """
  def get_league!(id), do: Repo.get!(League, id)

  @doc """
  Creates a league.

  ## Examples

      iex> create_league(%{field: value})
      {:ok, %League{}}

      iex> create_league(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_league(attrs \\ %{}) do
    %League{}
    |> League.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a league.

  ## Examples

      iex> update_league(league, %{field: new_value})
      {:ok, %League{}}

      iex> update_league(league, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_league(%League{} = league, attrs) do
    league
    |> League.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a league.

  ## Examples

      iex> delete_league(league)
      {:ok, %League{}}

      iex> delete_league(league)
      {:error, %Ecto.Changeset{}}

  """
  def delete_league(%League{} = league) do
    Repo.delete(league)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking league changes.

  ## Examples

      iex> change_league(league)
      %Ecto.Changeset{data: %League{}}

  """
  def change_league(%League{} = league, attrs \\ %{}) do
    League.changeset(league, attrs)
  end
end

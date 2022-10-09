defmodule Temp.EnumFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Temp.Enum` context.
  """

  @doc """
  Generate a sport.
  """
  def sport_fixture(attrs \\ %{}) do
    {:ok, sport} =
      attrs
      |> Enum.into(%{
        sport: "some sport"
      })
      |> Temp.Enum.create_sport()

    sport
  end

  @doc """
  Generate a age_level.
  """
  def age_level_fixture(attrs \\ %{}) do
    {:ok, age_level} =
      attrs
      |> Enum.into(%{
        agelevel: "some agelevel"
      })
      |> Temp.Enum.create_age_level()

    age_level
  end

  @doc """
  Generate a training_type.
  """
  def training_type_fixture(attrs \\ %{}) do
    {:ok, training_type} =
      attrs
      |> Enum.into(%{
        trainingtype: "some trainingtype"
      })
      |> Temp.Enum.create_training_type()

    training_type
  end

  @doc """
  Generate a league.
  """
  def league_fixture(attrs \\ %{}) do
    {:ok, league} =
      attrs
      |> Enum.into(%{
        league: "some league"
      })
      |> Temp.Enum.create_league()

    league
  end
end

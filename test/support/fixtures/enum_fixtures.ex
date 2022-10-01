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
  Generate a gender.
  """
  def gender_fixture(attrs \\ %{}) do
    {:ok, gender} =
      attrs
      |> Enum.into(%{
        gender: "some gender"
      })
      |> Temp.Enum.create_gender()

    gender
  end
end

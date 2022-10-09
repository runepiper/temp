defmodule Temp.EnumTest do
  use Temp.DataCase

  alias Temp.Enum

  describe "sports" do
    alias Temp.Enum.Sport

    import Temp.EnumFixtures

    @invalid_attrs %{sport: nil}

    test "list_sports/0 returns all sports" do
      sport = sport_fixture()
      assert Enum.list_sports() == [sport]
    end

    test "get_sport!/1 returns the sport with given id" do
      sport = sport_fixture()
      assert Enum.get_sport!(sport.id) == sport
    end

    test "create_sport/1 with valid data creates a sport" do
      valid_attrs = %{sport: "some sport"}

      assert {:ok, %Sport{} = sport} = Enum.create_sport(valid_attrs)
      assert sport.sport == "some sport"
    end

    test "create_sport/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Enum.create_sport(@invalid_attrs)
    end

    test "update_sport/2 with valid data updates the sport" do
      sport = sport_fixture()
      update_attrs = %{sport: "some updated sport"}

      assert {:ok, %Sport{} = sport} = Enum.update_sport(sport, update_attrs)
      assert sport.sport == "some updated sport"
    end

    test "update_sport/2 with invalid data returns error changeset" do
      sport = sport_fixture()
      assert {:error, %Ecto.Changeset{}} = Enum.update_sport(sport, @invalid_attrs)
      assert sport == Enum.get_sport!(sport.id)
    end

    test "delete_sport/1 deletes the sport" do
      sport = sport_fixture()
      assert {:ok, %Sport{}} = Enum.delete_sport(sport)
      assert_raise Ecto.NoResultsError, fn -> Enum.get_sport!(sport.id) end
    end

    test "change_sport/1 returns a sport changeset" do
      sport = sport_fixture()
      assert %Ecto.Changeset{} = Enum.change_sport(sport)
    end
  end

  describe "agelevels" do
    alias Temp.Enum.AgeLevel

    import Temp.EnumFixtures

    @invalid_attrs %{agelevel: nil}

    test "list_agelevels/0 returns all agelevels" do
      age_level = age_level_fixture()
      assert Enum.list_agelevels() == [age_level]
    end

    test "get_age_level!/1 returns the age_level with given id" do
      age_level = age_level_fixture()
      assert Enum.get_age_level!(age_level.id) == age_level
    end

    test "create_age_level/1 with valid data creates a age_level" do
      valid_attrs = %{agelevel: "some agelevel"}

      assert {:ok, %AgeLevel{} = age_level} = Enum.create_age_level(valid_attrs)
      assert age_level.agelevel == "some agelevel"
    end

    test "create_age_level/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Enum.create_age_level(@invalid_attrs)
    end

    test "update_age_level/2 with valid data updates the age_level" do
      age_level = age_level_fixture()
      update_attrs = %{agelevel: "some updated agelevel"}

      assert {:ok, %AgeLevel{} = age_level} = Enum.update_age_level(age_level, update_attrs)
      assert age_level.agelevel == "some updated agelevel"
    end

    test "update_age_level/2 with invalid data returns error changeset" do
      age_level = age_level_fixture()
      assert {:error, %Ecto.Changeset{}} = Enum.update_age_level(age_level, @invalid_attrs)
      assert age_level == Enum.get_age_level!(age_level.id)
    end

    test "delete_age_level/1 deletes the age_level" do
      age_level = age_level_fixture()
      assert {:ok, %AgeLevel{}} = Enum.delete_age_level(age_level)
      assert_raise Ecto.NoResultsError, fn -> Enum.get_age_level!(age_level.id) end
    end

    test "change_age_level/1 returns a age_level changeset" do
      age_level = age_level_fixture()
      assert %Ecto.Changeset{} = Enum.change_age_level(age_level)
    end
  end

  describe "trainingtypes" do
    alias Temp.Enum.TrainingType

    import Temp.EnumFixtures

    @invalid_attrs %{trainingtype: nil}

    test "list_trainingtypes/0 returns all trainingtypes" do
      training_type = training_type_fixture()
      assert Enum.list_trainingtypes() == [training_type]
    end

    test "get_training_type!/1 returns the training_type with given id" do
      training_type = training_type_fixture()
      assert Enum.get_training_type!(training_type.id) == training_type
    end

    test "create_training_type/1 with valid data creates a training_type" do
      valid_attrs = %{trainingtype: "some trainingtype"}

      assert {:ok, %TrainingType{} = training_type} = Enum.create_training_type(valid_attrs)
      assert training_type.trainingtype == "some trainingtype"
    end

    test "create_training_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Enum.create_training_type(@invalid_attrs)
    end

    test "update_training_type/2 with valid data updates the training_type" do
      training_type = training_type_fixture()
      update_attrs = %{trainingtype: "some updated trainingtype"}

      assert {:ok, %TrainingType{} = training_type} = Enum.update_training_type(training_type, update_attrs)
      assert training_type.trainingtype == "some updated trainingtype"
    end

    test "update_training_type/2 with invalid data returns error changeset" do
      training_type = training_type_fixture()
      assert {:error, %Ecto.Changeset{}} = Enum.update_training_type(training_type, @invalid_attrs)
      assert training_type == Enum.get_training_type!(training_type.id)
    end

    test "delete_training_type/1 deletes the training_type" do
      training_type = training_type_fixture()
      assert {:ok, %TrainingType{}} = Enum.delete_training_type(training_type)
      assert_raise Ecto.NoResultsError, fn -> Enum.get_training_type!(training_type.id) end
    end

    test "change_training_type/1 returns a training_type changeset" do
      training_type = training_type_fixture()
      assert %Ecto.Changeset{} = Enum.change_training_type(training_type)
    end
  end

  describe "leagues" do
    alias Temp.Enum.League

    import Temp.EnumFixtures

    @invalid_attrs %{league: nil}

    test "list_leagues/0 returns all leagues" do
      league = league_fixture()
      assert Enum.list_leagues() == [league]
    end

    test "get_league!/1 returns the league with given id" do
      league = league_fixture()
      assert Enum.get_league!(league.id) == league
    end

    test "create_league/1 with valid data creates a league" do
      valid_attrs = %{league: "some league"}

      assert {:ok, %League{} = league} = Enum.create_league(valid_attrs)
      assert league.league == "some league"
    end

    test "create_league/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Enum.create_league(@invalid_attrs)
    end

    test "update_league/2 with valid data updates the league" do
      league = league_fixture()
      update_attrs = %{league: "some updated league"}

      assert {:ok, %League{} = league} = Enum.update_league(league, update_attrs)
      assert league.league == "some updated league"
    end

    test "update_league/2 with invalid data returns error changeset" do
      league = league_fixture()
      assert {:error, %Ecto.Changeset{}} = Enum.update_league(league, @invalid_attrs)
      assert league == Enum.get_league!(league.id)
    end

    test "delete_league/1 deletes the league" do
      league = league_fixture()
      assert {:ok, %League{}} = Enum.delete_league(league)
      assert_raise Ecto.NoResultsError, fn -> Enum.get_league!(league.id) end
    end

    test "change_league/1 returns a league changeset" do
      league = league_fixture()
      assert %Ecto.Changeset{} = Enum.change_league(league)
    end
  end
end

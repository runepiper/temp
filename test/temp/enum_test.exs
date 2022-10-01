defmodule Temp.EnumTest do
  use Temp.DataCase

  alias Temp.Enum

  describe "sport" do
    alias Temp.Enum.Sport

    import Temp.EnumFixtures

    @invalid_attrs %{sport: nil}

    test "list_sport/0 returns all sport" do
      sport = sport_fixture()
      assert Enum.list_sport() == [sport]
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

  describe "genders" do
    alias Temp.Enum.Gender

    import Temp.EnumFixtures

    @invalid_attrs %{gender: nil}

    test "list_genders/0 returns all genders" do
      gender = gender_fixture()
      assert Enum.list_genders() == [gender]
    end

    test "get_gender!/1 returns the gender with given id" do
      gender = gender_fixture()
      assert Enum.get_gender!(gender.id) == gender
    end

    test "create_gender/1 with valid data creates a gender" do
      valid_attrs = %{gender: "some gender"}

      assert {:ok, %Gender{} = gender} = Enum.create_gender(valid_attrs)
      assert gender.gender == "some gender"
    end

    test "create_gender/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Enum.create_gender(@invalid_attrs)
    end

    test "update_gender/2 with valid data updates the gender" do
      gender = gender_fixture()
      update_attrs = %{gender: "some updated gender"}

      assert {:ok, %Gender{} = gender} = Enum.update_gender(gender, update_attrs)
      assert gender.gender == "some updated gender"
    end

    test "update_gender/2 with invalid data returns error changeset" do
      gender = gender_fixture()
      assert {:error, %Ecto.Changeset{}} = Enum.update_gender(gender, @invalid_attrs)
      assert gender == Enum.get_gender!(gender.id)
    end

    test "delete_gender/1 deletes the gender" do
      gender = gender_fixture()
      assert {:ok, %Gender{}} = Enum.delete_gender(gender)
      assert_raise Ecto.NoResultsError, fn -> Enum.get_gender!(gender.id) end
    end

    test "change_gender/1 returns a gender changeset" do
      gender = gender_fixture()
      assert %Ecto.Changeset{} = Enum.change_gender(gender)
    end
  end
end

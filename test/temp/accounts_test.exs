defmodule Temp.AccountsTest do
  use Temp.DataCase, async: true

  alias Temp.Accounts
  alias Temp.Accounts.User

  describe "register_user/1" do
    @valid_attrs %{
      name: "test",
      username: "test",
      mail: "test@test.de",
      password: "secret"
    }
    @invalid_attrs %{}

    test "with valid data inserts user" do
      assert {:ok, %User{id: id}=user} = Accounts.register_user(@valid_attrs)
      assert user.mail == "test@test.de"
      assert user.name == "test"
      assert user.password == "secret"
      assert user.username == "test"
      assert [%User{id: ^id}] = Accounts.list_users()
    end

    test "with invalid data does not insert user" do
      assert {:error, _changeset} = Accounts.register_user(@invalid_attrs)
      assert Accounts.list_users() == []
    end

    test "enforces unique usernames" do
      assert {:ok, %User{id: id}} = Accounts.register_user(@valid_attrs)
      assert {:error, changeset} = Accounts.register_user(@valid_attrs)

      assert %{username: ["has already been taken"]} =
               errors_on(changeset)

      assert [%User{id: ^id}] = Accounts.list_users()
    end

    test "does not accept long usernames" do
      attrs = Map.put(@valid_attrs, :username, String.duplicate("a", 30))
      {:error, changeset} = Accounts.register_user(attrs)

      assert %{username: ["should be at most 20 character(s)"]} =
          errors_on(changeset)
      assert Accounts.list_users() == []
    end

    test "requires password to be at least 6 chars long" do
      attrs = Map.put(@valid_attrs, :password, "12345")
      {:error, changeset} = Accounts.register_user(attrs)

      assert %{password: ["should be at least 6 character(s)"]} =
        errors_on(changeset)
      assert Accounts.list_users() == []
    end
  end


end
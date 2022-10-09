defmodule Temp.TestHelpers do
  alias Temp.{
    Accounts
    }

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(%{
          name: "test",
          username: "user#{System.unique_integer([:positive])}",
          gender_id: "1",
          mail: "test@test.de",
          password: attrs[:password] || "supersecret",
          role_id: "1"
        })
        |> Accounts.register_user()
      user
    end
end
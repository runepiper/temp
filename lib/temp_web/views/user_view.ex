defmodule TempWeb.UserView do
  use TempWeb, :view

  alias Temp.Accounts

  def name(%Accounts.User{name: name}) do
    name
    |> String.split(" ")
    |> Enum.at(0)
  end
end
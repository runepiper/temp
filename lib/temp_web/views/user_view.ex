defmodule TempWeb.UserView do
  use TempWeb, :view

  alias Temp.Accounts

  def name(%Accounts.User{name: name}) do
    name
    |> String.split(" ")
    |> Enum.at(0)
  end

  def mail(%Accounts.User{mail: mail}) do
    mail
    |> String.split(" ")
    |> Enum.at(0)
  end

  def role(%Accounts.User{role: role}) do
    role
    |> String.split(" ")
    |> Enum.at(0)
  end

  def gender_select_options(genders) do
    for gender <- genders, do: {gender.gender, gender.id}
  end
end

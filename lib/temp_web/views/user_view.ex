defmodule TempWeb.UserView do
  use TempWeb, :view

  alias Temp.Accounts

  #show name
  def name(%Accounts.User{name: name}) do
    name
    |> String.split(" ")
    |> Enum.at(0)
  end

  #show mail
  def mail(%Accounts.User{mail: mail}) do
    mail
    |> String.split(" ")
    |> Enum.at(0)
  end

  #show gender
  def gender(%Accounts.User{gender_id: gender_id}) do
    gender_id
    cond do
      gender_id == 1 -> "divers"
      gender_id == 2 -> "female"
      gender_id == 3 -> "male"
    end
  end

  #show role
  def role(%Accounts.User{role_id: role_id}) do
    role_id
    cond do
      role_id == 1 -> "admin"
      role_id == 2 -> "trainer"
      role_id == 3 -> "user"
    end
  end
end
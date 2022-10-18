defmodule TempWeb.API_UserView do
  use TempWeb, :view

  def render("show.json", %{user: user}) do
    %{
      user: user_json(user)
    }
  end

  defp user_json(user) do
    %{
      user_id: user.id,
      name: user.name,
      username: user.username,
      mail: user.mail,
      password_hash: user.password_hash,
      gender_id: user.gender_id,
      role_id: user.role_id,
      inserted_at: user.inserted_at,
      updated_at: user.updated_at
    }
  end
end
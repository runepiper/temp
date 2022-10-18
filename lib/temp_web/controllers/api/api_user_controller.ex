defmodule TempWeb.API_UserController do
  use TempWeb, :controller

  alias Temp.Accounts

  #error handling with action_fallback
  action_fallback TempWeb.FallbackController

  #rendering user-show page
  def show(conn, %{"id" => id}) do
    user = Accounts.get_user(id)

    if user do
      render(conn, "show.json", user: user)
    end
  end
end

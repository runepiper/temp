defmodule TempWeb.SessionController do
  use TempWeb, :controller

  def new(conn, _) do
    render(conn, "new.html")
  end

  #function for creating a new user-related session
  def create(
    conn,
    %{"session" => %{"username" => username, "password" => pass}}
  ) do
    case Temp.Accounts.authenticate_by_username_and_pass(username, pass) do
      {:ok, user} ->
        conn
        |> TempWeb.AuthController.login(user)
        |> put_flash(:info, "Welocme back!")
        |> redirect(to: Routes.page_path(conn, :index))
      {:error, _reason} ->
        conn
        |> put_flash(:error, "Invalid username or password!")
        |> render("new.html")
    end
  end

  #function to end a active session
  def delete(conn, _) do
    conn
    |> TempWeb.AuthController.logout()
    |> redirect(to: Routes.page_path(conn, :index))
  end
end
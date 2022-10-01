defmodule TempWeb.UserController do
  use TempWeb, :controller

  alias Temp.Accounts
  alias Temp.Accounts.User
  plug :authentication when action in [:index, :show]

  #rendering users-index page, (with authentication check)
  def index(conn, _params) do
    users = Accounts.list_users()
    render(conn, "index.html", users: users)
  end

  #rendering user-show page
  def show(conn, %{"id" => id}) do
    user = Accounts.get_user(id)
    render(conn, "show.html", user: user)
  end

  #rendering new-user page
  def new(conn, _params) do
    changeset = Accounts.change_registration(%User{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  #rendering registration page
  def create(conn, %{"user" => user_params}) do
    case Accounts.register_user(user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "#{user.name} created!")
        |> redirect(to: Routes.user_path(conn, :index))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  #check for authenticated user (when accessing secured sites)
  defp authentication(conn, _opts) do
    if conn.assigns.current_user do
      conn
    else
      conn
      |> put_flash(:error, "Access denied! You're not logged in.")
      |> redirect(to: Routes.page_path(conn, :index))
      |> halt()
    end
  end
end
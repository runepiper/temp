defmodule TempWeb.UserController do
  use TempWeb, :controller
  require Logger

  alias Temp.Accounts
  alias Temp.Accounts.User
  plug :authentication when action in [:index, :show]

  #loading genders data for registration/edit mask
  plug :load_genders when action in [:new, :create, :edit, :update]

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
        |> TempWeb.AuthController.login(user)
        |> put_flash(:info, "#{user.name} created!")
        |> redirect(to: Routes.user_path(conn, :index))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  defp load_genders(conn, _) do
    assign(conn, :genders, Temp.Enum.list_alphabetical_genders())
  end
end
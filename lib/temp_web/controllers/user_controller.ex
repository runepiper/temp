defmodule TempWeb.UserController do
  use TempWeb, :controller

  alias Temp.Accounts
  alias Temp.Accounts.User
  plug :authentication when action in [:index, :show, :edit, :delete]

  #loading genders data for registration/edit mask
  plug :load_genders when action in [:index, :new, :create, :edit]
  plug :load_roles when action in [:index, :new, :create, :edit]

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

  #editing an existing user
  def edit(conn, %{"id" => id}) do
      user = Accounts.get_user!(id)
      changeset = Accounts.change_user(user)
      render(conn, "edit.html", user: user, changeset: changeset)
  end

  #updates an existing user in the database
  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Accounts.get_user!(id)
    case Accounts.update_user(user, user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "#{user.name} updated succsessfully!")
        |> redirect(to: Routes.user_path(conn, :show, user))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", user: user, changeset: changeset)
    end
  end

  #deletes a user from the database
  def delete(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    {:ok, user} = Accounts.delete_user(user)
    conn
    |> put_flash(:info, "User deleted successsfully!")
    |> redirect(to: Routes.user_path(conn, :index))
  end

  #loading trigger for select fields (gender & roles)
  defp load_genders(conn, _) do
    assign(conn, :genders, Temp.Accounts.list_alphabetical_genders())
  end

  defp load_roles(conn, _) do
    assign(conn, :roles, Temp.Accounts.list_alphabetical_roles())
  end
end

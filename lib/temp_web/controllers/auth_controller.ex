defmodule TempWeb.AuthController do
  import Phoenix.Controller
  import Plug.Conn

  alias TempWeb.Router.Helpers, as: Routes

  #init & call function for storing user_information inside a active session
  def init(opts), do: opts

  def call(conn, _opts) do
    user_id = get_session(conn, :user_id)
    user = user_id && Temp.Accounts.get_user(user_id)
    assign(conn, :current_user, user)
  end

  #login authentication functionality
  def login(conn, user) do
    conn
    |> assign(:current_user, user)
    |> put_session(:user_id, user.id)
    |> configure_session(renew: true)
  end

  #logout functionality
  def logout(conn) do
    configure_session(conn, drop: true)
  end

  #check for authenticated user (when accessing secured sites)
  def authentication(conn, _opts) do
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
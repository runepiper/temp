defmodule TempWeb.FallbackController do
  use TempWeb, :controller

  alias TempWeb.ErrorView

  def call(conn, nil) do
    conn
    |> put_status(:not_found)
    |> render(ErrorView, "error.json", message: "The resource couldn't be found!")
  end
end
defmodule TempWeb.API_EnumController do
  use TempWeb, :controller

  alias Temp.Repo
  alias Temp.Enum

  #error handling with action_fallback
  action_fallback TempWeb.FallbackController

  #rendering enum-show page
  def show(conn, %{"id" => id}) do
     enum = Enum.get_sport!(id)

    if enum do
      render(conn, "show.json", enum: enum)
    end
  end
end
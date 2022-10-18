defmodule TempWeb.API_EnumView do
  use TempWeb, :view

  def render("show.json", %{enum: enum}) do
    %{
      sports: sports_json(enum)
    }
  end

  defp sports_json(sports) do
    %{
      sports_id: sports.id,
      sport: sports.sport,
      inserted_at: sports.inserted_at,
      updated_at: sports.updated_at
    }
  end
end
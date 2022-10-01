defmodule TempWeb.SportLive.Index do
  use TempWeb, :live_view

  alias Temp.Enum
  alias Temp.Enum.Sport

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :sport_collection, list_sport())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Sport")
    |> assign(:sport, Enum.get_sport!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Sport")
    |> assign(:sport, %Sport{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Sport")
    |> assign(:sport, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    sport = Enum.get_sport!(id)
    {:ok, _} = Enum.delete_sport(sport)

    {:noreply, assign(socket, :sport_collection, list_sport())}
  end

  defp list_sport do
    Enum.list_sport()
  end
end

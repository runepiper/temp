defmodule TempWeb.LeagueLive.Index do
  use TempWeb, :live_view

  alias Temp.Enum
  alias Temp.Enum.League

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :leagues, list_leagues())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit League")
    |> assign(:league, Enum.get_league!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New League")
    |> assign(:league, %League{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Leagues")
    |> assign(:league, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    league = Enum.get_league!(id)
    {:ok, _} = Enum.delete_league(league)

    {:noreply, assign(socket, :leagues, list_leagues())}
  end

  defp list_leagues do
    Enum.list_leagues()
  end
end

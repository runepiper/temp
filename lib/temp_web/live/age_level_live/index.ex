defmodule TempWeb.AgeLevelLive.Index do
  use TempWeb, :live_view

  alias Temp.Enum
  alias Temp.Enum.AgeLevel

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :agelevels, Enum.list_age_levels())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Age level")
    |> assign(:agelevel, Enum.get_age_level!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Age level")
    |> assign(:agelevel, %AgeLevel{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Agelevels")
    |> assign(:agelevel, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    agelevel = Enum.get_age_level!(id)
    {:ok, _} = Enum.delete_age_level(agelevel)

    {:noreply, assign(socket, :agelevels, Enum.list_age_levels())}
  end

  defp list_age_levels do
    Enum.list_age_levels()
  end
end

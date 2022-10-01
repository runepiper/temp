defmodule TempWeb.SportLive.Show do
  use TempWeb, :live_view

  alias Temp.Enum

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:sport, Enum.get_sport!(id))}
  end

  defp page_title(:show), do: "Show Sport"
  defp page_title(:edit), do: "Edit Sport"
end

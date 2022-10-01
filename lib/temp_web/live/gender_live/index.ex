defmodule TempWeb.GenderLive.Index do
  use TempWeb, :live_view

  alias Temp.Enum
  alias Temp.Enum.Gender

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :genders, list_genders())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Gender")
    |> assign(:gender, Enum.get_gender!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Gender")
    |> assign(:gender, %Gender{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Genders")
    |> assign(:gender, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    gender = Enum.get_gender!(id)
    {:ok, _} = Enum.delete_gender(gender)

    {:noreply, assign(socket, :genders, list_genders())}
  end

  defp list_genders do
    Enum.list_genders()
  end
end

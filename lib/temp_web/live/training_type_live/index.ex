defmodule TempWeb.TrainingTypeLive.Index do
  use TempWeb, :live_view

  alias Temp.Enum
  alias Temp.Enum.TrainingType

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :trainingtypes, list_training_types())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Training type")
    |> assign(:training_type, Enum.get_training_type!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Training type")
    |> assign(:training_type, %TrainingType{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Trainingtypes")
    |> assign(:training_type, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    training_type = Enum.get_training_type!(id)
    {:ok, _} = Enum.delete_training_type(training_type)

    {:noreply, assign(socket, :trainingtypes, list_training_types())}
  end

  defp list_training_types do
    Enum.list_training_types()
  end
end

defmodule TempWeb.SportLive.FormComponent do
  use TempWeb, :live_component

  alias Temp.Enum

  @impl true
  def update(%{sport: sport} = assigns, socket) do
    changeset = Enum.change_sport(sport)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"sport" => sport_params}, socket) do
    changeset =
      socket.assigns.sport
      |> Enum.change_sport(sport_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"sport" => sport_params}, socket) do
    save_sport(socket, socket.assigns.action, sport_params)
  end

  defp save_sport(socket, :edit, sport_params) do
    case Enum.update_sport(socket.assigns.sport, sport_params) do
      {:ok, _sport} ->
        {:noreply,
         socket
         |> put_flash(:info, "Sport updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_sport(socket, :new, sport_params) do
    case Enum.create_sport(sport_params) do
      {:ok, _sport} ->
        {:noreply,
         socket
         |> put_flash(:info, "Sport created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end

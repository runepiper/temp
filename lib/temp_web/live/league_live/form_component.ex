defmodule TempWeb.LeagueLive.FormComponent do
  use TempWeb, :live_component

  alias Temp.Enum

  @impl true
  def update(%{league: league} = assigns, socket) do
    changeset = Enum.change_league(league)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"league" => league_params}, socket) do
    changeset =
      socket.assigns.league
      |> Enum.change_league(league_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"league" => league_params}, socket) do
    save_league(socket, socket.assigns.action, league_params)
  end

  defp save_league(socket, :edit, league_params) do
    case Enum.update_league(socket.assigns.league, league_params) do
      {:ok, _league} ->
        {:noreply,
         socket
         |> put_flash(:info, "League updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_league(socket, :new, league_params) do
    case Enum.create_league(league_params) do
      {:ok, _league} ->
        {:noreply,
         socket
         |> put_flash(:info, "League created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end

defmodule TempWeb.AgeLevelLive.FormComponent do
  use TempWeb, :live_component

  alias Temp.Enum

  @impl true
  def update(%{age_level: age_level} = assigns, socket) do
    changeset = Enum.change_age_level(age_level)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"age_level" => age_level_params}, socket) do
    changeset =
      socket.assigns.age_level
      |> Enum.change_age_level(age_level_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"age_level" => age_level_params}, socket) do
    save_age_level(socket, socket.assigns.action, age_level_params)
  end

  defp save_age_level(socket, :edit, age_level_params) do
    case Enum.update_age_level(socket.assigns.age_level, age_level_params) do
      {:ok, _age_level} ->
        {:noreply,
         socket
         |> put_flash(:info, "Age level updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_age_level(socket, :new, age_level_params) do
    case Enum.create_age_level(age_level_params) do
      {:ok, _age_level} ->
        {:noreply,
         socket
         |> put_flash(:info, "Age level created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end

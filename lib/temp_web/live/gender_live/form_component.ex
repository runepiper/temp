defmodule TempWeb.GenderLive.FormComponent do
  use TempWeb, :live_component

  alias Temp.Enum

  @impl true
  def update(%{gender: gender} = assigns, socket) do
    changeset = Enum.change_gender(gender)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"gender" => gender_params}, socket) do
    changeset =
      socket.assigns.gender
      |> Enum.change_gender(gender_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"gender" => gender_params}, socket) do
    save_gender(socket, socket.assigns.action, gender_params)
  end

  defp save_gender(socket, :edit, gender_params) do
    case Enum.update_gender(socket.assigns.gender, gender_params) do
      {:ok, _gender} ->
        {:noreply,
         socket
         |> put_flash(:info, "Gender updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_gender(socket, :new, gender_params) do
    case Enum.create_gender(gender_params) do
      {:ok, _gender} ->
        {:noreply,
         socket
         |> put_flash(:info, "Gender created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end

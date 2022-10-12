defmodule TempWeb.TrainingTypeLive.FormComponent do
  use TempWeb, :live_component

  alias Temp.Enum

  @impl true
  def update(%{training_type: training_type} = assigns, socket) do
    changeset = Enum.change_training_type(training_type)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"training_type" => trainingtype_params}, socket) do
    changeset =
      socket.assigns.training_type
      |> Enum.change_training_type(trainingtype_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"training_type" => trainingtype_params}, socket) do
    save_training_type(socket, socket.assigns.action, trainingtype_params)
  end

  defp save_training_type(socket, :edit, trainingtype_params) do
    case Enum.update_training_type(socket.assigns.training_type, trainingtype_params) do
      {:ok, _trainingtype} ->
        {:noreply,
         socket
         |> put_flash(:info, "Training type updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_training_type(socket, :new, trainingtype_params) do
    case Enum.create_training_type(trainingtype_params) do
      {:ok, _trainingtype} ->
        {:noreply,
         socket
         |> put_flash(:info, "Training type created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end

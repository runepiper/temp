defmodule Temp.Accounts.Role do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query
  alias Temp.Accounts.Role

  schema "roles" do
    field :role, :string
  end

  @doc false
  def changeset(role, attrs) do
    role
    |> cast(attrs, [:role])
    |> validate_required([:role])
  end

  #alpabetical sort function
  @doc false
  def alphabetical(query) do
    from c in query, order_by: c.role
  end
end
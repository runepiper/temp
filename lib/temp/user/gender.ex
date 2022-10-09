defmodule Temp.Accounts.Gender do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query
  alias Temp.Accounts.Gender

  schema "genders" do
    field :gender, :string
  end

  @doc false
  def changeset(gender, attrs) do
    gender
    |> cast(attrs, [:gender])
    |> validate_required([:gender])
  end

  #alpabetical sort function
  @doc false
  def alphabetical(query) do
    from c in query, order_by: c.gender
  end
end

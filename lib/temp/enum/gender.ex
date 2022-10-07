defmodule Temp.Enum.Gender do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  schema "genders" do
    field :gender, :string

    # relation for sport & users (not working)
    has_many :user, Temp.Accounts.User

    timestamps()
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

defmodule PlateSlate.Ordering.Order do
  use Ecto.Schema
  import Ecto.Changeset
  alias __MODULE__

  schema "orders" do
    field :customer_number, :integer
    field :ordered_at, :utc_datetime
    field :state, :string

    embeds_many :items, PlateSlate.Ordering.Item

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(%Order{} = order, attrs) do
    order
    |> cast(attrs, [:customer_number, :ordered_at, :state])
    |> cast_embed(:items)
  end
end

defmodule PlateSlate.Menu.ItemTag do
  use Ecto.Schema
  import Ecto.Changeset
  alias __MODULE__

  schema "item_tags" do
    field :name, :string
    field :description, :string

    many_to_many :items, PlateSlate.Menu.Item, join_through: "items_taggins"

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(%ItemTag{} = item_tag, attrs) do
    item_tag
    |> cast(attrs, [:name, :description])
    |> validate_required([:name])
  end
end

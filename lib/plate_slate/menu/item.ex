defmodule PlateSlate.Menu.Item do
  use Ecto.Schema
  import Ecto.Changeset
  alias __MODULE__

  schema "items" do
    field :name, :string
    field :description, :string
    field :price, :decimal
    field :added_on, :date

    belongs_to :category, PlateSlate.Menu.Category

    many_to_many :tags, PlateSlate.Menu.ItemTag, join_through: "items_taggings"

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(%Item{} = item, attrs) do
    item
    |> cast(attrs, [:name, :description, :price, :added_on])
    |> validate_required([:name, :price])
    |> foreign_key_constraint(:category)
  end
end

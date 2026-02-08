defmodule PlateSlateWeb.Schema.MenuTypes do
  use Absinthe.Schema.Notation
  alias PlateSlateWeb.Resolvers

  @desc "Filtering options for menu item list"
  input_object :menu_item_filter do
    @desc "Matching a name"
    field :name, :string
    @desc "Matching a cotegory name"
    field :category, :string
    @desc "Matching a tag"
    field :tag, :string
    @desc "Priced above a value"
    field :priced_above, :float
    @desc "Priced below a value"
    field :priced_below, :float
  end

  object :menu_item do
    field :id, :id
    field :name, :string
    field :description, :string
  end

  object :category do
    field :name, :string
    field :description, :string
  end

end

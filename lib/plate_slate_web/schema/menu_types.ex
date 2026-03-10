defmodule PlateSlateWeb.Schema.MenuTypes do
  use Absinthe.Schema.Notation
  alias PlateSlateWeb.Resolvers
  alias PlateSlate.Menu

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
    interfaces([:search_result])
    field :id, :id
    field :name, :string
    field :description, :string
    field :price, :decimal
    field :allergy_info, list_of(:allergy_info)
  end

  object :allergy_info do
    field :allergen, :string
    field :severity, :string
  end

  object :menu_item_result do
    field :menu_item, :menu_item
    field :errors, list_of(:input_error)
  end

  object :category do
    interfaces([:search_result])
    field :name, :string
    field :description, :string

    field :items, list_of(:menu_item) do
      resolve(&Resolvers.Menu.items_for_category/3)
    end
  end

  interface :search_result do
    field :name, :string

    resolve_type(fn
      %Menu.Item{}, _ -> :menu_item
      %Menu.Category{}, _ -> :category
      _, _ -> nil
    end)
  end
end

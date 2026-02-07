defmodule PlateSlateWeb.Schema do
  use Absinthe.Schema
  alias PlateSlateWeb.Resolvers

    import_types __MODULE__.MenuTypes

  enum :sort_order do
    value(:asc)
    value(:desc)
  end

  scalar :date do
    parse fn input ->
      case Date.from_iso8601(input.value) do
        {:ok, date} -> {:ok, date}
        _ -> :error
      end
    end
    serialize fn date ->
      Date.to_iso8601(date)
    end
  end

  query do
    @desc "The list of available items on the menu"
    field :menu_items, list_of(:menu_item) do
      arg(:filter, :menu_item_filter)
      arg(:order, :sort_order, default_value: :asc)
      resolve(&Resolvers.Menu.menu_items/3)
    end
  end

end

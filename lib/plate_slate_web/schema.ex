defmodule PlateSlateWeb.Schema do
  use Absinthe.Schema
  alias PlateSlateWeb.Resolvers
  alias PlateSlate.Menu

  import_types(__MODULE__.MenuTypes)

  enum :sort_order do
    value(:asc)
    value(:desc)
  end

  scalar :date do
    parse(fn input ->
      case Date.from_iso8601(input.value) do
        {:ok, date} -> {:ok, date}
        _ -> :error
      end
    end)

    serialize(fn date ->
      Date.to_iso8601(date)
    end)
  end

  object :menu_queries do
    field :menu_items, list_of(:menu_item) do
      arg(:filter, :menu_item_filter)
      arg(:order, :sort_order, default_value: :asc)
      resolve(&Resolvers.Menu.menu_items/3)
    end
  end

  object :search_query do
    field :search, list_of(search_result) do
      arg(:matching, non_null(:string))
      resolve(&Resolvers.Menu.search/3)
    end
  end
    
  union :search_result do
    types([:menu_item, :category])

    resolve_type(fn
      %Menu.Item{}, _ -> :menu_item
      %Menu.Category{}, _ -> :category
      _, _ -> nil
    end)
  end

  query do
    import_fields :menu_queries
    import_fields :search_query
  end
end

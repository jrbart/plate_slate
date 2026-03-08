defmodule PlateSlateWeb.Schema do
  use Absinthe.Schema
  alias PlateSlateWeb.Resolvers
  alias PlateSlateWeb.Schema.Middleware

  def middleware(middleware, _field, %{identifier: :mutation}) do
    middleware ++ [Middleware.ChangesetErrors]
  end

  def middleware(middleware, _field, _object) do
    middleware
  end

  import_types(__MODULE__.MenuTypes)
  import_types(__MODULE__.OrderingTypes)

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

  scalar :decimal do
    parse(fn
      %{value: value} ->
        {:ok, Decimal.new(value)}

      _ ->
        :error
    end)

    serialize(&to_string/1)
  end

  input_object :menu_item_input do
    field :name, non_null(:string)
    field :description, :string
    field :price, non_null(:decimal)
    field :category_id, non_null(:id)
  end

  @desc "An error encountered trying to persist input"
  object :input_error do
    field :key, non_null(:string)
    field :message, non_null(:string)
  end

  object :create_menu_item_query do
    field :create_menu_item, :menu_item_result do
      arg(:input, non_null(:menu_item_input))
      resolve(&Resolvers.Menu.create_item/3)
    end
  end

  mutation do
    import_fields(:create_menu_item_query)

    field :place_order, :order_result do
      arg(:input, non_null(:place_order_input))
      resolve(&Resolvers.Ordering.place_order/3)
    end

    import_fields(:order_queries)
  end

  object :menu_queries do
    field :menu_items, list_of(:menu_item) do
      arg(:filter, :menu_item_filter)
      arg(:order, :sort_order, default_value: :asc)
      resolve(&Resolvers.Menu.menu_items/3)
    end
  end

  object :search_query do
    field :search, list_of(:search_result) do
      arg(:matching, non_null(:string))
      resolve(&Resolvers.Menu.search/3)
    end
  end

  object :order_queries do
    field :ready_order, :order_result do
      arg(:id, non_null(:id))
      resolve(&Resolvers.Ordering.ready_order/3)
    end

    field :complete_order, :order_result do
      arg(:id, non_null(:id))
      resolve(&Resolvers.Ordering.complete_order/3)
    end
  end

  query do
    import_fields(:menu_queries)
    import_fields(:search_query)
  end

  subscription do
    field :new_order, :order do
      config(fn _args, _info -> {:ok, topic: "*"} end)
      # published by :place_order
    end

    field :update_order, :order do
      arg(:id, non_null(:id))
      config(fn args, _info -> {:ok, topic: args.id} end)

      trigger([:ready_order, :complete_order],
        topic: fn
          %{order: order} -> [order.id]
          # Errors are not published 
          _ -> []
        end
      )

      resolve(fn %{order: order}, _, _ -> {:ok, order} end)
    end
  end
end

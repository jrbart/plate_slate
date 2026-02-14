defmodule PlateSlateWeb.Schema do
  def plugins() do
    Absinthe.Plugin.defaults()
  end

  def middleware(middleware, _field, _object) do
    middleware
  end

  def hydrate(_node, _ancestors) do
    []
  end

  def context(context) do
    context
  end

  def __absinthe_types__(group) do
    Absinthe.Schema.Compiled.__absinthe_types__(PlateSlateWeb.Schema, group)
  end

  def __absinthe_types__() do
    Absinthe.Schema.Compiled.__absinthe_types__(PlateSlateWeb.Schema)
  end

  def __absinthe_type__(name) do
    Absinthe.Schema.Compiled.__absinthe_type__(PlateSlateWeb.Schema, name)
  end

  def __absinthe_schema_provider__() do
    Absinthe.Schema.Compiled
  end

  def __absinthe_schema_declaration__() do
    Absinthe.Schema.Compiled.__absinthe_schema_declaration__(PlateSlateWeb.Schema)
  end

  def __absinthe_prototype_schema__() do
    Absinthe.Schema.Prototype
  end

  def __absinthe_pipeline_modifiers__() do
    :erlang.++([Absinthe.Schema.Compiled], [])
  end

  def __absinthe_lookup__(name) do
    __absinthe_type__(name)
  end

  def __absinthe_interface_implementors__() do
    Absinthe.Schema.Compiled.__absinthe_interface_implementors__(PlateSlateWeb.Schema)
  end

  def __absinthe_function__({Absinthe.Blueprint.Schema.ScalarTypeDefinition, :date}, :serialize) do
    fn date -> Date.to_iso8601(date) end
  end

  def __absinthe_function__({Absinthe.Blueprint.Schema.ScalarTypeDefinition, :date}, :parse) do
    fn input ->
      case Date.from_iso8601(input.value) do
        {:ok, date} -> {:ok, date}
        _ -> :error
      end
    end
  end

  def __absinthe_function__(
        {Absinthe.Blueprint.Schema.FieldDefinition, {:menu_queries, :menu_items}},
        :config
      ) do
    nil
  end

  def __absinthe_function__(
        {Absinthe.Blueprint.Schema.FieldDefinition, {:menu_queries, :menu_items}},
        :complexity
      ) do
    nil
  end

  def __absinthe_function__(
        {Absinthe.Blueprint.Schema.FieldDefinition, {:menu_queries, :menu_items}},
        :middleware
      ) do
    [{{Absinthe.Resolution, :call}, &PlateSlateWeb.Resolvers.Menu.menu_items/3}]
  end

  def __absinthe_function__(
        {Absinthe.Blueprint.Schema.FieldDefinition, {:menu_queries, :menu_items}},
        :triggers
      ) do
    %{}
  end

  def __absinthe_function__(
        {Absinthe.Blueprint.Schema.ObjectTypeDefinition, :menu_queries},
        :is_type_of
      ) do
    nil
  end

  def __absinthe_function__(
        {Absinthe.Blueprint.Schema.FieldDefinition, {:search_query, :search}},
        :config
      ) do
    nil
  end

  def __absinthe_function__(
        {Absinthe.Blueprint.Schema.FieldDefinition, {:search_query, :search}},
        :complexity
      ) do
    nil
  end

  def __absinthe_function__(
        {Absinthe.Blueprint.Schema.FieldDefinition, {:search_query, :search}},
        :middleware
      ) do
    [{{Absinthe.Resolution, :call}, &PlateSlateWeb.Resolvers.Menu.search/3}]
  end

  def __absinthe_function__(
        {Absinthe.Blueprint.Schema.FieldDefinition, {:search_query, :search}},
        :triggers
      ) do
    %{}
  end

  def __absinthe_function__(
        {Absinthe.Blueprint.Schema.ObjectTypeDefinition, :search_query},
        :is_type_of
      ) do
    nil
  end

  def __absinthe_function__({Absinthe.Blueprint.Schema.ObjectTypeDefinition, :query}, :is_type_of) do
    nil
  end

  def __absinthe_function__(
        {Absinthe.Blueprint.Schema.ScalarTypeDefinition, :decimal},
        :serialize
      ) do
    fn capture -> String.Chars.to_string(capture) end
  end

  def __absinthe_function__({Absinthe.Blueprint.Schema.ScalarTypeDefinition, :decimal}, :parse) do
    fn
      %{value: value}, _ -> Decimal.parse(value)
      _, _ -> :error
    end
  end

  def __absinthe_function__(
        {Absinthe.Blueprint.Schema.FieldDefinition, {:menu_item_input, :category}},
        :config
      ) do
    nil
  end

  def __absinthe_function__(
        {Absinthe.Blueprint.Schema.FieldDefinition, {:menu_item_input, :category}},
        :complexity
      ) do
    nil
  end

  def __absinthe_function__(
        {Absinthe.Blueprint.Schema.FieldDefinition, {:menu_item_input, :category}},
        :middleware
      ) do
    []
  end

  def __absinthe_function__(
        {Absinthe.Blueprint.Schema.FieldDefinition, {:menu_item_input, :category}},
        :triggers
      ) do
    %{}
  end

  def __absinthe_function__(
        {Absinthe.Blueprint.Schema.FieldDefinition, {:menu_item_input, :price}},
        :config
      ) do
    nil
  end

  def __absinthe_function__(
        {Absinthe.Blueprint.Schema.FieldDefinition, {:menu_item_input, :price}},
        :complexity
      ) do
    nil
  end

  def __absinthe_function__(
        {Absinthe.Blueprint.Schema.FieldDefinition, {:menu_item_input, :price}},
        :middleware
      ) do
    []
  end

  def __absinthe_function__(
        {Absinthe.Blueprint.Schema.FieldDefinition, {:menu_item_input, :price}},
        :triggers
      ) do
    %{}
  end

  def __absinthe_function__(
        {Absinthe.Blueprint.Schema.FieldDefinition, {:menu_item_input, :description}},
        :config
      ) do
    nil
  end

  def __absinthe_function__(
        {Absinthe.Blueprint.Schema.FieldDefinition, {:menu_item_input, :description}},
        :complexity
      ) do
    nil
  end

  def __absinthe_function__(
        {Absinthe.Blueprint.Schema.FieldDefinition, {:menu_item_input, :description}},
        :middleware
      ) do
    []
  end

  def __absinthe_function__(
        {Absinthe.Blueprint.Schema.FieldDefinition, {:menu_item_input, :description}},
        :triggers
      ) do
    %{}
  end

  def __absinthe_function__(
        {Absinthe.Blueprint.Schema.FieldDefinition, {:menu_item_input, :name}},
        :config
      ) do
    nil
  end

  def __absinthe_function__(
        {Absinthe.Blueprint.Schema.FieldDefinition, {:menu_item_input, :name}},
        :complexity
      ) do
    nil
  end

  def __absinthe_function__(
        {Absinthe.Blueprint.Schema.FieldDefinition, {:menu_item_input, :name}},
        :middleware
      ) do
    []
  end

  def __absinthe_function__(
        {Absinthe.Blueprint.Schema.FieldDefinition, {:menu_item_input, :name}},
        :triggers
      ) do
    %{}
  end

  def __absinthe_function__(
        {Absinthe.Blueprint.Schema.FieldDefinition, {:create_menu_item_query, :create_menu_item}},
        :config
      ) do
    nil
  end

  def __absinthe_function__(
        {Absinthe.Blueprint.Schema.FieldDefinition, {:create_menu_item_query, :create_menu_item}},
        :complexity
      ) do
    nil
  end

  def __absinthe_function__(
        {Absinthe.Blueprint.Schema.FieldDefinition, {:create_menu_item_query, :create_menu_item}},
        :middleware
      ) do
    [{{Absinthe.Resolution, :call}, &PlateSlateWeb.Resolvers.Menu.create_item/3}]
  end

  def __absinthe_function__(
        {Absinthe.Blueprint.Schema.FieldDefinition, {:create_menu_item_query, :create_menu_item}},
        :triggers
      ) do
    %{}
  end

  def __absinthe_function__(
        {Absinthe.Blueprint.Schema.ObjectTypeDefinition, :create_menu_item_query},
        :is_type_of
      ) do
    nil
  end

  def __absinthe_function__(
        {Absinthe.Blueprint.Schema.ObjectTypeDefinition, :mutation},
        :is_type_of
      ) do
    nil
  end

  def __absinthe_directives__() do
    Absinthe.Schema.Compiled.__absinthe_directives__(PlateSlateWeb.Schema)
  end

  def __absinthe_directive__(name) do
    Absinthe.Schema.Compiled.__absinthe_directive__(PlateSlateWeb.Schema, name)
  end

  def __absinthe_blueprint__() do
    %{
      __struct__: Absinthe.Blueprint,
      adapter: nil,
      directives: [],
      errors: [],
      execution: %{
        __struct__: Absinthe.Blueprint.Execution,
        acc: %{},
        adapter: nil,
        context: %{},
        fields_cache: %{},
        fragments: %{},
        result: nil,
        root_value: %{},
        schema: nil,
        validation_errors: []
      },
      flags: %{},
      fragments: [],
      initial_phases: [],
      input: nil,
      name: nil,
      operations: [],
      prototype_schema: nil,
      result: %{},
      schema: PlateSlateWeb.Schema,
      schema_definitions: [
        %{
          __private__: [],
          __reference__: %{
            location: %{
              file: "/Users/randy/dev/ex/le/absinthe/plate_slate/lib/plate_slate_web/schema.ex",
              line: 0
            }
          },
          __struct__: Absinthe.Blueprint.Schema.SchemaDefinition,
          description: nil,
          directive_artifacts: [],
          directive_definitions: [],
          directive_imports: [],
          directives: [],
          errors: [],
          flags: %{},
          imports: [{PlateSlateWeb.Schema.MenuTypes, []}],
          module: PlateSlateWeb.Schema,
          schema_declaration: nil,
          source_location: nil,
          type_artifacts: [],
          type_definitions: [
            %{
              __private__: [],
              __reference__: %{
                location: %{
                  file:
                    "/Users/randy/dev/ex/le/absinthe/plate_slate/lib/plate_slate_web/schema.ex",
                  line: 69
                },
                module: PlateSlateWeb.Schema
              },
              __struct__: Absinthe.Blueprint.Schema.ObjectTypeDefinition,
              description: nil,
              directives: [],
              errors: [],
              fields: [],
              flags: %{},
              identifier: :mutation,
              imports: [create_menu_item_query: []],
              interface_blueprints: [],
              interfaces: [],
              is_type_of:
                {:ref, PlateSlateWeb.Schema,
                 {Absinthe.Blueprint.Schema.ObjectTypeDefinition, :mutation}},
              module: PlateSlateWeb.Schema,
              name: "RootMutationType",
              source_location: nil
            },
            %{
              __private__: [],
              __reference__: %{
                location: %{
                  file:
                    "/Users/randy/dev/ex/le/absinthe/plate_slate/lib/plate_slate_web/schema.ex",
                  line: 62
                },
                module: PlateSlateWeb.Schema
              },
              __struct__: Absinthe.Blueprint.Schema.ObjectTypeDefinition,
              description: nil,
              directives: [],
              errors: [],
              fields: [
                %{
                  __private__: [],
                  __reference__: %{
                    location: %{
                      file:
                        "/Users/randy/dev/ex/le/absinthe/plate_slate/lib/plate_slate_web/schema.ex",
                      line: 63
                    },
                    module: PlateSlateWeb.Schema
                  },
                  __struct__: Absinthe.Blueprint.Schema.FieldDefinition,
                  arguments: [
                    %{
                      __private__: [],
                      __reference__: %{
                        location: %{
                          file:
                            "/Users/randy/dev/ex/le/absinthe/plate_slate/lib/plate_slate_web/schema.ex",
                          line: 64
                        },
                        module: PlateSlateWeb.Schema
                      },
                      __struct__: Absinthe.Blueprint.Schema.InputValueDefinition,
                      default_value: nil,
                      default_value_blueprint: nil,
                      deprecation: nil,
                      description: nil,
                      directives: [],
                      errors: [],
                      flags: %{},
                      identifier: :input,
                      module: PlateSlateWeb.Schema,
                      name: "input",
                      placement: :argument_definition,
                      source_location: nil,
                      type: %{
                        __struct__: Absinthe.Blueprint.TypeReference.NonNull,
                        errors: [],
                        of_type: :menu_item_input
                      }
                    }
                  ],
                  complexity:
                    {:ref, PlateSlateWeb.Schema,
                     {Absinthe.Blueprint.Schema.FieldDefinition,
                      {:create_menu_item_query, :create_menu_item}}},
                  config:
                    {:ref, PlateSlateWeb.Schema,
                     {Absinthe.Blueprint.Schema.FieldDefinition,
                      {:create_menu_item_query, :create_menu_item}}},
                  default_value: nil,
                  deprecation: nil,
                  description: nil,
                  directives: [],
                  errors: [],
                  flags: %{},
                  function_ref: {:create_menu_item_query, :create_menu_item},
                  identifier: :create_menu_item,
                  middleware: [
                    {:ref, PlateSlateWeb.Schema,
                     {Absinthe.Blueprint.Schema.FieldDefinition,
                      {:create_menu_item_query, :create_menu_item}}}
                  ],
                  module: PlateSlateWeb.Schema,
                  name: "create_menu_item",
                  source_location: nil,
                  triggers:
                    {:ref, PlateSlateWeb.Schema,
                     {Absinthe.Blueprint.Schema.FieldDefinition,
                      {:create_menu_item_query, :create_menu_item}}},
                  type: :menu_item
                }
              ],
              flags: %{},
              identifier: :create_menu_item_query,
              imports: [],
              interface_blueprints: [],
              interfaces: [],
              is_type_of:
                {:ref, PlateSlateWeb.Schema,
                 {Absinthe.Blueprint.Schema.ObjectTypeDefinition, :create_menu_item_query}},
              module: PlateSlateWeb.Schema,
              name: "CreateMenuItemQuery",
              source_location: nil
            },
            %{
              __private__: [],
              __reference__: %{
                location: %{
                  file:
                    "/Users/randy/dev/ex/le/absinthe/plate_slate/lib/plate_slate_web/schema.ex",
                  line: 55
                },
                module: PlateSlateWeb.Schema
              },
              __struct__: Absinthe.Blueprint.Schema.InputObjectTypeDefinition,
              description: nil,
              directives: [],
              errors: [],
              fields: [
                %{
                  __private__: [],
                  __reference__: %{
                    location: %{
                      file:
                        "/Users/randy/dev/ex/le/absinthe/plate_slate/lib/plate_slate_web/schema.ex",
                      line: 56
                    },
                    module: PlateSlateWeb.Schema
                  },
                  __struct__: Absinthe.Blueprint.Schema.FieldDefinition,
                  arguments: [],
                  complexity:
                    {:ref, PlateSlateWeb.Schema,
                     {Absinthe.Blueprint.Schema.FieldDefinition, {:menu_item_input, :name}}},
                  config:
                    {:ref, PlateSlateWeb.Schema,
                     {Absinthe.Blueprint.Schema.FieldDefinition, {:menu_item_input, :name}}},
                  default_value: nil,
                  deprecation: nil,
                  description: nil,
                  directives: [],
                  errors: [],
                  flags: %{},
                  function_ref: {:menu_item_input, :name},
                  identifier: :name,
                  middleware: [
                    {:ref, PlateSlateWeb.Schema,
                     {Absinthe.Blueprint.Schema.FieldDefinition, {:menu_item_input, :name}}}
                  ],
                  module: PlateSlateWeb.Schema,
                  name: "name",
                  source_location: nil,
                  triggers:
                    {:ref, PlateSlateWeb.Schema,
                     {Absinthe.Blueprint.Schema.FieldDefinition, {:menu_item_input, :name}}},
                  type: %{
                    __struct__: Absinthe.Blueprint.TypeReference.NonNull,
                    errors: [],
                    of_type: :string
                  }
                },
                %{
                  __private__: [],
                  __reference__: %{
                    location: %{
                      file:
                        "/Users/randy/dev/ex/le/absinthe/plate_slate/lib/plate_slate_web/schema.ex",
                      line: 57
                    },
                    module: PlateSlateWeb.Schema
                  },
                  __struct__: Absinthe.Blueprint.Schema.FieldDefinition,
                  arguments: [],
                  complexity:
                    {:ref, PlateSlateWeb.Schema,
                     {Absinthe.Blueprint.Schema.FieldDefinition, {:menu_item_input, :description}}},
                  config:
                    {:ref, PlateSlateWeb.Schema,
                     {Absinthe.Blueprint.Schema.FieldDefinition, {:menu_item_input, :description}}},
                  default_value: nil,
                  deprecation: nil,
                  description: nil,
                  directives: [],
                  errors: [],
                  flags: %{},
                  function_ref: {:menu_item_input, :description},
                  identifier: :description,
                  middleware: [
                    {:ref, PlateSlateWeb.Schema,
                     {Absinthe.Blueprint.Schema.FieldDefinition, {:menu_item_input, :description}}}
                  ],
                  module: PlateSlateWeb.Schema,
                  name: "description",
                  source_location: nil,
                  triggers:
                    {:ref, PlateSlateWeb.Schema,
                     {Absinthe.Blueprint.Schema.FieldDefinition, {:menu_item_input, :description}}},
                  type: :string
                },
                %{
                  __private__: [],
                  __reference__: %{
                    location: %{
                      file:
                        "/Users/randy/dev/ex/le/absinthe/plate_slate/lib/plate_slate_web/schema.ex",
                      line: 58
                    },
                    module: PlateSlateWeb.Schema
                  },
                  __struct__: Absinthe.Blueprint.Schema.FieldDefinition,
                  arguments: [],
                  complexity:
                    {:ref, PlateSlateWeb.Schema,
                     {Absinthe.Blueprint.Schema.FieldDefinition, {:menu_item_input, :price}}},
                  config:
                    {:ref, PlateSlateWeb.Schema,
                     {Absinthe.Blueprint.Schema.FieldDefinition, {:menu_item_input, :price}}},
                  default_value: nil,
                  deprecation: nil,
                  description: nil,
                  directives: [],
                  errors: [],
                  flags: %{},
                  function_ref: {:menu_item_input, :price},
                  identifier: :price,
                  middleware: [
                    {:ref, PlateSlateWeb.Schema,
                     {Absinthe.Blueprint.Schema.FieldDefinition, {:menu_item_input, :price}}}
                  ],
                  module: PlateSlateWeb.Schema,
                  name: "price",
                  source_location: nil,
                  triggers:
                    {:ref, PlateSlateWeb.Schema,
                     {Absinthe.Blueprint.Schema.FieldDefinition, {:menu_item_input, :price}}},
                  type: %{
                    __struct__: Absinthe.Blueprint.TypeReference.NonNull,
                    errors: [],
                    of_type: :decimal
                  }
                },
                %{
                  __private__: [],
                  __reference__: %{
                    location: %{
                      file:
                        "/Users/randy/dev/ex/le/absinthe/plate_slate/lib/plate_slate_web/schema.ex",
                      line: 59
                    },
                    module: PlateSlateWeb.Schema
                  },
                  __struct__: Absinthe.Blueprint.Schema.FieldDefinition,
                  arguments: [],
                  complexity:
                    {:ref, PlateSlateWeb.Schema,
                     {Absinthe.Blueprint.Schema.FieldDefinition, {:menu_item_input, :category}}},
                  config:
                    {:ref, PlateSlateWeb.Schema,
                     {Absinthe.Blueprint.Schema.FieldDefinition, {:menu_item_input, :category}}},
                  default_value: nil,
                  deprecation: nil,
                  description: nil,
                  directives: [],
                  errors: [],
                  flags: %{},
                  function_ref: {:menu_item_input, :category},
                  identifier: :category,
                  middleware: [
                    {:ref, PlateSlateWeb.Schema,
                     {Absinthe.Blueprint.Schema.FieldDefinition, {:menu_item_input, :category}}}
                  ],
                  module: PlateSlateWeb.Schema,
                  name: "category",
                  source_location: nil,
                  triggers:
                    {:ref, PlateSlateWeb.Schema,
                     {Absinthe.Blueprint.Schema.FieldDefinition, {:menu_item_input, :category}}},
                  type: %{
                    __struct__: Absinthe.Blueprint.TypeReference.NonNull,
                    errors: [],
                    of_type: :id
                  }
                }
              ],
              flags: %{},
              identifier: :menu_item_input,
              imports: [],
              module: PlateSlateWeb.Schema,
              name: "MenuItemInput",
              source_location: nil
            },
            %{
              __private__: [],
              __reference__: %{
                location: %{
                  file:
                    "/Users/randy/dev/ex/le/absinthe/plate_slate/lib/plate_slate_web/schema.ex",
                  line: 45
                },
                module: PlateSlateWeb.Schema
              },
              __struct__: Absinthe.Blueprint.Schema.ScalarTypeDefinition,
              description: nil,
              directives: [],
              errors: [],
              flags: %{},
              identifier: :decimal,
              module: PlateSlateWeb.Schema,
              name: "Decimal",
              open_ended: false,
              parse:
                {:ref, PlateSlateWeb.Schema,
                 {Absinthe.Blueprint.Schema.ScalarTypeDefinition, :decimal}},
              serialize:
                {:ref, PlateSlateWeb.Schema,
                 {Absinthe.Blueprint.Schema.ScalarTypeDefinition, :decimal}},
              source_location: nil
            },
            %{
              __private__: [],
              __reference__: %{
                location: %{
                  file:
                    "/Users/randy/dev/ex/le/absinthe/plate_slate/lib/plate_slate_web/schema.ex",
                  line: 40
                },
                module: PlateSlateWeb.Schema
              },
              __struct__: Absinthe.Blueprint.Schema.ObjectTypeDefinition,
              description: nil,
              directives: [],
              errors: [],
              fields: [],
              flags: %{},
              identifier: :query,
              imports: [search_query: [], menu_queries: []],
              interface_blueprints: [],
              interfaces: [],
              is_type_of:
                {:ref, PlateSlateWeb.Schema,
                 {Absinthe.Blueprint.Schema.ObjectTypeDefinition, :query}},
              module: PlateSlateWeb.Schema,
              name: "RootQueryType",
              source_location: nil
            },
            %{
              __private__: [],
              __reference__: %{
                location: %{
                  file:
                    "/Users/randy/dev/ex/le/absinthe/plate_slate/lib/plate_slate_web/schema.ex",
                  line: 33
                },
                module: PlateSlateWeb.Schema
              },
              __struct__: Absinthe.Blueprint.Schema.ObjectTypeDefinition,
              description: nil,
              directives: [],
              errors: [],
              fields: [
                %{
                  __private__: [],
                  __reference__: %{
                    location: %{
                      file:
                        "/Users/randy/dev/ex/le/absinthe/plate_slate/lib/plate_slate_web/schema.ex",
                      line: 34
                    },
                    module: PlateSlateWeb.Schema
                  },
                  __struct__: Absinthe.Blueprint.Schema.FieldDefinition,
                  arguments: [
                    %{
                      __private__: [],
                      __reference__: %{
                        location: %{
                          file:
                            "/Users/randy/dev/ex/le/absinthe/plate_slate/lib/plate_slate_web/schema.ex",
                          line: 35
                        },
                        module: PlateSlateWeb.Schema
                      },
                      __struct__: Absinthe.Blueprint.Schema.InputValueDefinition,
                      default_value: nil,
                      default_value_blueprint: nil,
                      deprecation: nil,
                      description: nil,
                      directives: [],
                      errors: [],
                      flags: %{},
                      identifier: :matching,
                      module: PlateSlateWeb.Schema,
                      name: "matching",
                      placement: :argument_definition,
                      source_location: nil,
                      type: %{
                        __struct__: Absinthe.Blueprint.TypeReference.NonNull,
                        errors: [],
                        of_type: :string
                      }
                    }
                  ],
                  complexity:
                    {:ref, PlateSlateWeb.Schema,
                     {Absinthe.Blueprint.Schema.FieldDefinition, {:search_query, :search}}},
                  config:
                    {:ref, PlateSlateWeb.Schema,
                     {Absinthe.Blueprint.Schema.FieldDefinition, {:search_query, :search}}},
                  default_value: nil,
                  deprecation: nil,
                  description: nil,
                  directives: [],
                  errors: [],
                  flags: %{},
                  function_ref: {:search_query, :search},
                  identifier: :search,
                  middleware: [
                    {:ref, PlateSlateWeb.Schema,
                     {Absinthe.Blueprint.Schema.FieldDefinition, {:search_query, :search}}}
                  ],
                  module: PlateSlateWeb.Schema,
                  name: "search",
                  source_location: nil,
                  triggers:
                    {:ref, PlateSlateWeb.Schema,
                     {Absinthe.Blueprint.Schema.FieldDefinition, {:search_query, :search}}},
                  type: %{
                    __struct__: Absinthe.Blueprint.TypeReference.List,
                    errors: [],
                    of_type: :search_result
                  }
                }
              ],
              flags: %{},
              identifier: :search_query,
              imports: [],
              interface_blueprints: [],
              interfaces: [],
              is_type_of:
                {:ref, PlateSlateWeb.Schema,
                 {Absinthe.Blueprint.Schema.ObjectTypeDefinition, :search_query}},
              module: PlateSlateWeb.Schema,
              name: "SearchQuery",
              source_location: nil
            },
            %{
              __private__: [],
              __reference__: %{
                location: %{
                  file:
                    "/Users/randy/dev/ex/le/absinthe/plate_slate/lib/plate_slate_web/schema.ex",
                  line: 25
                },
                module: PlateSlateWeb.Schema
              },
              __struct__: Absinthe.Blueprint.Schema.ObjectTypeDefinition,
              description: nil,
              directives: [],
              errors: [],
              fields: [
                %{
                  __private__: [],
                  __reference__: %{
                    location: %{
                      file:
                        "/Users/randy/dev/ex/le/absinthe/plate_slate/lib/plate_slate_web/schema.ex",
                      line: 26
                    },
                    module: PlateSlateWeb.Schema
                  },
                  __struct__: Absinthe.Blueprint.Schema.FieldDefinition,
                  arguments: [
                    %{
                      __private__: [],
                      __reference__: %{
                        location: %{
                          file:
                            "/Users/randy/dev/ex/le/absinthe/plate_slate/lib/plate_slate_web/schema.ex",
                          line: 27
                        },
                        module: PlateSlateWeb.Schema
                      },
                      __struct__: Absinthe.Blueprint.Schema.InputValueDefinition,
                      default_value: nil,
                      default_value_blueprint: nil,
                      deprecation: nil,
                      description: nil,
                      directives: [],
                      errors: [],
                      flags: %{},
                      identifier: :filter,
                      module: PlateSlateWeb.Schema,
                      name: "filter",
                      placement: :argument_definition,
                      source_location: nil,
                      type: :menu_item_filter
                    },
                    %{
                      __private__: [],
                      __reference__: %{
                        location: %{
                          file:
                            "/Users/randy/dev/ex/le/absinthe/plate_slate/lib/plate_slate_web/schema.ex",
                          line: 28
                        },
                        module: PlateSlateWeb.Schema
                      },
                      __struct__: Absinthe.Blueprint.Schema.InputValueDefinition,
                      default_value: :asc,
                      default_value_blueprint: nil,
                      deprecation: nil,
                      description: nil,
                      directives: [],
                      errors: [],
                      flags: %{},
                      identifier: :order,
                      module: PlateSlateWeb.Schema,
                      name: "order",
                      placement: :argument_definition,
                      source_location: nil,
                      type: :sort_order
                    }
                  ],
                  complexity:
                    {:ref, PlateSlateWeb.Schema,
                     {Absinthe.Blueprint.Schema.FieldDefinition, {:menu_queries, :menu_items}}},
                  config:
                    {:ref, PlateSlateWeb.Schema,
                     {Absinthe.Blueprint.Schema.FieldDefinition, {:menu_queries, :menu_items}}},
                  default_value: nil,
                  deprecation: nil,
                  description: nil,
                  directives: [],
                  errors: [],
                  flags: %{},
                  function_ref: {:menu_queries, :menu_items},
                  identifier: :menu_items,
                  middleware: [
                    {:ref, PlateSlateWeb.Schema,
                     {Absinthe.Blueprint.Schema.FieldDefinition, {:menu_queries, :menu_items}}}
                  ],
                  module: PlateSlateWeb.Schema,
                  name: "menu_items",
                  source_location: nil,
                  triggers:
                    {:ref, PlateSlateWeb.Schema,
                     {Absinthe.Blueprint.Schema.FieldDefinition, {:menu_queries, :menu_items}}},
                  type: %{
                    __struct__: Absinthe.Blueprint.TypeReference.List,
                    errors: [],
                    of_type: :menu_item
                  }
                }
              ],
              flags: %{},
              identifier: :menu_queries,
              imports: [],
              interface_blueprints: [],
              interfaces: [],
              is_type_of:
                {:ref, PlateSlateWeb.Schema,
                 {Absinthe.Blueprint.Schema.ObjectTypeDefinition, :menu_queries}},
              module: PlateSlateWeb.Schema,
              name: "MenuQueries",
              source_location: nil
            },
            %{
              __private__: [],
              __reference__: %{
                location: %{
                  file:
                    "/Users/randy/dev/ex/le/absinthe/plate_slate/lib/plate_slate_web/schema.ex",
                  line: 12
                },
                module: PlateSlateWeb.Schema
              },
              __struct__: Absinthe.Blueprint.Schema.ScalarTypeDefinition,
              description: nil,
              directives: [],
              errors: [],
              flags: %{},
              identifier: :date,
              module: PlateSlateWeb.Schema,
              name: "Date",
              open_ended: false,
              parse:
                {:ref, PlateSlateWeb.Schema,
                 {Absinthe.Blueprint.Schema.ScalarTypeDefinition, :date}},
              serialize:
                {:ref, PlateSlateWeb.Schema,
                 {Absinthe.Blueprint.Schema.ScalarTypeDefinition, :date}},
              source_location: nil
            },
            %{
              __private__: [],
              __reference__: %{
                location: %{
                  file:
                    "/Users/randy/dev/ex/le/absinthe/plate_slate/lib/plate_slate_web/schema.ex",
                  line: 7
                },
                module: PlateSlateWeb.Schema
              },
              __struct__: Absinthe.Blueprint.Schema.EnumTypeDefinition,
              description: nil,
              directives: [],
              errors: [],
              flags: %{},
              identifier: :sort_order,
              module: PlateSlateWeb.Schema,
              name: "SortOrder",
              source_location: nil,
              values: [
                %{
                  __private__: [],
                  __reference__: %{
                    location: %{
                      file:
                        "/Users/randy/dev/ex/le/absinthe/plate_slate/lib/plate_slate_web/schema.ex",
                      line: 8
                    },
                    module: PlateSlateWeb.Schema
                  },
                  __struct__: Absinthe.Blueprint.Schema.EnumValueDefinition,
                  deprecation: nil,
                  description: nil,
                  directives: [],
                  errors: [],
                  flags: %{},
                  identifier: :asc,
                  module: PlateSlateWeb.Schema,
                  name: "ASC",
                  source_location: nil,
                  value: :asc
                },
                %{
                  __private__: [],
                  __reference__: %{
                    location: %{
                      file:
                        "/Users/randy/dev/ex/le/absinthe/plate_slate/lib/plate_slate_web/schema.ex",
                      line: 9
                    },
                    module: PlateSlateWeb.Schema
                  },
                  __struct__: Absinthe.Blueprint.Schema.EnumValueDefinition,
                  deprecation: nil,
                  description: nil,
                  directives: [],
                  errors: [],
                  flags: %{},
                  identifier: :desc,
                  module: PlateSlateWeb.Schema,
                  name: "DESC",
                  source_location: nil,
                  value: :desc
                }
              ]
            }
          ],
          type_extension_imports: [],
          type_extensions: []
        }
      ],
      source: nil,
      telemetry: %{}
    }
  end
end

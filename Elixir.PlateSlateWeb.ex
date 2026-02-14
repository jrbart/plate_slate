defmodule PlateSlateWeb do
  def verified_routes() do
    {:use, [context: PlateSlateWeb, imports: [{1, Kernel}, {2, Kernel}]],
     [
       {:__aliases__, [alias: false], [:Phoenix, :VerifiedRoutes]},
       [
         endpoint: {:__aliases__, [alias: false], [:PlateSlateWeb, :Endpoint]},
         router: {:__aliases__, [alias: false], [:PlateSlateWeb, :Router]},
         statics:
           {{:., [], [{:__aliases__, [alias: false], [:PlateSlateWeb]}, :static_paths]}, [], []}
       ]
     ]}
  end

  def static_paths() do
    ["assets", "fonts", "images", "favicon.ico", "robots.txt"]
  end

  def router() do
    {:__block__, [],
     [
       {:use, [context: PlateSlateWeb, imports: [{1, Kernel}, {2, Kernel}]],
        [{:__aliases__, [alias: false], [:Phoenix, :Router]}, [helpers: false]]},
       {:import, [context: PlateSlateWeb], [{:__aliases__, [alias: false], [:Plug, :Conn]}]},
       {:import, [context: PlateSlateWeb],
        [{:__aliases__, [alias: false], [:Phoenix, :Controller]}]},
       {:import, [context: PlateSlateWeb],
        [{:__aliases__, [alias: false], [:Phoenix, :LiveView, :Router]}]}
     ]}
  end

  def live_view() do
    {:__block__, [],
     [
       {:use, [context: PlateSlateWeb, imports: [{1, Kernel}, {2, Kernel}]],
        [
          {:__aliases__, [alias: false], [:Phoenix, :LiveView]},
          [layout: {{:__aliases__, [alias: false], [:PlateSlateWeb, :Layouts]}, :app}]
        ]},
       :elixir_quote.shallow_validate_ast(html_helpers())
     ]}
  end

  def live_component() do
    {:__block__, [],
     [
       {:use, [context: PlateSlateWeb, imports: [{1, Kernel}, {2, Kernel}]],
        [{:__aliases__, [alias: false], [:Phoenix, :LiveComponent]}]},
       :elixir_quote.shallow_validate_ast(html_helpers())
     ]}
  end

  defp html_helpers() do
    {:__block__, [],
     [
       {:use, [context: PlateSlateWeb, imports: [{1, Kernel}, {2, Kernel}]],
        [
          {:__aliases__, [alias: false], [:Gettext]},
          [backend: {:__aliases__, [alias: false], [:PlateSlateWeb, :Gettext]}]
        ]},
       {:import, [context: PlateSlateWeb], [{:__aliases__, [alias: false], [:Phoenix, :HTML]}]},
       {:import, [context: PlateSlateWeb],
        [{:__aliases__, [alias: false], [:PlateSlateWeb, :CoreComponents]}]},
       {:alias, [context: PlateSlateWeb],
        [{:__aliases__, [alias: false], [:Phoenix, :LiveView, :JS]}]},
       :elixir_quote.shallow_validate_ast(verified_routes())
     ]}
  end

  def html() do
    {:__block__, [],
     [
       {:use, [context: PlateSlateWeb, imports: [{1, Kernel}, {2, Kernel}]],
        [{:__aliases__, [alias: false], [:Phoenix, :Component]}]},
       {:import, [context: PlateSlateWeb],
        [
          {:__aliases__, [alias: false], [:Phoenix, :Controller]},
          [only: [get_csrf_token: 0, view_module: 1, view_template: 1]]
        ]},
       :elixir_quote.shallow_validate_ast(html_helpers())
     ]}
  end

  def controller() do
    {:__block__, [],
     [
       {:use, [context: PlateSlateWeb, imports: [{1, Kernel}, {2, Kernel}]],
        [
          {:__aliases__, [alias: false], [:Phoenix, :Controller]},
          [
            formats: [:html, :json],
            layouts: [html: {:__aliases__, [alias: false], [:PlateSlateWeb, :Layouts]}]
          ]
        ]},
       {:use, [context: PlateSlateWeb, imports: [{1, Kernel}, {2, Kernel}]],
        [
          {:__aliases__, [alias: false], [:Gettext]},
          [backend: {:__aliases__, [alias: false], [:PlateSlateWeb, :Gettext]}]
        ]},
       {:import, [context: PlateSlateWeb], [{:__aliases__, [alias: false], [:Plug, :Conn]}]},
       :elixir_quote.shallow_validate_ast(verified_routes())
     ]}
  end

  def channel() do
    {:use, [context: PlateSlateWeb, imports: [{1, Kernel}, {2, Kernel}]],
     [{:__aliases__, [alias: false], [:Phoenix, :Channel]}]}
  end

  defmacro __using__(which) do
    :erlang.apply(PlateSlateWeb, which, [])
  end
end
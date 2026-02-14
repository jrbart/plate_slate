defmodule Absinthe.Phase.Document.Arguments.Parse do
  def run(input, options) do
    result =
      Absinthe.Blueprint.prewalk(input, fn capture ->
        handle_node(
          capture,
          case options[:context] do
            x when :erlang.orelse(:erlang."=:="(x, false), :erlang."=:="(x, nil)) -> %{}
            x -> x
          end
        )
      end)

    {:ok, result}
  end

  def run(x0) do
    super(x0, [])
  end

  def put_flag(%{flags: _} = node, flag) do
    Absinthe.Blueprint.put_flag(node, flag, Absinthe.Phase.Document.Arguments.Parse)
  end

  def inherit_invalid(%{flags: _} = node, children, add_flag) do
    case Absinthe.Phase.any_invalid?(children) do
      true -> flag_invalid(node, add_flag)
      false -> node
    end
  end

  defp handle_node(%{normalized: nil} = node, _context) do
    node
  end

  defp handle_node(%Absinthe.Blueprint.Input.Value{normalized: normalized} = node, context) do
    case build_value(normalized, node.schema_node, context) do
      {:ok, value} ->
        %{node | data: value}

      :not_leaf_node ->
        node

      {:error, flag} ->
        %{node | normalized: flag_invalid(normalized, flag)}

      {:error, flag, reason} ->
        normalized = flag_invalid(normalized, flag, reason)
        %{node | normalized: normalized}
    end
  end

  defp handle_node(node, _context) do
    node
  end

  def flag_invalid(%{flags: _} = node, flag, reason) do
    flagging = %{
      :invalid => {Absinthe.Phase.Document.Arguments.Parse, reason},
      flag => Absinthe.Phase.Document.Arguments.Parse
    }

    Map.update!(node, :flags, fn capture -> :maps.merge(capture, flagging) end)
  end

  def flag_invalid(%{flags: _} = node, flag) do
    flagging = %{
      :invalid => Absinthe.Phase.Document.Arguments.Parse,
      flag => Absinthe.Phase.Document.Arguments.Parse
    }

    Map.update!(node, :flags, fn capture -> :maps.merge(capture, flagging) end)
  end

  def flag_invalid(%{flags: _} = node) do
    Absinthe.Blueprint.put_flag(node, :invalid, Absinthe.Phase.Document.Arguments.Parse)
  end

  defp build_value(%Absinthe.Blueprint.Input.Null{}, %Absinthe.Type.NonNull{}, _) do
    {:error, :non_null}
  end

  defp build_value(
         %{__struct__: struct} = normalized,
         %Absinthe.Type.Scalar{} = schema_node,
         context
       ) do
    case Absinthe.Type.Scalar.parse(schema_node, normalized, context) do
      :error -> {:error, :bad_parse}
      {:error, reason} -> {:error, :bad_parse, reason}
      {:ok, val} -> {:ok, val}
    end
  end

  defp build_value(
         %Absinthe.Blueprint.Input.Object{} = normalized,
         %Absinthe.Type.Scalar{open_ended: true} = schema_node,
         context
       ) do
    case Absinthe.Type.Scalar.parse(schema_node, normalized, context) do
      :error -> {:error, :bad_parse}
      {:error, reason} -> {:error, :bad_parse, reason}
      {:ok, val} -> {:ok, val}
    end
  end

  defp build_value(_normalized, %Absinthe.Type.Scalar{}, _context) do
    {:error, :bad_parse}
  end

  defp build_value(%{value: value} = _normalized, nil = _schema_node, _context) do
    {:ok, value}
  end

  defp build_value(%Absinthe.Blueprint.Input.Null{}, %Absinthe.Type.Enum{}, _) do
    {:ok, nil}
  end

  defp build_value(normalized, %Absinthe.Type.Enum{} = schema_node, _) do
    case Absinthe.Type.Enum.parse(schema_node, normalized) do
      {:ok, %{value: value}} -> {:ok, value}
      :error -> {:error, :bad_parse}
    end
  end

  defp build_value(normalized, %Absinthe.Type.NonNull{of_type: inner_type}, context) do
    build_value(normalized, inner_type, context)
  end

  defp build_value(%{__struct__: struct}, %Absinthe.Type.InputObject{}, _) do
    {:error, :bad_parse}
  end

  defp build_value(_, _, _) do
    :not_leaf_node
  end
end
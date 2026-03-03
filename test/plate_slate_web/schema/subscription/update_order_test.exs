defmodule PlateSlateWeb.Schema.Subscription.UpdateOrderTest do
  use PlateSlateWeb.SubscriptionCase

  @subscription """
  subscription ($id: ID!) {
    updateOrder(id: $id) { state }
  }
  """
  @mutation """
  mutation ($id: ID!) {
    readyOrder(id: $id) { errors { message } }
  }
  """
  test "subscribe to order updates", %{socket: socket} do
    reuben = menu_item("Reuben")

    {:ok, order1} =
      PlateSlate.Ordering.create_order(%{
        customer_number: 123,
        items: [%{menu_item_id: reuben.id, quantity: 2}]
      })

    {:ok, order2} =
      PlateSlate.Ordering.create_order(%{
        customer_number: 124,
        items: [%{menu_item_id: reuben.id, quantity: 1}]
      })

    push_doc(socket, @subscription, variables: %{"id" => order1.id})
    |> assert_reply(:ok, %{subscriptionId: _sub_ref1})

    push_doc(socket, @subscription, variables: %{"id" => order2.id})
    |> assert_reply(:ok, %{subscriptionId: sub_ref2})

    push_doc(socket, @mutation, variables: %{"id" => order2.id})
    |> assert_reply(:ok, reply)

    refute reply[:errors]
    refute reply[:data]["readyOrder"]["errors"]

    assert_push("subscription:data", push)

    expected = %{
      result: %{data: %{"updateOrder" => %{"state" => "ready"}}},
      subscriptionId: sub_ref2
    }

    assert expected == push
  end
end

defmodule OnlineShop.OrdersTest do
  use OnlineShop.DataCase

  alias OnlineShop.Orders

  describe "orders" do
    alias OnlineShop.Orders.Order

    @valid_attrs %{name: "some name", phone_number: "some phone_number"}
    @update_attrs %{name: "some updated name", phone_number: "some updated phone_number"}
    @invalid_attrs %{name: nil, phone_number: nil}

    def order_fixture(attrs \\ %{}) do
      {:ok, order} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Orders.create_order()

      order
    end

    test "list_orders/0 returns all orders" do
      order = order_fixture()
      assert Orders.list_orders() == [order]
    end

    test "get_order!/1 returns the order with given id" do
      order = order_fixture()
      assert Orders.get_order!(order.id) == order
    end

    test "create_order/1 with valid data creates a order" do
      assert {:ok, %Order{} = order} = Orders.create_order(@valid_attrs)
      assert order.name == "some name"
      assert order.phone_number == "some phone_number"
    end

    test "create_order/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Orders.create_order(@invalid_attrs)
    end

    test "update_order/2 with valid data updates the order" do
      order = order_fixture()
      assert {:ok, %Order{} = order} = Orders.update_order(order, @update_attrs)
      assert order.name == "some updated name"
      assert order.phone_number == "some updated phone_number"
    end

    test "update_order/2 with invalid data returns error changeset" do
      order = order_fixture()
      assert {:error, %Ecto.Changeset{}} = Orders.update_order(order, @invalid_attrs)
      assert order == Orders.get_order!(order.id)
    end

    test "delete_order/1 deletes the order" do
      order = order_fixture()
      assert {:ok, %Order{}} = Orders.delete_order(order)
      assert_raise Ecto.NoResultsError, fn -> Orders.get_order!(order.id) end
    end

    test "change_order/1 returns a order changeset" do
      order = order_fixture()
      assert %Ecto.Changeset{} = Orders.change_order(order)
    end
  end

  describe "orders_items" do
    alias OnlineShop.Orders.Orders_Items

    @valid_attrs %{amount: 42, item_id: "some item_id", order_id: "some order_id"}
    @update_attrs %{amount: 43, item_id: "some updated item_id", order_id: "some updated order_id"}
    @invalid_attrs %{amount: nil, item_id: nil, order_id: nil}

    def orders__items_fixture(attrs \\ %{}) do
      {:ok, orders__items} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Orders.create_orders__items()

      orders__items
    end

    test "list_orders_items/0 returns all orders_items" do
      orders__items = orders__items_fixture()
      assert Orders.list_orders_items() == [orders__items]
    end

    test "get_orders__items!/1 returns the orders__items with given id" do
      orders__items = orders__items_fixture()
      assert Orders.get_orders__items!(orders__items.id) == orders__items
    end

    test "create_orders__items/1 with valid data creates a orders__items" do
      assert {:ok, %Orders_Items{} = orders__items} = Orders.create_orders__items(@valid_attrs)
      assert orders__items.amount == 42
      assert orders__items.item_id == "some item_id"
      assert orders__items.order_id == "some order_id"
    end

    test "create_orders__items/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Orders.create_orders__items(@invalid_attrs)
    end

    test "update_orders__items/2 with valid data updates the orders__items" do
      orders__items = orders__items_fixture()
      assert {:ok, %Orders_Items{} = orders__items} = Orders.update_orders__items(orders__items, @update_attrs)
      assert orders__items.amount == 43
      assert orders__items.item_id == "some updated item_id"
      assert orders__items.order_id == "some updated order_id"
    end

    test "update_orders__items/2 with invalid data returns error changeset" do
      orders__items = orders__items_fixture()
      assert {:error, %Ecto.Changeset{}} = Orders.update_orders__items(orders__items, @invalid_attrs)
      assert orders__items == Orders.get_orders__items!(orders__items.id)
    end

    test "delete_orders__items/1 deletes the orders__items" do
      orders__items = orders__items_fixture()
      assert {:ok, %Orders_Items{}} = Orders.delete_orders__items(orders__items)
      assert_raise Ecto.NoResultsError, fn -> Orders.get_orders__items!(orders__items.id) end
    end

    test "change_orders__items/1 returns a orders__items changeset" do
      orders__items = orders__items_fixture()
      assert %Ecto.Changeset{} = Orders.change_orders__items(orders__items)
    end
  end
end

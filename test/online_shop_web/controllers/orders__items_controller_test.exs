defmodule OnlineShopWeb.Orders_ItemsControllerTest do
  use OnlineShopWeb.ConnCase

  alias OnlineShop.Orders

  @create_attrs %{amount: 42, item_id: "some item_id", order_id: "some order_id"}
  @update_attrs %{amount: 43, item_id: "some updated item_id", order_id: "some updated order_id"}
  @invalid_attrs %{amount: nil, item_id: nil, order_id: nil}

  def fixture(:orders__items) do
    {:ok, orders__items} = Orders.create_orders__items(@create_attrs)
    orders__items
  end

  describe "index" do
    test "lists all orders_items", %{conn: conn} do
      conn = get(conn, Routes.orders__items_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Orders items"
    end
  end

  describe "new orders__items" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.orders__items_path(conn, :new))
      assert html_response(conn, 200) =~ "New Orders  items"
    end
  end

  describe "create orders__items" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.orders__items_path(conn, :create), orders__items: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.orders__items_path(conn, :show, id)

      conn = get(conn, Routes.orders__items_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Orders  items"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.orders__items_path(conn, :create), orders__items: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Orders  items"
    end
  end

  describe "edit orders__items" do
    setup [:create_orders__items]

    test "renders form for editing chosen orders__items", %{conn: conn, orders__items: orders__items} do
      conn = get(conn, Routes.orders__items_path(conn, :edit, orders__items))
      assert html_response(conn, 200) =~ "Edit Orders  items"
    end
  end

  describe "update orders__items" do
    setup [:create_orders__items]

    test "redirects when data is valid", %{conn: conn, orders__items: orders__items} do
      conn = put(conn, Routes.orders__items_path(conn, :update, orders__items), orders__items: @update_attrs)
      assert redirected_to(conn) == Routes.orders__items_path(conn, :show, orders__items)

      conn = get(conn, Routes.orders__items_path(conn, :show, orders__items))
      assert html_response(conn, 200) =~ "some updated item_id"
    end

    test "renders errors when data is invalid", %{conn: conn, orders__items: orders__items} do
      conn = put(conn, Routes.orders__items_path(conn, :update, orders__items), orders__items: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Orders  items"
    end
  end

  describe "delete orders__items" do
    setup [:create_orders__items]

    test "deletes chosen orders__items", %{conn: conn, orders__items: orders__items} do
      conn = delete(conn, Routes.orders__items_path(conn, :delete, orders__items))
      assert redirected_to(conn) == Routes.orders__items_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.orders__items_path(conn, :show, orders__items))
      end
    end
  end

  defp create_orders__items(_) do
    orders__items = fixture(:orders__items)
    %{orders__items: orders__items}
  end
end

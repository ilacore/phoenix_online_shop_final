defmodule OnlineShopWeb.Orders_ItemsController do
  use OnlineShopWeb, :controller

  alias OnlineShop.Orders
  alias OnlineShop.Orders.Orders_Items

  def index(conn, _params) do
    orders_items = Orders.list_orders_items()
    render(conn, "index.html", orders_items: orders_items)
  end

  def new(conn, _params) do
    changeset = Orders.change_orders__items(%Orders_Items{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"orders__items" => orders__items_params}) do
    case Orders.create_orders__items(orders__items_params) do
      {:ok, orders__items} ->
        conn
        |> put_flash(:info, "Orders  items created successfully.")
        |> redirect(to: Routes.orders__items_path(conn, :show, orders__items))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    orders__items = Orders.get_orders__items!(id)
    render(conn, "show.html", orders__items: orders__items)
  end

  def edit(conn, %{"id" => id}) do
    orders__items = Orders.get_orders__items!(id)
    changeset = Orders.change_orders__items(orders__items)
    render(conn, "edit.html", orders__items: orders__items, changeset: changeset)
  end

  def update(conn, %{"id" => id, "orders__items" => orders__items_params}) do
    orders__items = Orders.get_orders__items!(id)

    case Orders.update_orders__items(orders__items, orders__items_params) do
      {:ok, orders__items} ->
        conn
        |> put_flash(:info, "Orders  items updated successfully.")
        |> redirect(to: Routes.orders__items_path(conn, :show, orders__items))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", orders__items: orders__items, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    orders__items = Orders.get_orders__items!(id)
    {:ok, _orders__items} = Orders.delete_orders__items(orders__items)

    conn
    |> put_flash(:info, "Orders  items deleted successfully.")
    |> redirect(to: Routes.orders__items_path(conn, :index))
  end
end

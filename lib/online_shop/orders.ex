defmodule OnlineShop.Orders do
  @moduledoc """
  The Orders context.
  """

  import Ecto.Query, warn: false
  alias OnlineShop.Repo

  alias OnlineShop.Orders.Order

  @doc """
  Returns the list of orders.

  ## Examples

      iex> list_orders()
      [%Order{}, ...]

  """
  def list_orders do
    Repo.all(Order)
  end

  @doc """
  Gets a single order.

  Raises `Ecto.NoResultsError` if the Order does not exist.

  ## Examples

      iex> get_order!(123)
      %Order{}

      iex> get_order!(456)
      ** (Ecto.NoResultsError)

  """
  def get_order!(id), do: Repo.get!(Order, id)

  @doc """
  Creates a order.

  ## Examples

      iex> create_order(%{field: value})
      {:ok, %Order{}}

      iex> create_order(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_order(attrs \\ %{}) do
    %Order{}
    |> Order.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a order.

  ## Examples

      iex> update_order(order, %{field: new_value})
      {:ok, %Order{}}

      iex> update_order(order, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_order(%Order{} = order, attrs) do
    order
    |> Order.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a order.

  ## Examples

      iex> delete_order(order)
      {:ok, %Order{}}

      iex> delete_order(order)
      {:error, %Ecto.Changeset{}}

  """
  def delete_order(%Order{} = order) do
    Repo.delete(order)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking order changes.

  ## Examples

      iex> change_order(order)
      %Ecto.Changeset{data: %Order{}}

  """
  def change_order(%Order{} = order, attrs \\ %{}) do
    Order.changeset(order, attrs)
  end

  alias OnlineShop.Orders.Orders_Items

  @doc """
  Returns the list of orders_items.

  ## Examples

      iex> list_orders_items()
      [%Orders_Items{}, ...]

  """
  def list_orders_items do
    Repo.all(Orders_Items)
  end

  @doc """
  Gets a single orders__items.

  Raises `Ecto.NoResultsError` if the Orders  items does not exist.

  ## Examples

      iex> get_orders__items!(123)
      %Orders_Items{}

      iex> get_orders__items!(456)
      ** (Ecto.NoResultsError)

  """
  def get_orders__items!(id), do: Repo.get!(Orders_Items, id)

  @doc """
  Creates a orders__items.

  ## Examples

      iex> create_orders__items(%{field: value})
      {:ok, %Orders_Items{}}

      iex> create_orders__items(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_orders__items(attrs \\ %{}) do
    %Orders_Items{}
    |> Orders_Items.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a orders__items.

  ## Examples

      iex> update_orders__items(orders__items, %{field: new_value})
      {:ok, %Orders_Items{}}

      iex> update_orders__items(orders__items, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_orders__items(%Orders_Items{} = orders__items, attrs) do
    orders__items
    |> Orders_Items.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a orders__items.

  ## Examples

      iex> delete_orders__items(orders__items)
      {:ok, %Orders_Items{}}

      iex> delete_orders__items(orders__items)
      {:error, %Ecto.Changeset{}}

  """
  def delete_orders__items(%Orders_Items{} = orders__items) do
    Repo.delete(orders__items)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking orders__items changes.

  ## Examples

      iex> change_orders__items(orders__items)
      %Ecto.Changeset{data: %Orders_Items{}}

  """
  def change_orders__items(%Orders_Items{} = orders__items, attrs \\ %{}) do
    Orders_Items.changeset(orders__items, attrs)
  end
end

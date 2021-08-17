defmodule OnlineShop.Orders.Orders_Items do
  use Ecto.Schema
  import Ecto.Changeset

  alias OnlineShop.Shop.Item
  alias OnlineShop.Orders.Order

  @primary_key false
  @foreign_key_type :binary_id

  schema "orders_items" do
    field :amount, :integer
    belongs_to(:item, Item, primary_key: true)
    belongs_to(:order, Order, primary_key: true)

    timestamps()
  end

  def changeset(orders__items, attrs \\ %{}) do
    orders__items
    |> cast(attrs, [:order_id, :item_id, :amount])
    |> validate_required([:order_id, :item_id, :amount])
    |> foreign_key_constraint(:item_id)
    |> foreign_key_constraint(:order_id)
  end
end

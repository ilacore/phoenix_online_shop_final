defmodule OnlineShop.Orders.Order do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "orders" do
    field :name, :string
    field :phone_number, :string
    many_to_many :items, OnlineShop.Shop.Item, join_through: "orders_items", on_replace: :delete # I'm new!

    timestamps()
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:name, :phone_number])
    |> validate_required([:name, :phone_number])
  end
end

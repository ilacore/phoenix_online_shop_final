defmodule OnlineShop.Repo.Migrations.CreateOrdersItems do
  use Ecto.Migration

  def change do
    create table(:orders_items, primary_key: false) do
      add :order_id, references(:orders, on_delete: :delete_all, type: :binary_id), primary_key: true
      add :item_id, references(:items, on_delete: :delete_all, type: :binary_id), primary_key: true
      add :amount, :integer

      timestamps()
    end

  end
end

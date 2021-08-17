defmodule OnlineShop.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string
      add :phone_number, :string

      timestamps()
    end

  end
end

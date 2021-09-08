defmodule VideoGameCollection.Repo.Migrations.AddGame do
  use Ecto.Migration

  def change do
    create table("games") do
      add :name, :string, null: false
      add :publisher, :string, default: "Unnamed Publisher"

      timestamps()
    end
  end
end

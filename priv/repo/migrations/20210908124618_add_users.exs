defmodule VideoGameCollection.Repo.Migrations.AddUsers do
  use Ecto.Migration

  def change do
    create table("users") do
      add :name, :string, null: false
      add :email, :string, null: false
      # Use BCrypt
      add :password_hash, :string, null: false

      timestamps()
    end

    alter table("games") do
      add :user_id, references("users")
    end
  end
end

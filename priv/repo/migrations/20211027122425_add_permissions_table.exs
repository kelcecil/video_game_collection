defmodule VideoGameCollection.Repo.Migrations.AddPermissionsTable do
  use Ecto.Migration
  alias VideoGameCollection.User

  def change do
    create table("permissions") do
      add :owner_id, references(:users)
      add :receipient_id, references(:users)

      timestamps()
    end

    create index(:permissions, [:owner_id, :receipient_id])
  end
end

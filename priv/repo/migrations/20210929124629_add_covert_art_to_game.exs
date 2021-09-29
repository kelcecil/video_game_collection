defmodule VideoGameCollection.Repo.Migrations.AddCovertArtToGame do
  use Ecto.Migration

  def change do
    alter table(:games) do
      add :cover_art_url, :string
    end
  end
end

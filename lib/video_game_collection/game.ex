defmodule VideoGameCollection.Game do
  use Ecto.Schema
  import Ecto.Changeset
  alias VideoGameCollection.User

  schema "games" do
    # Primary id: id
    field :name, :string
    field :publisher, :string
    field :cover_art_url, :string

    # user_id
    belongs_to :user, User

    timestamps()
  end

  def changeset(game, attrs \\ %{}) do
    game
    |> cast(attrs, [:name, :publisher, :cover_art_url])
  end
end

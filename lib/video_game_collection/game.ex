defmodule VideoGameCollection.Game do
  use Ecto.Schema
  import Ecto.Changeset
  alias VideoGameCollection.User

  schema "games" do
    # Primary id: id
    field :name, :string
    field :publisher, :string
    field :cover_art_url, :string

    belongs_to :user, User # user_id

    timestamps()
  end

  def changeset(game, attrs) do
    game
    |> cast(attrs, [:name, :publisher, :cover_art_url])
  end
end

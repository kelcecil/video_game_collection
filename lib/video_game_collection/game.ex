defmodule VideoGameCollection.Game do
  use Ecto.Schema
  import Ecto.Changeset
  alias VideoGameCollection.User

  schema "games" do
    field :name, :string
    field :publisher, :string

    belongs_to :user, User

    timestamps()
  end

  def changeset(game, attrs) do
    game
    |> cast(attrs, [:name, :publisher])
  end
end

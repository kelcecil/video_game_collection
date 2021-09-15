defmodule VideoGameCollection.Collections do
  alias VideoGameCollection.{Game, User}
  alias VideoGameCollection.Repo

  def add(%User{} = user, attrs) do
    user
    |> Ecto.build_assoc(:games)
    |> Game.changeset(attrs)
    |> Repo.insert!()
  end

  def list(%User{id: id}) do
    Repo.get_by(Game, user_id: id)
  end
end

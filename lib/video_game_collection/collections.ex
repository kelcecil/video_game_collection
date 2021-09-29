defmodule VideoGameCollection.Collections do
  alias VideoGameCollection.{Game, User}
  alias VideoGameCollection.Repo

  import Ecto.Query

  def add(%User{} = user, attrs) do
    user
    |> Ecto.build_assoc(:games)
    |> Game.changeset(attrs)
    |> Repo.insert!()
  end

  def list(%User{id: id}) do
    query = from g in Game,
      where: g.user_id == ^id
    Repo.all(query)
  end
end

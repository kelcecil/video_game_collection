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

  def get_by_id(%User{id: user_id} = _user, game_id) do
    query =
      from g in Game,
      where: g.id == ^game_id,
      where: g.user_id == ^user_id

    Repo.one(query)
  end

  def list(%User{id: id}) do
    query = from g in Game,
      where: g.user_id == ^id
    Repo.all(query)
  end
end

defmodule VideoGameCollection.Accounts do
  alias VideoGameCollection.User
  alias VideoGameCollection.Repo

  def create(params) do
    %User{}
    |> User.create_changeset(params)
    |> Repo.insert()
  end

  def get(id) do
    Repo.get(User, id)
  end
end

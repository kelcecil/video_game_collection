defmodule VideoGameCollection.Users do
  alias VideoGameCollection.User
  alias VideoGameCollection.Repo

  def create(params) do
    %User{}
    |> User.create_changeset(params)
    |> Repo.insert()
  end
end

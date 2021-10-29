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

  def share_collection(%User{} = owner, %User{} = guest) do
    user = Repo.preload(owner, :guests)

    user
    |> User.guests_changeset(%{guests: [guest | user.guests]})
    |> Repo.update!()
  end
end

defmodule VideoGameCollection.Accounts do
  alias VideoGameCollection.User
  alias VideoGameCollection.Repo

  import Ecto.Query

  def create(params) do
    %User{}
    |> User.create_changeset(params)
    |> Repo.insert()
  end

  def get(id) do
    User
    |> Repo.get(id)
    |> Repo.preload([:guests])
  end

  def get_by_email(email) do
    Repo.get_by(User, email: email)
  end

  def find_user(name) do
    wildcard = "#{name}%"

    query =
      from u in User,
        where: ilike(u.name, ^wildcard)

    Repo.all(query)
  end

  def share_collection(%User{} = owner, %User{} = guest) do
    user = Repo.preload(owner, :guests)

    user
    |> User.guests_changeset(%{guests: [guest | user.guests]})
    |> Repo.update!()
  end
end

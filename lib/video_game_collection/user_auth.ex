defmodule VideoGameCollection.Accounts.UserAuth do
  alias VideoGameCollection.User
  import Ecto.Query
  alias VideoGameCollection.Repo

  def login(%User{} = user, password) do
    password_hash = user.password_hash

    if password_matches?(password, password_hash) do
      user
    else
      nil
    end
  end

  def login(email, password) do
    query =
      from u in User,
        where: u.email == ^email

    case Repo.one(query) do
      nil -> nil
      user -> login(user, password)
    end
  end

  defp password_matches?(password, password_hash) do
    # Use BCrypt to see if the password matches
    Bcrypt.verify_pass(password, password_hash)
  end
end

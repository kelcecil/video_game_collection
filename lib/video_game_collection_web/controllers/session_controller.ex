defmodule VideoGameCollectionWeb.SessionController do
  use VideoGameCollectionWeb, :controller
  alias VideoGameCollection.Accounts.UserAuth
  alias VideoGameCollection.User

  def new(conn, _param) do
    render(conn, "new.html", error_message: nil)
  end

  def create(conn, %{"session" => %{"email" => email, "password" => password}}) do
    with %User{id: id} <- UserAuth.login(email, password),
     token <- Phoenix.Token.sign(VideoGameCollectionWeb.Endpoint, "randomized_salt", id) do
      conn
      |> configure_session(renew: true)
      |> clear_session()
      |> put_session(:user_token, token)
      |> redirect(to: Routes.collection_path(conn, :index))
    else
      nil ->
        conn
        |> render("new.html", error_message: "Invalid username or password")
    end
  end

  def delete(conn, _params) do
    conn
    |> clear_session()
    |> redirect(to: Routes.page_path(conn, :index))
    |> halt()
  end
end

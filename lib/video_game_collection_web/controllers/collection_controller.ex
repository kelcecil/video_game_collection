defmodule VideoGameCollectionWeb.CollectionController do
  use VideoGameCollectionWeb, :controller
  alias VideoGameCollection.{Collections, Users}
  alias VideoGameCollection.User


  def index(conn, %{"user_id" => user_id} = _params) do
    with %User{} = user <- Users.get(user_id) do
      collection = Collections.list(user)

      conn
      |> put_status(200)
      |> render("index.html", collection: collection, user: user)
    else
      nil ->
        conn
        |> put_status(404)
        |> render(:"404")
      end
  end
end

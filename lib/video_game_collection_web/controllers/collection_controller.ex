defmodule VideoGameCollectionWeb.CollectionController do
  use VideoGameCollectionWeb, :controller
  alias VideoGameCollection.{Collections, Users}
  alias VideoGameCollection.User

  def new(conn, _params) do
    conn
    |> put_status(200)
    |> render("new.html")
  end

  def create(conn, %{"name" => _name, "publisher" => _publisher} = params) do
    user = Users.get(1)
    _collection = Collections.add(user, params)

    conn
    |> redirect(to: Routes.collection_path(conn, :index))
    |> halt()
  end

  def index(conn, _params) do
    # Hardcoded user ID until we look at authorization and authentication
    # and expand our app to multi-user.
    with %User{} = user <- Users.get(1) do
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

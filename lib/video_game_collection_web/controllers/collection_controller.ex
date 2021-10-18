defmodule VideoGameCollectionWeb.CollectionController do
  use VideoGameCollectionWeb, :controller
  alias VideoGameCollection.{Accounts, Collections, Game}
  alias VideoGameCollection.User

  def new(conn, _params) do
    conn
    |> put_status(200)
    |> render("new.html")
  end

  def edit(conn, %{"id" => id}) do
    user = Accounts.get(1)
    game = Collections.get_by_id(user, id)

    changeset = Game.changeset(game)

    render(conn, "edit.html", changeset: changeset, id: id)
  end

  def update(conn, %{"id" => id, "game" => attrs} = params) do
    IO.inspect(params, label: :params)

    user = Accounts.get(1)
    game = Collections.get_by_id(user, id)
    updated_game = Collections.update(game, attrs)

    render(conn, "show.html", game: updated_game)
  end

  def create(conn, %{"name" => _name, "publisher" => _publisher} = params) do
    user = Accounts.get(1)
    game = Collections.add(user, params)

    render(conn, "show.html", game: game)
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get(1)
    game = Collections.get_by_id(user, id)

    conn
    |> put_status(200)
    |> render("show.html", game: game)
  end

  def index(conn, _params) do
    # Hardcoded user ID until we look at authorization and authentication
    # and expand our app to multi-user.
    with %User{} = user <- Accounts.get(1) do
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

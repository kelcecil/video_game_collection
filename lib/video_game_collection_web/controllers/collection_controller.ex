defmodule VideoGameCollectionWeb.CollectionController do
  use VideoGameCollectionWeb, :controller
  alias VideoGameCollection.{Accounts, Collections, Game}

  plug :authenticate_user

  def new(conn, _params) do
    conn
    |> put_status(200)
    |> render("new.html")
  end

  def edit(%{assigns: %{authenticated_user: user}} = conn, %{"id" => id}) do
    game = Collections.get_by_id(user, id)

    changeset = Game.changeset(game)

    render(conn, "edit.html", changeset: changeset, id: id)
  end

  def update(
        %{assigns: %{authenticated_user: user}} = conn,
        %{"id" => id, "game" => attrs} = _params
      ) do
    game = Collections.get_by_id(user, id)
    updated_game = Collections.update(game, attrs)

    render(conn, "show.html", game: updated_game)
  end

  def create(
        %{assigns: %{authenticated_user: user}} = conn,
        %{"name" => _name, "publisher" => _publisher} = params
      ) do
    game = Collections.add(user, params)

    render(conn, "show.html", game: game)
  end

  def show(%{assigns: %{authenticated_user: user}} = conn, %{"id" => id}) do
    game = Collections.get_by_id(user, id)

    conn
    |> put_status(200)
    |> render("show.html", game: game)
  end

  def index(%{assigns: %{authenticated_user: user}} = conn, _params) do
    collection = Collections.list(user)

    conn
    |> put_status(200)
    |> render("index.html",
      collection: collection,
      user: user,
      user_token: get_session(conn, :user_token)
    )
  end

  def authenticate_user(conn, _opts) do
    token = get_session(conn, :user_token)
    {:ok, id} = Phoenix.Token.verify(VideoGameCollectionWeb.Endpoint, "randomized_salt", token)
    assign(conn, :authenticated_user, Accounts.get(id))
  end
end

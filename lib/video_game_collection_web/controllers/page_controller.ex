defmodule VideoGameCollectionWeb.PageController do
  use VideoGameCollectionWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

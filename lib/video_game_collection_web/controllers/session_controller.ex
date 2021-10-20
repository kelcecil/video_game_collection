defmodule VideoGameCollectionWeb.SessionController do
  use VideoGameCollectionWeb, :controller

  def new(conn, _param) do
    render(conn, "new.html")
  end

  def create(conn, _param) do

  end
end

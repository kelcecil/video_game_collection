defmodule VideoGameCollectionWeb.CollectionView do
  use VideoGameCollectionWeb, :view

  def game_card(assigns) do
    ~H"""
    <div class="game-component">
      <div class="image-section">
        <img class="cover-art" src={@cover_art_url} />
      </div>
      <div class="info-section">
        <h3 class="game-title"><%= @name %></h3>
        <p class="console-name">Super Nintendo</p>
        <p><%= @publisher %></p>
      </div>
      <a href={@edit_link}>Edit</a>
    </div>
    """
  end

  defp with_edit_link(conn_or_socket, game) do
    Map.put_new(game, :edit_link, Routes.collection_path(conn_or_socket, :edit, game.id))
  end
end

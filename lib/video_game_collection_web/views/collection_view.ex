defmodule VideoGameCollectionWeb.CollectionView do
  use VideoGameCollectionWeb, :view

  def game_card(assigns) do
    ~H"""
    <div class="game-component">
      <div class="image-section">
        <img src={@cover_art_url} />
      </div>
      <div class="info-section">
        <h3 class="game-title"><%= @name %></h3>
        <p class="console-name">Super Nintendo</p>
        <p><%= @publisher %></p>
      </div>
    </div>
    """
  end
end

defmodule VideoGameCollection.Repo do
  use Ecto.Repo,
    otp_app: :video_game_collection,
    adapter: Ecto.Adapters.Postgres
end

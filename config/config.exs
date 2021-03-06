# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :video_game_collection,
  ecto_repos: [VideoGameCollection.Repo]

# Configures the endpoint
config :video_game_collection, VideoGameCollectionWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Xn23uGZlxBqR1cRgqPH6AqUeSLHzY1Kz68J3ojTDabSggqZNJFLTiIfo+OuqLnBc",
  render_errors: [view: VideoGameCollectionWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: VideoGameCollection.PubSub,
  live_view: [signing_salt: "Ibxkf+8m"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

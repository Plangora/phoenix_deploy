# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

# Configures the endpoint
config :phoenix_deploy, PhoenixDeployWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "yCvlA+eZyJh8a5TT41zu6+8+Ax37S6ZRaqtFNUZENNyBop6DATIifA4JeQN4Jwja",
  render_errors: [view: PhoenixDeployWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhoenixDeploy.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :phoenix_deploy, ecto_repos: [PhoenixDeploy.Repo]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

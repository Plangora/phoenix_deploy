import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :phoenix_deploy, PhoenixDeployWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

config :phoenix_deploy, PhoenixDeploy.Repo,
       database: "phoenix_deploy_test",
       username: "postgres",
       password: "postgres",
       hostname: "localhost"
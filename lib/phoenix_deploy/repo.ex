defmodule PhoenixDeploy.Repo do
  use Ecto.Repo,
    otp_app: :phoenix_deploy,
    adapter: Ecto.Adapters.Postgres
end

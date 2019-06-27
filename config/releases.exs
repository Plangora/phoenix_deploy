import Config

config :phoenix_deploy, PhoenixDeployWeb.Endpoint,
       url: [host: System.get_env("APP_HOST"), port: 4000, scheme: "http"],
       secret_key_base: System.get_env("SECRET_KEY_BASE")
# Deploy Phoenix App on Heroku

## Heroku Setup

Official Phoenix guides cover this. Can check them out [here](https://hexdocs.pm/phoenix/heroku.html#content)

### Buildpacks to Add to Heroku App

```
https://github.com/HashNuke/heroku-buildpack-elixir.git
https://github.com/behe/heroku-buildpack-phoenix-static
https://github.com/gigalixir/gigalixir-buildpack-distillery.git
```

### Set ENV Variables

Copy secret from `config/prod.secret.exs` or generate a new secret with `mix phx.gen.secret` and add ENV variable called `SECRET_KEY_BASE` to Heroku.

## Configure App

### Add Distillery Dep

```elixir
{:distillery, "~> 2.0", warn_missing: false}
```

Setup distillery: `mix release.init`

### Add Procfile
Content: `web: /app/_build/prod/rel/phoenix_deploy/bin/phoenix_deploy foreground`. 

### Update Prod Config

Remove `import_config "prod.secret.exs"` line

Update Endpoint configuration:
```
config :phoenix_deploy, PhoenixDeployWeb.Endpoint,
  http: [:inet6, port: {:system, "PORT"}],
  url: [scheme: "https", host: "phoenix-deploy.herokuapp.com", port: 443],
  force_ssl: [rewrite_on: [:x_forwarded_proto]],
  cache_static_manifest: "priv/static/cache_manifest.json",
  secret_key_base: System.get_env("SECRET_KEY_BASE"),
  server: true
```

### Add Elixir Config file
Filename: `elixir_buildpack.config`
Content:
```
elixir_version=1.8.1
erlang_version=21.3.3
```
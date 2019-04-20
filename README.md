# Deploy Phoenix App on Ubuntu 18.04

Can deploy this app on Digital Ocean \$5 droplet. Apply for \$100 credit with Digital Ocean using [this link](https://m.do.co/c/b880985e5d50)

## Server Setup

### Setup nginx

Install nginx on ubuntu with:
```bash
sudo apt-get install nginx
```

Edit/Create config for proxy pass at [/etc/nginx/sites-enabled/default](https://gist.github.com/HangingClowns/f247ec4dadfa1af18ab0b59cfcaad5e8#file-default)


### Setup Erlang with Elixir
```bash
wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb
sudo dpkg -i erlang-solutions_1.0_all.deb
sudo apt-get install esl-erlang elixir -y
```

### Setup NodeJS for Asset Compile
```bash
sudo apt-get install nodejs npm
```

### Copy Prod Secrets to Server

```bash
scp config/prod.secret.exs user@server.com:/secret/file/location/.
```

## App Setup

### Add Distillery and edeliver to Mix deps
```elixir
defp deps do
  [
    {:edeliver, ">= 1.6.0"},
    {:distillery, "~> 2.0", warn_missing: false}
  ]
end
```

### Update dependencies and generate distillery config
```bash
mix do deps.get, release.init
```

### Setup Edeliver

Create file at [.deliver/config](https://gist.github.com/HangingClowns/f247ec4dadfa1af18ab0b59cfcaad5e8#file-config)

### Deploy and turn on app!

```bash
mix edeliver update production --start-deploy
```
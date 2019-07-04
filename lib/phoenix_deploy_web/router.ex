defmodule PhoenixDeployWeb.Router do
  use PhoenixDeployWeb, :router

  pipeline :browser do
    plug Plug.Logger
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PhoenixDeployWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/", PhoenixDeployWeb do
    get "/health-check", PageController, :health_check
  end

  # Other scopes may use custom stacks.
  # scope "/api", PhoenixDeployWeb do
  #   pipe_through :api
  # end
end

defmodule PhoenixDeployWeb.PageController do
  use PhoenixDeployWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

defmodule PhoenixDeployWeb.PageController do
  use PhoenixDeployWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def health_check(conn, _params) do
    conn
    |> put_resp_content_type("text/html")
    |> text("")
  end
end

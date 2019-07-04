defmodule PhoenixDeployWeb.PageControllerTest do
  use PhoenixDeployWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end

  test "GET /health-check returns 200 response", %{conn: conn} do
    conn = get(conn, "/health-check")
    assert html_response(conn, 200) == ""
  end
end

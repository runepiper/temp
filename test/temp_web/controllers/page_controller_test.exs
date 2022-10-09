defmodule TempWeb.PageControllerTest do
  use TempWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Welcome to Test-Instance!"
  end
end
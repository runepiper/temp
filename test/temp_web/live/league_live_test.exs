defmodule TempWeb.LeagueLiveTest do
  use TempWeb.ConnCase

  import Phoenix.LiveViewTest
  import Temp.EnumFixtures

  @create_attrs %{league: "some league"}
  @update_attrs %{league: "some updated league"}
  @invalid_attrs %{league: nil}

  defp create_league(_) do
    league = league_fixture()
    %{league: league}
  end

  describe "Index" do
    setup [:create_league]

    test "lists all leagues", %{conn: conn, league: league} do
      {:ok, _index_live, html} = live(conn, Routes.league_index_path(conn, :index))

      assert html =~ "Listing Leagues"
      assert html =~ league.league
    end

    test "saves new league", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.league_index_path(conn, :index))

      assert index_live |> element("a", "New League") |> render_click() =~
               "New League"

      assert_patch(index_live, Routes.league_index_path(conn, :new))

      assert index_live
             |> form("#league-form", league: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#league-form", league: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.league_index_path(conn, :index))

      assert html =~ "League created successfully"
      assert html =~ "some league"
    end

    test "updates league in listing", %{conn: conn, league: league} do
      {:ok, index_live, _html} = live(conn, Routes.league_index_path(conn, :index))

      assert index_live |> element("#league-#{league.id} a", "Edit") |> render_click() =~
               "Edit League"

      assert_patch(index_live, Routes.league_index_path(conn, :edit, league))

      assert index_live
             |> form("#league-form", league: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#league-form", league: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.league_index_path(conn, :index))

      assert html =~ "League updated successfully"
      assert html =~ "some updated league"
    end

    test "deletes league in listing", %{conn: conn, league: league} do
      {:ok, index_live, _html} = live(conn, Routes.league_index_path(conn, :index))

      assert index_live |> element("#league-#{league.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#league-#{league.id}")
    end
  end

  describe "Show" do
    setup [:create_league]

    test "displays league", %{conn: conn, league: league} do
      {:ok, _show_live, html} = live(conn, Routes.league_show_path(conn, :show, league))

      assert html =~ "Show League"
      assert html =~ league.league
    end

    test "updates league within modal", %{conn: conn, league: league} do
      {:ok, show_live, _html} = live(conn, Routes.league_show_path(conn, :show, league))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit League"

      assert_patch(show_live, Routes.league_show_path(conn, :edit, league))

      assert show_live
             |> form("#league-form", league: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#league-form", league: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.league_show_path(conn, :show, league))

      assert html =~ "League updated successfully"
      assert html =~ "some updated league"
    end
  end
end

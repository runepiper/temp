defmodule TempWeb.SportLiveTest do
  use TempWeb.ConnCase

  import Phoenix.LiveViewTest
  import Temp.EnumFixtures

  @create_attrs %{sport: "some sport"}
  @update_attrs %{sport: "some updated sport"}
  @invalid_attrs %{sport: nil}

  defp create_sport(_) do
    sport = sport_fixture()
    %{sport: sport}
  end

  describe "Index" do
    setup [:create_sport]

    test "lists all sport", %{conn: conn, sport: sport} do
      {:ok, _index_live, html} = live(conn, Routes.sport_index_path(conn, :index))

      assert html =~ "Listing Sport"
      assert html =~ sport.sport
    end

    test "saves new sport", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.sport_index_path(conn, :index))

      assert index_live |> element("a", "New Sport") |> render_click() =~
               "New Sport"

      assert_patch(index_live, Routes.sport_index_path(conn, :new))

      assert index_live
             |> form("#sport-form", sport: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#sport-form", sport: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.sport_index_path(conn, :index))

      assert html =~ "Sport created successfully"
      assert html =~ "some sport"
    end

    test "updates sport in listing", %{conn: conn, sport: sport} do
      {:ok, index_live, _html} = live(conn, Routes.sport_index_path(conn, :index))

      assert index_live |> element("#sport-#{sport.id} a", "Edit") |> render_click() =~
               "Edit Sport"

      assert_patch(index_live, Routes.sport_index_path(conn, :edit, sport))

      assert index_live
             |> form("#sport-form", sport: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#sport-form", sport: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.sport_index_path(conn, :index))

      assert html =~ "Sport updated successfully"
      assert html =~ "some updated sport"
    end

    test "deletes sport in listing", %{conn: conn, sport: sport} do
      {:ok, index_live, _html} = live(conn, Routes.sport_index_path(conn, :index))

      assert index_live |> element("#sport-#{sport.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#sport-#{sport.id}")
    end
  end

  describe "Show" do
    setup [:create_sport]

    test "displays sport", %{conn: conn, sport: sport} do
      {:ok, _show_live, html} = live(conn, Routes.sport_show_path(conn, :show, sport))

      assert html =~ "Show Sport"
      assert html =~ sport.sport
    end

    test "updates sport within modal", %{conn: conn, sport: sport} do
      {:ok, show_live, _html} = live(conn, Routes.sport_show_path(conn, :show, sport))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Sport"

      assert_patch(show_live, Routes.sport_show_path(conn, :edit, sport))

      assert show_live
             |> form("#sport-form", sport: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#sport-form", sport: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.sport_show_path(conn, :show, sport))

      assert html =~ "Sport updated successfully"
      assert html =~ "some updated sport"
    end
  end
end

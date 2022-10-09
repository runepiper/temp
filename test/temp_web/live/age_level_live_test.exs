defmodule TempWeb.AgeLevelLiveTest do
  use TempWeb.ConnCase

  import Phoenix.LiveViewTest
  import Temp.EnumFixtures

  @create_attrs %{agelevel: "some agelevel"}
  @update_attrs %{agelevel: "some updated agelevel"}
  @invalid_attrs %{agelevel: nil}

  defp create_age_level(_) do
    age_level = age_level_fixture()
    %{age_level: age_level}
  end

  describe "Index" do
    setup [:create_age_level]

    test "lists all agelevels", %{conn: conn, age_level: age_level} do
      {:ok, _index_live, html} = live(conn, Routes.age_level_index_path(conn, :index))

      assert html =~ "Listing Agelevels"
      assert html =~ age_level.agelevel
    end

    test "saves new age_level", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.age_level_index_path(conn, :index))

      assert index_live |> element("a", "New Age level") |> render_click() =~
               "New Age level"

      assert_patch(index_live, Routes.age_level_index_path(conn, :new))

      assert index_live
             |> form("#age_level-form", age_level: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#age_level-form", age_level: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.age_level_index_path(conn, :index))

      assert html =~ "Age level created successfully"
      assert html =~ "some agelevel"
    end

    test "updates age_level in listing", %{conn: conn, age_level: age_level} do
      {:ok, index_live, _html} = live(conn, Routes.age_level_index_path(conn, :index))

      assert index_live |> element("#age_level-#{age_level.id} a", "Edit") |> render_click() =~
               "Edit Age level"

      assert_patch(index_live, Routes.age_level_index_path(conn, :edit, age_level))

      assert index_live
             |> form("#age_level-form", age_level: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#age_level-form", age_level: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.age_level_index_path(conn, :index))

      assert html =~ "Age level updated successfully"
      assert html =~ "some updated agelevel"
    end

    test "deletes age_level in listing", %{conn: conn, age_level: age_level} do
      {:ok, index_live, _html} = live(conn, Routes.age_level_index_path(conn, :index))

      assert index_live |> element("#age_level-#{age_level.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#age_level-#{age_level.id}")
    end
  end

  describe "Show" do
    setup [:create_age_level]

    test "displays age_level", %{conn: conn, age_level: age_level} do
      {:ok, _show_live, html} = live(conn, Routes.age_level_show_path(conn, :show, age_level))

      assert html =~ "Show Age level"
      assert html =~ age_level.agelevel
    end

    test "updates age_level within modal", %{conn: conn, age_level: age_level} do
      {:ok, show_live, _html} = live(conn, Routes.age_level_show_path(conn, :show, age_level))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Age level"

      assert_patch(show_live, Routes.age_level_show_path(conn, :edit, age_level))

      assert show_live
             |> form("#age_level-form", age_level: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#age_level-form", age_level: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.age_level_show_path(conn, :show, age_level))

      assert html =~ "Age level updated successfully"
      assert html =~ "some updated agelevel"
    end
  end
end

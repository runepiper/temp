defmodule TempWeb.GenderLiveTest do
  use TempWeb.ConnCase

  import Phoenix.LiveViewTest
  import Temp.EnumFixtures

  @create_attrs %{gender: "some gender"}
  @update_attrs %{gender: "some updated gender"}
  @invalid_attrs %{gender: nil}

  defp create_gender(_) do
    gender = gender_fixture()
    %{gender: gender}
  end

  describe "Index" do
    setup [:create_gender]

    test "lists all genders", %{conn: conn, gender: gender} do
      {:ok, _index_live, html} = live(conn, Routes.gender_index_path(conn, :index))

      assert html =~ "Listing Genders"
      assert html =~ gender.gender
    end

    test "saves new gender", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.gender_index_path(conn, :index))

      assert index_live |> element("a", "New Gender") |> render_click() =~
               "New Gender"

      assert_patch(index_live, Routes.gender_index_path(conn, :new))

      assert index_live
             |> form("#gender-form", gender: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#gender-form", gender: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.gender_index_path(conn, :index))

      assert html =~ "Gender created successfully"
      assert html =~ "some gender"
    end

    test "updates gender in listing", %{conn: conn, gender: gender} do
      {:ok, index_live, _html} = live(conn, Routes.gender_index_path(conn, :index))

      assert index_live |> element("#gender-#{gender.id} a", "Edit") |> render_click() =~
               "Edit Gender"

      assert_patch(index_live, Routes.gender_index_path(conn, :edit, gender))

      assert index_live
             |> form("#gender-form", gender: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#gender-form", gender: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.gender_index_path(conn, :index))

      assert html =~ "Gender updated successfully"
      assert html =~ "some updated gender"
    end

    test "deletes gender in listing", %{conn: conn, gender: gender} do
      {:ok, index_live, _html} = live(conn, Routes.gender_index_path(conn, :index))

      assert index_live |> element("#gender-#{gender.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#gender-#{gender.id}")
    end
  end

  describe "Show" do
    setup [:create_gender]

    test "displays gender", %{conn: conn, gender: gender} do
      {:ok, _show_live, html} = live(conn, Routes.gender_show_path(conn, :show, gender))

      assert html =~ "Show Gender"
      assert html =~ gender.gender
    end

    test "updates gender within modal", %{conn: conn, gender: gender} do
      {:ok, show_live, _html} = live(conn, Routes.gender_show_path(conn, :show, gender))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Gender"

      assert_patch(show_live, Routes.gender_show_path(conn, :edit, gender))

      assert show_live
             |> form("#gender-form", gender: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#gender-form", gender: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.gender_show_path(conn, :show, gender))

      assert html =~ "Gender updated successfully"
      assert html =~ "some updated gender"
    end
  end
end

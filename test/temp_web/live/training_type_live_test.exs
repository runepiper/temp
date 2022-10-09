defmodule TempWeb.TrainingTypeLiveTest do
  use TempWeb.ConnCase

  import Phoenix.LiveViewTest
  import Temp.EnumFixtures

  @create_attrs %{trainingtype: "some trainingtype"}
  @update_attrs %{trainingtype: "some updated trainingtype"}
  @invalid_attrs %{trainingtype: nil}

  defp create_training_type(_) do
    training_type = training_type_fixture()
    %{training_type: training_type}
  end

  describe "Index" do
    setup [:create_training_type]

    test "lists all trainingtypes", %{conn: conn, training_type: training_type} do
      {:ok, _index_live, html} = live(conn, Routes.training_type_index_path(conn, :index))

      assert html =~ "Listing Trainingtypes"
      assert html =~ training_type.trainingtype
    end

    test "saves new training_type", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.training_type_index_path(conn, :index))

      assert index_live |> element("a", "New Training type") |> render_click() =~
               "New Training type"

      assert_patch(index_live, Routes.training_type_index_path(conn, :new))

      assert index_live
             |> form("#training_type-form", training_type: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#training_type-form", training_type: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.training_type_index_path(conn, :index))

      assert html =~ "Training type created successfully"
      assert html =~ "some trainingtype"
    end

    test "updates training_type in listing", %{conn: conn, training_type: training_type} do
      {:ok, index_live, _html} = live(conn, Routes.training_type_index_path(conn, :index))

      assert index_live |> element("#training_type-#{training_type.id} a", "Edit") |> render_click() =~
               "Edit Training type"

      assert_patch(index_live, Routes.training_type_index_path(conn, :edit, training_type))

      assert index_live
             |> form("#training_type-form", training_type: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#training_type-form", training_type: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.training_type_index_path(conn, :index))

      assert html =~ "Training type updated successfully"
      assert html =~ "some updated trainingtype"
    end

    test "deletes training_type in listing", %{conn: conn, training_type: training_type} do
      {:ok, index_live, _html} = live(conn, Routes.training_type_index_path(conn, :index))

      assert index_live |> element("#training_type-#{training_type.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#training_type-#{training_type.id}")
    end
  end

  describe "Show" do
    setup [:create_training_type]

    test "displays training_type", %{conn: conn, training_type: training_type} do
      {:ok, _show_live, html} = live(conn, Routes.training_type_show_path(conn, :show, training_type))

      assert html =~ "Show Training type"
      assert html =~ training_type.trainingtype
    end

    test "updates training_type within modal", %{conn: conn, training_type: training_type} do
      {:ok, show_live, _html} = live(conn, Routes.training_type_show_path(conn, :show, training_type))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Training type"

      assert_patch(show_live, Routes.training_type_show_path(conn, :edit, training_type))

      assert show_live
             |> form("#training_type-form", training_type: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#training_type-form", training_type: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.training_type_show_path(conn, :show, training_type))

      assert html =~ "Training type updated successfully"
      assert html =~ "some updated trainingtype"
    end
  end
end

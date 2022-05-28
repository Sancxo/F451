defmodule F451Web.ReaderControllerTest do
  use F451Web.ConnCase

  import F451.LibraryFixtures

  @create_attrs %{avatar: "some avatar", first_name: "some first_name", last_name: "some last_name", pseudo: "some pseudo"}
  @update_attrs %{avatar: "some updated avatar", first_name: "some updated first_name", last_name: "some updated last_name", pseudo: "some updated pseudo"}
  @invalid_attrs %{avatar: nil, first_name: nil, last_name: nil, pseudo: nil}

  describe "index" do
    test "lists all readers", %{conn: conn} do
      conn = get(conn, Routes.reader_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Readers"
    end
  end

  describe "new reader" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.reader_path(conn, :new))
      assert html_response(conn, 200) =~ "New Reader"
    end
  end

  describe "create reader" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.reader_path(conn, :create), reader: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.reader_path(conn, :show, id)

      conn = get(conn, Routes.reader_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Reader"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.reader_path(conn, :create), reader: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Reader"
    end
  end

  describe "edit reader" do
    setup [:create_reader]

    test "renders form for editing chosen reader", %{conn: conn, reader: reader} do
      conn = get(conn, Routes.reader_path(conn, :edit, reader))
      assert html_response(conn, 200) =~ "Edit Reader"
    end
  end

  describe "update reader" do
    setup [:create_reader]

    test "redirects when data is valid", %{conn: conn, reader: reader} do
      conn = put(conn, Routes.reader_path(conn, :update, reader), reader: @update_attrs)
      assert redirected_to(conn) == Routes.reader_path(conn, :show, reader)

      conn = get(conn, Routes.reader_path(conn, :show, reader))
      assert html_response(conn, 200) =~ "some updated avatar"
    end

    test "renders errors when data is invalid", %{conn: conn, reader: reader} do
      conn = put(conn, Routes.reader_path(conn, :update, reader), reader: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Reader"
    end
  end

  describe "delete reader" do
    setup [:create_reader]

    test "deletes chosen reader", %{conn: conn, reader: reader} do
      conn = delete(conn, Routes.reader_path(conn, :delete, reader))
      assert redirected_to(conn) == Routes.reader_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.reader_path(conn, :show, reader))
      end
    end
  end

  defp create_reader(_) do
    reader = reader_fixture()
    %{reader: reader}
  end
end

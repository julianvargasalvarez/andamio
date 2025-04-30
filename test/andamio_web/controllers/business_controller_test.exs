defmodule AndamioWeb.BusinessControllerTest do
  use AndamioWeb.ConnCase

  import Andamio.BusinessesFixtures

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  describe "index" do
    test "lists all businesses", %{conn: conn} do
      conn = get(conn, ~p"/businesses")
      assert html_response(conn, 200) =~ "Listing Businesses"
    end
  end

  describe "new business" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/businesses/new")
      assert html_response(conn, 200) =~ "New Business"
    end
  end

  describe "create business" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/businesses", business: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/businesses/#{id}"

      conn = get(conn, ~p"/businesses/#{id}")
      assert html_response(conn, 200) =~ "Business #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/businesses", business: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Business"
    end
  end

  describe "edit business" do
    setup [:create_business]

    test "renders form for editing chosen business", %{conn: conn, business: business} do
      conn = get(conn, ~p"/businesses/#{business}/edit")
      assert html_response(conn, 200) =~ "Edit Business"
    end
  end

  describe "update business" do
    setup [:create_business]

    test "redirects when data is valid", %{conn: conn, business: business} do
      conn = put(conn, ~p"/businesses/#{business}", business: @update_attrs)
      assert redirected_to(conn) == ~p"/businesses/#{business}"

      conn = get(conn, ~p"/businesses/#{business}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, business: business} do
      conn = put(conn, ~p"/businesses/#{business}", business: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Business"
    end
  end

  describe "delete business" do
    setup [:create_business]

    test "deletes chosen business", %{conn: conn, business: business} do
      conn = delete(conn, ~p"/businesses/#{business}")
      assert redirected_to(conn) == ~p"/businesses"

      assert_error_sent 404, fn ->
        get(conn, ~p"/businesses/#{business}")
      end
    end
  end

  defp create_business(_) do
    business = business_fixture()
    %{business: business}
  end
end

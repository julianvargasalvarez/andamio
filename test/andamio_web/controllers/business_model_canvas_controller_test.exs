defmodule AndamioWeb.BusinessModelCanvasControllerTest do
  use AndamioWeb.ConnCase

  import Andamio.BusinessesFixtures

  @update_attrs %{description: "some updated description"}
  @invalid_attrs %{description: nil}

  describe "edit business_model_canvas" do
    setup [:create_business_model_canvas]

    test "renders form for editing chosen business_model_canvas", %{conn: conn, business_model_canvas: business_model_canvas} do
      conn = get(conn, ~p"/businesses/#{business_model_canvas.business_id}/canvas")
      assert html_response(conn, 200) =~ "Edit Business model canvas"
    end
  end

  describe "update business_model_canvas" do
    setup [:create_business_model_canvas]

    test "redirects when data is valid", %{conn: conn, business_model_canvas: business_model_canvas} do
      conn = put(conn, ~p"/businesses/#{business_model_canvas.business_id}/canvas", business_model_canvas: @update_attrs)
      assert redirected_to(conn) == ~p"/businesses/#{business_model_canvas.business_id}/canvas"

      conn = get(conn, ~p"/businesses/#{business_model_canvas.business_id}/canvas")
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, business_model_canvas: business_model_canvas} do
      conn = put(conn, ~p"/businesses/#{business_model_canvas.business_id}/canvas", business_model_canvas: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Business model canvas"
    end
  end

  defp create_business_model_canvas(_) do
    {:ok, business_model_canvas} = business_model_canvas_fixture()
    %{business_model_canvas: business_model_canvas}
  end
end

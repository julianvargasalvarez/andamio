defmodule AndamioWeb.BusinessModelCanvasController do
  use AndamioWeb, :controller
  alias Andamio.Repo

  alias Andamio.Businesses
  alias Andamio.Businesses.BusinessModelCanvas

  def edit(conn, %{"business_id" => business_id}) do
    business_model_canvas = Repo.get_by(BusinessModelCanvas, business_id: business_id)
    changeset = Businesses.change_business_model_canvas(business_model_canvas)
    render(conn, :edit, business_model_canvas: business_model_canvas, changeset: changeset)
  end

  def update(conn, %{"business_id" => business_id, "business_model_canvas" => business_model_canvas_params}) do
    business_model_canvas = Repo.get_by(BusinessModelCanvas, business_id: business_id)

    case Businesses.update_business_model_canvas(business_model_canvas, business_model_canvas_params) do
      {:ok, _business_model_canvas} ->
        conn
        |> put_flash(:info, "Business model canvas updated successfully.")
        |> redirect(to: ~p"/businesses/#{business_id}/canvas")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, business_model_canvas: business_model_canvas, changeset: changeset)
    end
  end

end

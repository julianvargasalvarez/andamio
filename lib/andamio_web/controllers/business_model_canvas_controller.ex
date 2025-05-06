defmodule AndamioWeb.BusinessModelCanvasController do
  use AndamioWeb, :controller

  alias Andamio.Businesses
  alias Andamio.Businesses.Business

  def edit(conn, %{"product_id" => id}) do
    business = Businesses.get_business!(id)
    changeset = Businesses.change_business(business)
    render(conn, :edit, business: business, changeset: changeset)
  end

  def update(conn, %{"id" => id, "business" => business_params}) do
    business = Businesses.get_business!(id)

    case Businesses.update_business(business, business_params) do
      {:ok, business} ->
        conn
        |> put_flash(:info, "Business updated successfully.")
        |> redirect(to: ~p"/businesses/#{business}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, business: business, changeset: changeset)
    end
  end

end

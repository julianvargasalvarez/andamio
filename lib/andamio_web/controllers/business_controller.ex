defmodule AndamioWeb.BusinessController do
  use AndamioWeb, :controller

  alias Andamio.Businesses
  alias Andamio.Businesses.Business

  def index(conn, _params) do
    businesses = Businesses.list_businesses()
    render(conn, :index, businesses: businesses)
  end

  def new(conn, _params) do
    changeset = Businesses.change_business(%Business{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"business" => business_params}) do
    case Businesses.create_business(business_params) do
      {:ok, business} ->
        conn
        |> put_flash(:info, "Business created successfully.")
        |> redirect(to: ~p"/businesses/#{business}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    business = Businesses.get_business!(id)
    render(conn, :show, business: business)
  end

  def edit(conn, %{"id" => id}) do
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

  def delete(conn, %{"id" => id}) do
    business = Businesses.get_business!(id)
    {:ok, _business} = Businesses.delete_business(business)

    conn
    |> put_flash(:info, "Business deleted successfully.")
    |> redirect(to: ~p"/businesses")
  end
end

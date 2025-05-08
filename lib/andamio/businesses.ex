defmodule Andamio.Businesses do
  @moduledoc """
  The Businesses context.
  """

  import Ecto.Query, warn: false
  alias Andamio.Repo

  alias Andamio.Businesses.{Business, BusinessModelCanvas}

  @doc """
  Returns the list of businesses.

  ## Examples

      iex> list_businesses()
      [%Business{}, ...]

  """
  def list_businesses do
    Repo.all(Business)
  end

  @doc """
  Gets a single business.

  Raises `Ecto.NoResultsError` if the Business does not exist.

  ## Examples

      iex> get_business!(123)
      %Business{}

      iex> get_business!(456)
      ** (Ecto.NoResultsError)

  """
  def get_business!(id), do: Repo.get!(Business, id)

  @doc """
  Creates a business.

  ## Examples

      iex> create_business(%{field: value})
      {:ok, %Business{}}

      iex> create_business(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_business(attrs \\ %{}) do
    with {:ok, %Business{} = business} <- %Business{} |> Business.changeset(attrs) |> Repo.insert(),
      {:ok, _} <- create_business_model_canvas(%{business_id: business.id, description: "business model canvas"}) do
     {:ok, business}
    end
  end

  @doc """
  Updates a business.

  ## Examples

      iex> update_business(business, %{field: new_value})
      {:ok, %Business{}}

      iex> update_business(business, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_business(%Business{} = business, attrs) do
    business
    |> Business.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a business.

  ## Examples

      iex> delete_business(business)
      {:ok, %Business{}}

      iex> delete_business(business)
      {:error, %Ecto.Changeset{}}

  """
  def delete_business(%Business{} = business) do
    Repo.delete(business)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking business changes.

  ## Examples

      iex> change_business(business)
      %Ecto.Changeset{data: %Business{}}

  """
  def change_business(%Business{} = business, attrs \\ %{}) do
    Business.changeset(business, attrs)
  end

  alias Andamio.Businesses.BusinessModelCanvas

  @doc """
  Returns the list of business_model_canvases.

  ## Examples

      iex> list_business_model_canvases()
      [%BusinessModelCanvas{}, ...]

  """
  def list_business_model_canvases do
    Repo.all(BusinessModelCanvas)
  end

  @doc """
  Gets a single business_model_canvas.

  Raises `Ecto.NoResultsError` if the Business model canvas does not exist.

  ## Examples

      iex> get_business_model_canvas!(123)
      %BusinessModelCanvas{}

      iex> get_business_model_canvas!(456)
      ** (Ecto.NoResultsError)

  """
  def get_business_model_canvas!(id), do: Repo.get!(BusinessModelCanvas, id)

  @doc """
  Creates a business_model_canvas.

  ## Examples

      iex> create_business_model_canvas(%{field: value})
      {:ok, %BusinessModelCanvas{}}

      iex> create_business_model_canvas(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_business_model_canvas(attrs \\ %{}) do
    %BusinessModelCanvas{}
    |> BusinessModelCanvas.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a business_model_canvas.

  ## Examples

      iex> update_business_model_canvas(business_model_canvas, %{field: new_value})
      {:ok, %BusinessModelCanvas{}}

      iex> update_business_model_canvas(business_model_canvas, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_business_model_canvas(%BusinessModelCanvas{} = business_model_canvas, attrs) do
    business_model_canvas
    |> BusinessModelCanvas.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a business_model_canvas.

  ## Examples

      iex> delete_business_model_canvas(business_model_canvas)
      {:ok, %BusinessModelCanvas{}}

      iex> delete_business_model_canvas(business_model_canvas)
      {:error, %Ecto.Changeset{}}

  """
  def delete_business_model_canvas(%BusinessModelCanvas{} = business_model_canvas) do
    Repo.delete(business_model_canvas)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking business_model_canvas changes.

  ## Examples

      iex> change_business_model_canvas(business_model_canvas)
      %Ecto.Changeset{data: %BusinessModelCanvas{}}

  """
  def change_business_model_canvas(%BusinessModelCanvas{} = business_model_canvas, attrs \\ %{}) do
    BusinessModelCanvas.changeset(business_model_canvas, attrs)
  end
end

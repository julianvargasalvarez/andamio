defmodule Andamio.BusinessesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Andamio.Businesses` context.
  """
  alias Andamio.Businesses.Business
  alias Andamio.Repo

  @doc """
  Generate a business.
  """
  def business_fixture(attrs \\ %{}) do
    {:ok, business} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Andamio.Businesses.create_business()

    business
  end

  @doc """
  Generate a business_model_canvas.
  """
  def business_model_canvas_fixture(attrs \\ %{}) do
    with {:ok, %Business{} = business} <- %Business{} |> Andamio.Businesses.Business.changeset(%{name: "my business"}) |> Repo.insert() do

      attrs
      |> Enum.into(%{
        description: "some description", business_id: business.id
      })
      |> Andamio.Businesses.create_business_model_canvas()

    end
  end
end

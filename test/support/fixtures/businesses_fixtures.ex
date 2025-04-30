defmodule Andamio.BusinessesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Andamio.Businesses` context.
  """

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
end

defmodule Andamio.BusinessesTest do
  use Andamio.DataCase

  alias Andamio.Businesses

  describe "businesses" do
    alias Andamio.Businesses.{Business, BusinessModelCanvas}

    import Andamio.BusinessesFixtures

    @invalid_attrs %{name: nil}

    test "list_businesses/0 returns all businesses" do
      business = business_fixture()
      assert Businesses.list_businesses() == [business]
    end

    test "get_business!/1 returns the business with given id" do
      business = business_fixture()
      assert Businesses.get_business!(business.id) == business
    end

    test "create_business/1 with valid data creates a business and its canvas" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Business{} = business} = Businesses.create_business(valid_attrs)
      assert business.name == "some name"

      # Default model business canvas
      canvas = Repo.get_by(BusinessModelCanvas, business_id: business.id)
      assert canvas !== nil
    end

    test "create_business/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Businesses.create_business(@invalid_attrs)
    end

    test "update_business/2 with valid data updates the business" do
      business = business_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Business{} = business} = Businesses.update_business(business, update_attrs)
      assert business.name == "some updated name"
    end

    test "update_business/2 with invalid data returns error changeset" do
      business = business_fixture()
      assert {:error, %Ecto.Changeset{}} = Businesses.update_business(business, @invalid_attrs)
      assert business == Businesses.get_business!(business.id)
    end

    test "delete_business/1 deletes the business" do
      business = business_fixture()
      assert {:ok, %Business{}} = Businesses.delete_business(business)
      assert_raise Ecto.NoResultsError, fn -> Businesses.get_business!(business.id) end
    end

    test "change_business/1 returns a business changeset" do
      business = business_fixture()
      assert %Ecto.Changeset{} = Businesses.change_business(business)
    end
  end
end

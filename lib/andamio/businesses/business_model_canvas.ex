defmodule Andamio.Businesses.BusinessModelCanvas do
  use Ecto.Schema
  import Ecto.Changeset

  schema "business_model_canvases" do
    field :description, :string
    belongs_to :business, Business

    timestamps(type: :utc_datetime)

  end

  @doc false
  def changeset(business_model_canvas, attrs) do
    business_model_canvas
    |> cast(attrs, [:description, :business_id])
    |> validate_required([:description, :business_id])
  end
end

defmodule AndamioWeb.BusinessModelCanvasHTML do
  use AndamioWeb, :html

  embed_templates "business_model_canvas_html/*"

  @doc """
  Renders a business_model_canvas form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true
  attr :method, :string, required: false

  def business_model_canvas_form(assigns)
end

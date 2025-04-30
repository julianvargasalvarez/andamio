defmodule AndamioWeb.BusinessHTML do
  use AndamioWeb, :html

  embed_templates "business_html/*"

  @doc """
  Renders a business form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def business_form(assigns)
end

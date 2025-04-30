defmodule AndamioWeb.CreateBigCompanyTest do
  use ExUnit.Case, async: false
  use Wallaby.Feature
  import Wallaby.Browser

  feature "User creates a Big Company", %{session: session} do
    session
    |> visit("/businesses")
    |> assert_has(Query.css("body", text: "These are your Big Companies"))
    |> click(Query.button("New Business"))
    |> fill_in(Query.text_field("Name"), with: "My startup")
    |> click(Query.button("Save Business"))
    |> assert_has(Query.text("My startup"))
  end
end

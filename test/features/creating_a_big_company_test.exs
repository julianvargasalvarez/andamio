defmodule AndamioWeb.CreateBigCompanyTest do
  use ExUnit.Case, async: true
  use Wallaby.Feature
  import Wallaby.Browser

  feature "User creates a Big Company", %{session: session} do
    session
    |> visit("/")
    |> assert_has(Query.css("body", text: "These are your Big Companies"))
    |> fill_in(Query.text_field("Name"), with: "My startup")
    |> click(Query.button("Submit"))
    |> assert_has(Query.text("My startup was created"))
  end
end

defmodule AndamioWeb.CreateBigCompanyTest do
  use ExUnit.Case, async: true
  use Wallaby.Feature

  feature "User creates a Big Company", %{session: session} do
    session
    |> visit("/")
    |> assert_has(Query.css("body", text: "These are your Big Companies"))
  end
end

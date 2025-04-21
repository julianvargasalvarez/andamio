defmodule Andamio.UserListTest do
  use ExUnit.Case, async: true
  use Wallaby.Feature

  feature "users have names", %{session: session} do
    session
    |> visit("/users")
    |> assert_has(Query.css(".user-name", text: "Chris"))
  end
end

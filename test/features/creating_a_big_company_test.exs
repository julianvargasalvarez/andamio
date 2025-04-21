defmodule AndamioWeb.CreateBigCompanyTest do
  use ExUnit.Case, async: true
  use Wallaby.Feature

  #setup do
  #  {:ok, session} = Wallaby.start_session()
  #  {:ok, session: session}
  #end


  feature "User creates a Big Company", %{session: session} do
    session
    |> visit("/")
    |> Wallaby.Browser.page_source()
    |> IO.puts()
  end
end

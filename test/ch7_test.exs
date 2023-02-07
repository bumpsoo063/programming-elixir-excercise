defmodule Ch7Test do
  use ExUnit.Case
  doctest Ch7

  test "span" do
    assert Ch7.span(2, 100) == Enum.to_list(2..100)
  end
end

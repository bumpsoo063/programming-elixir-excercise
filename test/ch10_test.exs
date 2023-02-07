defmodule Ch10Test do
  use ExUnit.Case
  doctest Ch10

  test "prime" do
    assert Ch10.prime_list(10) == [2, 3, 5, 7]
  end
  test "prime_2" do
    assert Ch10.prime_list(2) == [2]
  end
  test "prime_3" do
    assert Ch10.prime_list(100) == [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]
  end
  test "tax_1" do
    assert Ch10.tax(%{NC: 0.075, TX: 0.08}, [
      %{id: 123, ship_to: :NC, net_amount: 100.00},
      %{id: 124, ship_to: :OK, net_amount: 35.50},
      %{id: 125, ship_to: :TX, net_amount: 24.00},
      %{id: 126, ship_to: :TX, net_amount: 44.80},
      %{id: 127, ship_to: :NC, net_amount: 25.00},
      %{id: 128, ship_to: :MA, net_amount: 10.00},
      %{id: 129, ship_to: :CA, net_amount: 102.00},
      %{id: 130, ship_to: :NC, net_amount: 50.00}
    ]) == []
    # assert to check values
  end
end

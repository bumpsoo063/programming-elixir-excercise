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
end

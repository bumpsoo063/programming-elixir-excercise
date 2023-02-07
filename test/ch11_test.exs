defmodule Ch11Test do
  use ExUnit.Case
  doctest Ch11

  test "printable_1" do
    assert Ch11.is_printable?('abcdefg') == true
  end
  test "printable_2" do
    assert Ch11.is_printable?('\12') == true
  end
  test "anagram_1" do
    assert Ch11.anagram?('hello', 'llohel') == false
  end
  test "anagram_2" do
    assert Ch11.anagram?('hello', 'heoll') == true
  end
  test "anagram_3" do
    assert Ch11.anagram?('hel', 'heoll') == false
  end
  test "cal_1" do
    assert Ch11.calculate('123 + 123') == 246
  end
end

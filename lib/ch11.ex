defmodule Ch11 do
  @spec is_printable?(charlist) :: boolean
  def is_printable?([]), do: true
  def is_printable?([head | tail]) when 31 < head and head < 127 do
    is_printable?(tail)
  end
  def is_printable?(_), do: false

  @spec anagram?(charlist, charlist) :: boolean
  def anagram?(word1, word2) do
    length(word1) == length(word2) && word2 -- word1 == []
  end
  # 11 - 3
  # [ 'cat' | ['dog']]

  def calculate(list) do
    left = list |> Enum.take_while(fn x -> x in '0123456789' end)
    remainder = list -- left
    oper = for x <- remainder, x in '+-*/', do: x
    right = for x <- remainder, x in '0123456789', do: x
    left = List.to_integer(left)
    right = List.to_integer(right)
    case oper do
      '+' -> left + right
      '-' -> left - right
      '*' -> left * right
      '/' -> left / right
    end
  end
end

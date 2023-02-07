defmodule Ch7 do
  def mapsum([], _), do: []
  def mapsum([head | tail], func) do
    [func.(head) | mapsum(tail, func)]
  end

  def big(a, b) do
    ret = fn
      a, b when a >= b -> a
      _, b -> b
    end
    ret.(a, b)
  end
  defp max_help(a, []), do: a
  defp max_help(a, [head | tail]), do: max_help(big(a, head), tail)
  def max([a, b | tail]), do: max_help(big(a,b), tail)

  defp caesar_help(char, n) do
    func = fn
      (func, char, n) when char + n > 122 -> func.(func,char,n-26)
      (_, char, n) -> char + n
    end
    func.(func, char, n)
  end
  def caesar([], _), do: []
  def caesar([char | tail], n), do: [caesar_help(char, n) | caesar(tail, n)]

  defp span_help(cursor, _, to) when cursor > to, do: []
  defp span_help(cursor, from, to) do
    [cursor | span_help(cursor + 1,from, to) ]
  end
  def span(from, to), do: span_help(from, from, to)
end
